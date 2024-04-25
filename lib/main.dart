import 'package:flutter/material.dart';
import 'package:ruler_picker_bn/ruler_picker_bn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Height Picker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Height Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int valueCM = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                spreadRadius: -100, // Spread radius
                blurRadius: 25, // Blur radius
                offset: Offset(52, -35), // Changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 70.0), // Add padding to move the widget down
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: '${valueCM.toString().padLeft(3, '0')}',
                            ),
                            TextSpan(
                              text: 'cm',
                              style: TextStyle(
                                fontSize: 20, // Small font size
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius as needed
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius as needed
                            child: SizedBox(
                              width: 150,
                              height: 470,
                              child: RulerPicker(
                                onChange: (val) {
                                  setState(() {
                                    valueCM = val;
                                  });
                                },
                                background: Colors.white,
                                lineColor: Colors.black,
                                direction: Axis.vertical,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -26,
                          top: 208.5,
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 55,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle continue button press, you can navigate to another screen
                        // or perform any other action here, like returning the selected height value.
                        print('Selected height: $valueCM');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 80), // Adjust padding
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
