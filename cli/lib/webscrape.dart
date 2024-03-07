// ignore_for_file: unused_local_variable

import 'package:chaleno/chaleno.dart';
import 'global.dart' as globals;
void WebScrape() async {
  final chaleno = await Chaleno().load('${globals.WebScrapeLink}');
  Result ids = chaleno!.getElementById('id');
  List<Result> elements = chaleno.getElementsByClassName('classname');
  List<Result>? tags = chaleno.getElementsByTagName('tag');
}