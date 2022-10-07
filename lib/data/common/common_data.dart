import 'package:devsearch/domain/entity/recruit_service.dart';

List<RecruitService> recruitServiceList = [
  RecruitService(NAME_JUMPIT, URL_JUMPIT, SCRIPT_JUMPIT),
  RecruitService(NAME_WANTED, URL_WANTED, SCRIPT_WANTED),
  RecruitService(NAME_SARAMIN, URL_SARAMIN, SCRIPT_SARAMIN),
  RecruitService(NAME_JOBKOREA, URL_JOBKOREA, SCRIPT_JOBKOREA),
  RecruitService(NAME_ROCKETPUNCH, URL_ROCKETPUNCH, SCRIPT_ROCKETPUNCH),
];

// section: name
const String NAME_JUMPIT = "점핏";
const String NAME_WANTED = "원티드";
const String NAME_SARAMIN = "사람인";
const String NAME_JOBKOREA = "잡코리아";
const String NAME_ROCKETPUNCH = "로켓펀치";

// section: url
const String URL_JUMPIT = "https://www.jumpit.co.kr/search?keyword=";
const String URL_WANTED = "https://www.wanted.co.kr/search?query=";
const String URL_SARAMIN =
    "https://m.saramin.co.kr/search?searchType=search&searchword=";
const String URL_JOBKOREA = "https://m.jobkorea.co.kr/Search/Adv?Keyword=";
const String URL_ROCKETPUNCH = "https://www.rocketpunch.com/search?keywords=";

// section: script
const String SCRIPT_JUMPIT =
    'function getSearchResultCount(){ return document.getElementsByClassName("title_wrap")[0].children[0].children[1].children[0].innerText; }';
const String SCRIPT_WANTED =
    'function getSearchResultCount(){ return document.getElementsByClassName("Search_searchLabel__fOBpt SearchJobList_jobListLabel__OFBX7")[0].children[0].innerText; }';
const String SCRIPT_SARAMIN =
    'function getSearchResultCount(){ return document.getElementById("recruit_total_count").innerText; }';
const String SCRIPT_JOBKOREA =
    'function getSearchResultCount(){ return document.getElementsByClassName("filter-total_result")[0].innerText; }';
const String SCRIPT_ROCKETPUNCH =
    'function getSearchResultCount(){ return document.getElementsByClassName("ui job items segment company-list")[0].children[0].children[1].innerText; }';

List<String> techStackList = [
  // section: language
  "C++",
  "C#",
  "java",
  "python",
  "javascript",
  "kotlin",
  "PHP",
  "swift",
  "dart",

  // section: mobile platform
  "android",
  "ios",
  "flutter",
  "react native",

  // section: runtime
  "node",
  ".net",

  // section: server framework
  "spring",
  "django",

  // section: js framework
  "react",
  "vue",
  "jquery",

  // section: game client
  "unity",
  "unreal",

  // section: etc
  // "flask",
  // "rails"
  // "bootstrap"
  // "laravel"

  // "c#",
  // "c++",
  // "c",
  // "R",
  // "ruby",
  // "groovy",
  // "fortran",
  // "delphi",
  // "perl",
  // "go",
  // "matlab",
  // "cobol",
  // "scratch",
  // "rust",
  // "objective-c",
  // "lisp",
  // "lua",
  // "scala",
  // "typescript",
  // "haskell",
  // "velilog",
  // "labview",
];
