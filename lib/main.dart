import 'package:flutter/material.dart';

void main() {
  runApp(HomeLoanCalculatorApp());
}

class HomeLoanCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Loan Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeLoanCalculator(),
    );
  }
}

class HomeLoanCalculator extends StatefulWidget {
  @override
  _HomeLoanCalculatorState createState() => _HomeLoanCalculatorState();
}

class _HomeLoanCalculatorState extends State<HomeLoanCalculator> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController interestRateController = TextEditingController();
  final TextEditingController termController = TextEditingController();
  String repaymentFrequency = 'Monthly';
  String repaymentType = 'Principal + Interest';

  void calculateLoan() {
    // loan calculation logic here
  }

  void resetFields() {
    amountController.clear();
    interestRateController.clear();
    termController.clear();
    setState(() {
      repaymentFrequency = 'Monthly';
      repaymentType = 'Principal + Interest';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Loan Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: interestRateController,
              decoration: InputDecoration(
                labelText: 'Interest Rate (%)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: termController,
              decoration: InputDecoration(
                labelText: 'Term (years)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: repaymentFrequency,
              decoration: InputDecoration(
                labelText: 'Repayment Frequency',
                border: OutlineInputBorder(),
              ),
              items: ['Monthly', 'Fortnightly'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  repaymentFrequency = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: repaymentType,
              decoration: InputDecoration(
                labelText: 'Repayment Type',
                border: OutlineInputBorder(),
              ),
              items: ['Principal + Interest', 'Interest Only'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  repaymentType = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: calculateLoan,
                  child: Text('Calculate'),
                ),
                ElevatedButton(
                  onPressed: resetFields,
                  child: Text('Reset'),
                ),
                Text('Ankit Hari Subedi s8074870'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
