import 'package:flutter/material.dart';
import 'package:ask_abc/utils/app_localizations.dart';

class BagCalculatorScreen extends StatefulWidget {
  const BagCalculatorScreen({super.key});

  @override
  State<BagCalculatorScreen> createState() => _BagCalculatorScreenState();
}

class _BagCalculatorScreenState extends State<BagCalculatorScreen> {
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _thicknessController = TextEditingController();
  String? _selectedMaterial;
  double? _result;

  final Map<String, double> _materialCoverage = {
    'Cement (50kg)': 0.36, // cubic meters per bag
    'Plaster': 0.5,
    'Paint (20L)': 200, // square meters per can
    'Waterproofing': 1.5, // square meters per liter
  };

  @override
  void dispose() {
    _areaController.dispose();
    _thicknessController.dispose();
    super.dispose();
  }

  void _calculate() {
    final area = double.tryParse(_areaController.text);
    final thickness = double.tryParse(_thicknessController.text) ?? 0.1;

    if (area == null || area <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid area')),
      );
      return;
    }

    if (_selectedMaterial == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a material')),
      );
      return;
    }

    final coverage = _materialCoverage[_selectedMaterial]!;
    double bags;

    if (_selectedMaterial == 'Cement (50kg)') {
      // For cement, calculate based on volume
      final volume = area * (thickness / 100); // Convert cm to meters
      bags = volume / coverage;
    } else {
      // For other materials, calculate based on area
      bags = area / coverage;
    }

    setState(() {
      _result = bags;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.bagCalculator),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.area,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _areaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter area in square feet',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixText: 'sq ft',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Thickness (for cement)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _thicknessController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter thickness in cm',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixText: 'cm',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Material Type',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedMaterial,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: _materialCoverage.keys.map((material) {
                        return DropdownMenuItem(
                          value: material,
                          child: Text(material),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedMaterial = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _calculate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        localizations.calculate,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_result != null) ...[
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                color: Colors.green.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 48,
                        color: Colors.green.shade700,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        localizations.bagsNeeded,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${_result!.ceil()} ${_selectedMaterial!.split('(')[0].trim()} bags/cans',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '(${_result!.toStringAsFixed(2)} exact)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

