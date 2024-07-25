import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController wtController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inController = TextEditingController();

  var result = "";
  var bgColor = Colors.amberAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Your BMI"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Weight"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height (in feet)"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                      label: Text("Enter Your Height (in inch)"),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt != "" && ft != "" && inch != ""){
                      var iwt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt*12) + iInch;

                      var tCm = tInch*2.54;

                      var tM = tCm/100;

                      var bmi = iwt/(tM*tM);

                      var msg = "";

                      if (bmi>25){
                        msg = "You Are Overweight";
                        bgColor = Colors.deepOrangeAccent;
                      } else if(bmi<18){
                        msg = "You Are Underweight";
                        bgColor = Colors.blueAccent;
                      }else{
                        msg = "You Are Healthy!!";
                        bgColor = Colors.greenAccent;
                      }

                      setState(() {
                        result = "\n $msg \n \n Your BMI is : ${bmi.toStringAsFixed(2)}";
                      });

                    }else{
                      setState(() {
                        result = "Enter All Details";
                      });
                    }
                  },
                  child: Text("Calculate"),
                ),

                SizedBox(
                  height: 11,
                ),

                Text(result , style: TextStyle(fontSize: 16),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
