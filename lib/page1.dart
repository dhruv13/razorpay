import 'package:flutter/material.dart';
import 'package:razorpay/page2.dart';
import 'package:razorpay/payment.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  List<String> name = ["Bhel","Burger","Ice Cream","Locho","Dhosa","Sandwich","Samosa","Kaju Karry","Roti","Puff","Pizza","Paneer Tikka","Nan","Cock","Ice cream","Lassi","Milk"];
  List<String> price= ["50","55","60","30","110","50","30","180","25","20","599","180","25","80","90","30","30"];
  List<bool> bl = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,];

  late int total = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Zomato Food Menu",style: TextStyle(color: Colors.white),),),
        backgroundColor: Colors.teal,
        elevation: 20,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: name.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${name[index]}"),
                  subtitle: Text("${price[index]}"),

                  trailing: Checkbox(
                      onChanged: (value) {
                        bl[index] = value!;

                        if(bl[index])
                        {
                          total = total + int.parse(price[index]);
                        }
                        else
                        {
                          total = total - int.parse(price[index]);
                          setState(() {});
                        }

                        setState(() {});
                      } ,value: bl[index]
                  ),
                );
              },),
          ),
          Container(
            height: 85,
            width: double.infinity,
            color: Colors.teal,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total   ",style: TextStyle(fontSize: 30,color: Colors.white),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${total}",style: TextStyle(fontSize: 30),),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(onPressed: () {
                          Razorpay razorpay = Razorpay();
                          var options = {
                            'key': 'rzp_live_ILgsfZCZoFIKMb',
                            'amount': '${total}',
                            'name': 'Acme Corp.',
                            'description': 'dhruv',
                            'retry': {'enabled': true, 'max_count': 1},
                            'send_sms_hash': true,
                            'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
                            'external': {
                              'wallets': ['paytm']
                            }
                          };
                          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
                          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
                          razorpay.open(options);
                        }, child:
                               Text("Pay")
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     if(total!=0) {
                        //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (
                        //           context) {
                        //         return payment(ps[total], ti[total]);
                        //       },));
                        //     }
                        //     setState(() {});
                        //
                        //   },
                        //   child:
                        //   Container(
                        //     height: 85,
                        //     width: 80,
                        //     // color: Colors.cyan,
                        //     margin: EdgeInsets.only(left: 50),
                        //     alignment: Alignment.center,
                        //     child: Text("Order Complaint",style: TextStyle(fontSize: 15,color: Colors.white),),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response){
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response){
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message){
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed:  () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return page1();
        },));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
