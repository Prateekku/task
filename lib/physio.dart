import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
class Physio extends StatefulWidget {
  @override
  _PhysioState createState() => _PhysioState();
}

class _PhysioState extends State<Physio> {
  double _currentSliderValue = 1;
  bool valuefirst = false;
  bool valuesecond = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Physio"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            SizedBox(width: 10,),
            Text('Physio Schedule ',style: TextStyle(fontSize: 20.0), ),
            CheckboxListTile(
              secondary: const Icon(Icons.wb_sunny),
              title: const Text('Morning Schedule'),
              subtitle: Text('Morning Exercise'),
              value: this.valuefirst,
              onChanged: (value) {
                setState(() {
                  this.valuefirst = value!;
                });
                },
            ),
            SizedBox(width: 10,),
            CheckboxListTile(
              secondary: const Icon(Icons.nightlight),
              title: const Text('Evening Schedule'),
              subtitle: Text('Evening Exercise'),
              value: this.valuesecond,
              onChanged: (value) {
                setState(() {
                  this.valuesecond = value!;
                });
              },
            ),
            Text("Number of weeks",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w900),),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 10,
              divisions: 10,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value)
              {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
        DateTimePicker(
          type: DateTimePickerType.dateTimeSeparate,
          initialValue: '',
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          dateLabelText: 'Date',
          timeLabelText: "Hour",
          icon: Icon(Icons.event),
          onChanged: (val) => print(val),
          validator: (val) {
            print(val);
            return null;
          },
          onSaved: (val) => print(val),
        ),
          ],
        ),
      ),
    );
  }
}
