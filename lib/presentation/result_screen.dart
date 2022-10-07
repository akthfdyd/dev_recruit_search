import 'package:devsearch/data/common/common_data.dart';
import 'package:devsearch/presentation/search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);

  final SearchViewModel vm = Get.put(SearchViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: buildListItems(),
        ),
      ),
    );
  }

  buildListItems() {
    List<Widget> table = [];
    List<Widget> titles = [];
    titles.add(const Expanded(child: Text("")));
    for (int r = 0; r < recruitServiceList.length; r++) {
      titles.add(Expanded(child: Text(recruitServiceList[r].name)));
    }
    table.add(Row(children: titles));
    table.add(buildGreyLine());
    for (int t = 0; t < techStackList.length; t++) {
      List<Widget> items = [];
      items.add(Expanded(child: Text(techStackList[t])));
      for (int r = 0; r < recruitServiceList.length; r++) {
        items.add(Expanded(child: Text("${vm.resultData[t][r]}")));
      }
      table.add(Row(children: items));
      table.add(buildGreyLine());
    }
    return table;
  }

  buildGreyLine() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
  }
}
