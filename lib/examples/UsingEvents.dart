import 'package:flutter/material.dart';
import 'package:flutter_webdatarocks/flutter_webdatarocks.dart';
import 'package:pivot_flutter/uielements/Log.dart';

final List<String> _eventListWithData = [
  "aftergriddraw",
  "beforegriddraw",
  "cellclick",
  "celldoubleclick",
  "datachanged",
  "dataerror",
];
final List<String> _eventListWithoutData = [
  "filteropen",
  "queryerror",
  "datafilecancelled",
  "dataloaded",
  "exportcomplete",
  "exportstart",
  "fieldslistclose",
  "fieldslistopen",
  "filterclose",
  "loadingdata",
  "loadinglocalization",
  "loadingolapstructure",
  "loadingreportfile",
  "localizationerror",
  "localizationloaded",
  "openingreportfile",
  "querycomplete",
  "ready",
  "reportchange",
  "reportcomplete",
  "reportfilecancelled",
  "reportfileerror",
  "runningquery",
  "update"
];

class UsingEvents extends StatefulWidget {
  const UsingEvents({super.key});

  @override
  State<UsingEvents> createState() => _UsingEventsState();
}

class _UsingEventsState extends State<UsingEvents> {
  Widget _lastLog = const Log(
    eventName: "...",
  );

  @override
  Widget build(BuildContext context) {
    WebDataRocks pivot = WebDataRocks(
        width: "100%",
        height: "500",
        toolbar: true,
        report: const {
          "dataSource": {
            "dataSourceType": "csv",
            "filename": "https://cdn.webdatarocks.com/data/data.csv"
          }
        });

    for (String event in _eventListWithoutData) {
      pivot.on(event, () {
        setState(() {
          _lastLog = Log(eventName: event);
        });
      });
    }
    for (String event in _eventListWithData) {
      pivot.on(event, (data) {
        setState(() {
          _lastLog = Log(eventName: event);
        });
      });
    }
    return Column(children: [
      SizedBox(height: 500, child: pivot),
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(17)),
              child: _lastLog))
    ]);
  }
}
