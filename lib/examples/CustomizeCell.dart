import 'package:flutter/material.dart';
import 'package:flutter_webdatarocks/flutter_webdatarocks.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomizeCell extends StatefulWidget {
  const CustomizeCell({super.key});

  @override
  State<CustomizeCell> createState() => _CustomizeCellState();
}

class _CustomizeCellState extends State<CustomizeCell> {
  WebDataRocks pivot =
      WebDataRocks(width: "100%", height: "500", toolbar: true, report: const {
    "dataSource": {
      "dataSourceType": "csv",
      "filename": "https://cdn.webdatarocks.com/data/data.csv"
    }
  });

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      WebViewController controller = await pivot.controller.future;
      pivot.on("reportcomplete", () async {
        await controller.runJavascript('''
        webdatarocks.customizeCell(customizeCellFunction);
        function customizeCellFunction(cell, data) {
              if (data.type == "header" && data.hierarchy && data.hierarchy.caption == "Country" && data.member && data.member.properties) {
                const name = data.member.properties.CurrencyID;
                cell.addClass('fm-custom-cell');
                let flag;
          let style = `<style type="text/css">
          .fm-custom-cell .flag-icon {
            width: 21px !important;
            height: 16px !important;
            margin-left: 0 !important;
            margin-right: 2px !important;
          }
          </style>`;
                if (data.expanded) {
                  flag = `\${style}<i class="fm-icon fm-expanded-icon" title="Click to collapse"></i><img class="flag-icon" src="https://cdn.flexmonster.com/flags/\${name.toLowerCase()}.svg">`;
                } else {
                  flag = `\${style}<i class="fm-icon fm-collapsed-icon" title="Click to expand"></i>
            <img class="flag-icon" src="https://cdn.flexmonster.com/flags/\${name.toLowerCase()}.svg">`;
                }
              cell.text = `\${style}<div style="display:flex; align-items:center; font-size:12px; position:relative;">\${flag}<span style="margin-left: 2px; line-height: 16px;">\${data.member.caption}</span></div>`;
              }
        }''');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [SizedBox(height: 500, child: pivot)]);
  }
}
