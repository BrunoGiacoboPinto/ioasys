import 'package:auto_size_text/auto_size_text.dart';
import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ioasys/layout/colors.dart';
import 'package:ioasys/models/enterprise_info.dart';

final moneyFormatter = NumberFormat.simpleCurrency(locale: 'pt_BR');

class EnterpriseEntryItemView extends StatelessWidget {
  final EnterpriseInfo company;
  final Function(int) details;
  final BoxConstraints cts;

  const EnterpriseEntryItemView({Key key, this.cts, this.company, this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: cts.w(.0125), vertical: cts.h(.0025)),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'images/stock_bg.jpg',
                ),
                fit: BoxFit.cover)),
        height: cts.h(.25),
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            fit: StackFit.expand,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        company.enterprise_name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: cts.h(.0125),
                      ),
                      Text(
                        company.enterprise_type.enterprise_type_name,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  )),
              Positioned(
                top: cts.h(.2),
                left: cts.w(.03),
                right: cts.w(.03),
                child: Card(
                  color: Colors.white,
                  child: Container(
                    width: cts.w(.92),
                    height: cts.h(.07),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 24,
                                    color: Colors.red[800],
                                  ),
                                ),
                                Text(
                                  '${company.city}/${company.country}',
                                  style:
                                      TextStyle(color: darkGrey, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_upward_outlined,
                                size: 24,
                                color: Colors.green[800],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4.0, right: 8),
                                child: AutoSizeText(
                                  moneyFormatter.format(company.share_price),
                                  minFontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
