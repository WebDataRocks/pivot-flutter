import 'package:flutter/material.dart';
import 'package:flutter_webdatarocks/flutter_webdatarocks.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PivotTableDemo extends StatelessWidget {
  const PivotTableDemo({super.key});

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
          },
          "slice": {
            "rows": [
              {
                "uniqueName": "Country",
                "filter": {
                  "members": [
                    "Country.United Kingdom",
                    "Country.United States"
                  ],
                  "negation": true
                }
              },
              {"uniqueName": "Measures"}
            ],
            "columns": [
              {"uniqueName": "Category"}
            ],
            "measures": [
              {
                "uniqueName": "Price",
                "aggregation": "sum",
                "format": "currency"
              },
              {
                "uniqueName": "Discount",
                "aggregation": "sum",
                "format": "currency"
              }
            ]
          },
          "conditions": [
            {
              "id": "570huw1i",
              "row": -1,
              "column": -1,
              "measure": "",
              "member": "",
              "hierarchy": "",
              "formula": "#value > 350000",
              "format": {"backgroundColor": "#0598df", "color": "#FFFFFF"},
              "formatCSS": "background-color:#0598df;color:#FFFFFF;"
            },
            {
              "id": "570huw1i0",
              "row": -1,
              "column": -1,
              "measure": "",
              "member": "",
              "hierarchy": "",
              "formula": "AND(#value > 1000, #value < 3000)",
              "format": {"backgroundColor": "#f45328", "color": "#FFFFFF"},
              "formatCSS": "background-color:#f45328;color:#FFFFFF;"
            }
          ],
          "formats": [
            {
              "name": "currency",
              "thousandsSeparator": " ",
              "decimalSeparator": ".",
              "decimalPlaces": 0,
              "currencySymbol": "\$",
              "positiveCurrencyFormat": "\$1",
              "nullValue": "-",
              "textAlign": "right",
              "isPercent": false
            }
          ]
        });
    return Column(children: [SizedBox(height: 500, child: pivot)]);
  }
}
