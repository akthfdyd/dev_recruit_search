import 'dart:async';

import 'package:devsearch/data/common/common_data.dart';
import 'package:devsearch/presentation/result_screen.dart';
import 'package:devsearch/presentation/search_viewmodel.dart';
import 'package:devsearch/util/string_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchScreen extends StatelessWidget {
  String nowUrl = "";

  SearchScreen({Key? key}) : super(key: key);

  final SearchViewModel vm = Get.put(SearchViewModel());
  final TextEditingController urlTextEditingController =
      Get.put(UrlTextEditingController());
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String temp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (vm.techStackIndex >= techStackList.length) {
              print(vm.resultData.toString());
              Get.to(ResultScreen());
              return Container();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  child: FutureBuilder<WebViewController>(
                      future: _controller.future,
                      builder: (BuildContext context,
                          AsyncSnapshot<WebViewController> controller) {
                        if (controller.hasData) {
                          return buildStartButton(controller);
                        }
                        return Container();
                      }),
                ),
                buildGreyLine(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildResultDisplay(),
                ),
                buildGreyLine(),
                Expanded(
                  child: FutureBuilder<WebViewController>(
                    future: _controller.future,
                    builder: (BuildContext context,
                        AsyncSnapshot<WebViewController> controller) {
                      return WebView(
                        initialUrl: "https://www.google.com",
                        debuggingEnabled: true,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated:
                            (WebViewController webViewController) {
                          _controller.complete(webViewController);
                        },
                        onPageFinished: (url) async {
                          nowUrl = url;
                          if (controller.hasData) {
                            await Future.delayed(
                                const Duration(milliseconds: 3000));
                            await controller.data?.runJavascript(
                                recruitServiceList[vm.recruitServiceIndex.value]
                                    .crawlingScript);
                            String? countStr = await controller.data
                                ?.runJavascriptReturningResult(
                                    "getSearchResultCount()");
                            print(
                                "${recruitServiceList[vm.recruitServiceIndex.value].name} $countStr");

                            if (!isNullOrEmpty(countStr) &&
                                resultStringToInt(countStr) != null &&
                                isNullOrEmpty(temp) &&
                                url.contains(recruitServiceList[
                                        vm.recruitServiceIndex.value]
                                    .url)) {
                              temp = countStr ?? "";
                              appendResult(countStr);
                              if (vm.recruitServiceIndex.value >=
                                  recruitServiceList.length - 1) {
                                vm.onNextTechStack();
                              }
                              vm.onNextRecruitService();
                              if (vm.techStackIndex < techStackList.length) {
                                loadSearchPage(controller);
                                temp = "";
                              }
                            }
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  buildStartButton(AsyncSnapshot<WebViewController> controller) {
    return InkWell(
      onTap: () async {
        loadSearchPage(controller);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white54,
        child: Center(
          child: Text("start"),
        ),
      ),
    );
  }

  buildGreyLine() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
  }

  buildResultDisplay() {
    List<Widget> items = [];
    items.add(Text(techStackList[vm.techStackIndex.value]));
    items.add(Text(recruitServiceList[vm.recruitServiceIndex.value].name));
    return items;
  }

  void appendResult(String? countStr) {
    vm.resultData[vm.techStackIndex.value][vm.recruitServiceIndex.value] =
        resultStringToInt(countStr) ?? 0;
  }

  void loadSearchPage(AsyncSnapshot<WebViewController> controller) {
    if (vm.techStackIndex < techStackList.length) {
      String url =
          "${recruitServiceList[vm.recruitServiceIndex.value].url}${techStackList[vm.techStackIndex.value]}";
      controller.data?.loadUrl(url);
    }
  }
}

class UrlTextEditingController extends TextEditingController {}
