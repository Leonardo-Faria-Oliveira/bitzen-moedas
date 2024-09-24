import 'package:bitzen_moedas/enums/periods.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterDropdown extends StatefulWidget {

  Periods selectedPeriod;
  final List<Periods> periods;

  final void Function(Periods?) onSelected;
  
  FilterDropdown({super.key, required this.periods, required this.selectedPeriod, required this.onSelected});

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {

  void onSelected(Periods? value) async{
    widget.onSelected(value);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Periods>(
      onSelected: (Periods? value) {
        onSelected(value);
      },
      enableFilter: false,
      enableSearch: false,
      controller: TextEditingController(
        text: widget.selectedPeriod.label,
      ),
      width: 260,  
      initialSelection: widget.periods.first,
      dropdownMenuEntries: Periods.values.map((Periods value) {
        return DropdownMenuEntry<Periods>(value: value, label: value.label);
      }).toList(),
    );
  }
}
