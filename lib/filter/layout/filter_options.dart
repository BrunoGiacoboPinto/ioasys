import 'package:flutter/material.dart';
import 'package:ioasys/layout/colors.dart';

class FilterOptionsList extends StatefulWidget {
  final Function(int, String) selected;
  final BoxConstraints cts;

  const FilterOptionsList({Key key, this.selected, this.cts}) : super(key: key);

  @override
  _FilterOptionsListState createState() => _FilterOptionsListState();
}

class _FilterOptionsListState extends State<FilterOptionsList> {
  /*
  * Unfortunately, there is no endpoint to get enterprise category info :(
  * */

  final _filterOptions = [
    {'id': 11, 'enterprise_type_name': 'Software'},
    {'id': 5, 'enterprise_type_name': 'Biotechnology'},
    {'id': 12, 'enterprise_type_name': 'Service'},
    {'id': 7, 'enterprise_type_name': 'IT'},
    {'id': 6, 'enterprise_type_name': 'HR Tech'},
    {'id': 24, 'enterprise_type_name': 'Transport'},
    {'id': 15, 'enterprise_type_name': 'Games'},
    {'id': 16, 'enterprise_type_name': 'Food'},
    {'id': 26, 'enterprise_type_name': 'IoT'},
    {'id': 21, 'enterprise_type_name': 'Marketplace'},
    {'id': 13, 'enterprise_type_name': 'Social'},
    {'id': 27, 'enterprise_type_name': 'Music'},
    {'id': 3, 'enterprise_type_name': 'Health'},
    {'id': 19, 'enterprise_type_name': 'Sports'},
    {'id': 23, 'enterprise_type_name': 'Industry'},
    {'id': 4, 'enterprise_type_name': 'Construction'},
    {'id': 2, 'enterprise_type_name': 'Fintech'},
    {'id': 10, 'enterprise_type_name': 'Education'},
    {'id': 28, 'enterprise_type_name': 'Green'}
  ];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List<Widget>.generate(_filterOptions.length, (index) {
        final data = _filterOptions[index];

        return CheckboxListTile(
            activeColor: lightPink,
            title: Text(
              data['enterprise_type_name'],
              style: TextStyle(color: darkGrey, fontSize: 18),
            ),
            value: index == _selectedIndex,
            onChanged: (val) {
              setState(() {
                _selectedIndex = index;
                widget.selected(data['id'], data['enterprise_type_name']);
              });
            });
      }),
    );
  }
}
