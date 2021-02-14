import 'package:flutter/material.dart';
import 'package:ioasys/layout/enterprise_entry_item.dart';
import 'package:ioasys/models/enterprise_info.dart';

class BlankPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, cts) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                EnterpriseEntryItemView(
                  company: EnterpriseInfo((b) =>
                      b..enterprise_name = 'Enterprise name swartzenegger'),
                  details: (id) {},
                  cts: cts,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
