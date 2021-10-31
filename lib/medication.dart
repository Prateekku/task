import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
double _currentSliderValue = 1;
class Medication extends StatefulWidget {
  // Medication({Key? key}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {


  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  @override
  Widget build(BuildContext context) {
     MediaQuery.of(context).size.height;
     MediaQuery.of(context).size.width;
     GestureDetector(
       onTap: ()
       {
         FocusScopeNode currentFocus = FocusScope.of(context);
         if(!currentFocus.hasPrimaryFocus)
         {
           currentFocus.unfocus();
         }
       },
     );
    return Scaffold(
      appBar: AppBar(
        title: Text("medication schedule",),
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context, true);
          }, icon: Icon(Icons.arrow_back))
        ],

      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Pills Name',
                  ),
                ),

            ),
            Padding(
              padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter No. of pills',
                  ),
                ),
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

            //Padding(padding: EdgeInsets.only(top: 10.0)),
              Expanded(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 5,),
                      Text('Time of taking Medicines in a Day ',style: TextStyle(fontSize: 20.0), ),
                      CheckboxListTile(
                        secondary: const Icon(Icons.wb_sunny),
                        title: const Text('Morning'),
                        subtitle: Text('Morning Dose'),
                        value: this.valuefirst,
                        onChanged: (value) {
                          setState(() {
                            this.valuefirst = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        secondary: const Icon(Icons.wb_sunny_sharp),
                        title: const Text('Noon'),
                        subtitle: Text('Afternoon Dose'),
                        value: this.valuesecond,
                        onChanged: (value) {
                          setState(() {
                            this.valuesecond = value!;
                          });
                        },
                      ),

                      CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            secondary: const Icon(Icons.nightlight_round),
                            title: const Text('Night'),
                            subtitle: Text('Night Dose'),
                            value: this.valuethird,
                            onChanged: (value) {
                              setState(() {
                                this.valuethird = value!;
                              });
                            },
                          ),
                    ],
                ),
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
              RaisedButton(
                  textColor: Colors.white,
                    color: Colors.blue,
                        child: Text("Add"),
                     onPressed: (){

                     },
                      ),
                      ],
        ),
      )
    );
  }
}
