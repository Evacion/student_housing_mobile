import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterMenu extends StatefulWidget {
  final bool visitorsAllowedSelected;
  final bool petsAllowedSelected;
  final double minPrice;
  final double maxPrice;
  final double minLimitPrice;
  final double maxLimitPrice;
  final String nameFilter;
  final VoidCallback onResetFilters;
  final void Function(Map<String, dynamic>) onUpdateFilters;

  const FilterMenu({
    super.key,
    required this.visitorsAllowedSelected,
    required this.petsAllowedSelected,
    required this.minPrice,
    required this.maxPrice,
    required this.nameFilter,
    required this.onResetFilters,
    required this.onUpdateFilters, required this.minLimitPrice, required this.maxLimitPrice,  
  });

  @override
  State<FilterMenu> createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> {
  late bool _visitorsAllowedSelected;
  late bool _petsAllowedSelected;
  late double _minPrice;
  late double _maxPrice;
  late RangeValues _priceRange;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _visitorsAllowedSelected = widget.visitorsAllowedSelected;
    _petsAllowedSelected = widget.petsAllowedSelected;
    _minPrice = widget.minPrice;
    _maxPrice = widget.maxPrice;
    _priceRange = RangeValues(widget.minPrice, widget.maxPrice);
    _nameController = TextEditingController();
  }

  void _resetFilters() {
    setState(() {
      // Reset all filter values to their default state
      _visitorsAllowedSelected = false;
      _petsAllowedSelected = false;
      _priceRange = RangeValues(widget.minPrice, widget.maxPrice);
      _nameController.clear();
    });
    // Callback to notify the parent widget that filters have been reset
    widget.onResetFilters();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter Values',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: widget.nameFilter,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Price Range: ${_priceRange.start.toInt()} PHP - ${_priceRange.end.toInt()} PHP',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          RangeSlider(
            values: _priceRange,
            onChanged: (values) {
              setState(() {
                _priceRange = values;
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
            min: widget.minLimitPrice,
            max: widget.maxLimitPrice,
            divisions: 100,
            labels: RangeLabels(
              '${_priceRange.start.toInt()}',
              '${_priceRange.end.toInt()}',
            ),
          ),
          
          CheckboxListTile(
            title: const Text('Visitors Allowed'),
            value: _visitorsAllowedSelected,
            onChanged: (value) {
              setState(() {
                _visitorsAllowedSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Pets Allowed'),
            value: _petsAllowedSelected,
            onChanged: (value) {
              setState(() {
                _petsAllowedSelected = value!;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  var data = {
                    'visitorsAllowedSelected': _visitorsAllowedSelected,
                    'petsAllowedSelected': _petsAllowedSelected,
                    'minPrice': _minPrice,
                    'maxPrice': _maxPrice,
                    'nameFilter': _nameController.text,
                  };
                  if (kDebugMode) print(data);
                  widget.onUpdateFilters(data);
                },
                child: const Text('Apply'),
              ),
              ElevatedButton(
                onPressed: _resetFilters,
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
