import 'package:flutter/material.dart';
import 'package:razorpay/page1.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.deepOrangeAccent,
                  padding: EdgeInsets.all(5),
                  height: 130,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(" Your Order Is Successful !",style: TextStyle(fontSize: 25),),
                ),
              ),
            ],
          ),SizedBox(
            height: 100,
            width: 100,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return page1();
                  },));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  // color: Colors.cyan,
                  margin: EdgeInsets.only(left: 50),
                  alignment: Alignment.center,
                  child: Text("Go TO Menu",style: TextStyle(fontSize: 12,color: Colors.blueGrey),),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
