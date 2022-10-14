import 'package:flutter/material.dart';
import 'package:flutter_webdatarocks/flutter_webdatarocks.dart';

class UsingApiCalls extends StatelessWidget {
  const UsingApiCalls({Key? key}) : super(key: key);

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

    return Column(
      children: [
        Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
              label: const Text('Open Field List'),
              backgroundColor: const Color.fromARGB(255, 5, 152, 223),
              icon: const Icon(
                Icons.format_line_spacing_outlined,
                size: 24.0,
                color: Color.fromARGB(255, 233, 233, 233),
              ),
              onPressed: () {
                pivot.openFieldsList();
              },
            ),
          ],
        )),
        SizedBox(height: 500, child: pivot),
      ],
    );
  }
}
