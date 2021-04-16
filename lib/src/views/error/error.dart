import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorView extends StatelessWidget {
  final String text;
  final Function function;

  const ErrorView({Key key, @required this.text, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 159, 105, 1),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 15,
                top: 10
              ),
              margin: EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: 15,
                top: 15
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Center(
                      child: Text('Error',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Text('aaa ajdjhaskufds sadjd fdfsfjj ajdjk dakjja jajdjkd hdhjhdjahj j djsd jjds kajdksjkd jkad jkdaaj kdkj'),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 300, height: 50),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black)
                        ),
                        onPressed: () => {
                          Get.back()
                        },
                        child: Text(
                          'Ok',
                          style: TextStyle(color: Colors.white),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer()
          ],
        )
      )
    );
  }
}
