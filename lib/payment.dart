// import 'package:flutter/material.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
//
// class payment extends StatefulWidget {
//   String ps;
//   String ti;
//
//
//   payment(this.ps,this.ti);
//
//
//   @override
//   State<payment> createState() => _paymentState();
// }
//
// class _paymentState extends State<payment> {
//   Razorpay r = Razorpay();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Pay with Razorpay',
//             ),
//             ElevatedButton(onPressed: (){
//               Razorpay razorpay = Razorpay();
//               var options = {
//                 'key': 'rzp_live_ILgsfZCZoFIKMb',
//                 'amount': '${widget.ps}',
//                 'name': 'Acme Corp.',
//                 'description': '${widget.ti}',
//                 'retry': {'enabled': true, 'max_count': 1},
//                 'send_sms_hash': true,
//                 'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//                 'external': {
//                   'wallets': ['paytm']
//                 }
//               };
//               razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
//               razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
//               razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
//               razorpay.open(options);
//             },
//                 child: const Text("Pay with Razorpay")),
//           ],
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   void handlePaymentErrorResponse(PaymentFailureResponse response){
//     /*
//     * PaymentFailureResponse contains three values:
//     * 1. Error Code
//     * 2. Error Description
//     * 3. Metadata
//     * */
//     showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
//   }
//
//   void handlePaymentSuccessResponse(PaymentSuccessResponse response){
//     /*
//     * Payment Success Response contains three values:
//     * 1. Order ID
//     * 2. Payment ID
//     * 3. Signature
//     * */
//     showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
//   }
//
//   void handleExternalWalletSelected(ExternalWalletResponse response){
//     showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
//   }
//
//   void showAlertDialog(BuildContext context, String title, String message){
//     // set up the buttons
//     Widget continueButton = ElevatedButton(
//       child: const Text("Continue"),
//       onPressed:  () {},
//     );
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text(title),
//       content: Text(message),
//       actions: [
//         continueButton,
//       ],
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:razorpay_flutter/razorpay_flutter.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'Pay with Razorpay',
// //             ),
// //             ElevatedButton(onPressed: (){
// //               Razorpay razorpay = Razorpay();
// //               var options = {
// //                 'key': 'rzp_test_ew7WoStD3zIs7N',
// //                 'amount': 100,
// //                 'name': 'Acme Corp.',
// //                 'description': 'Fine T-Shirt',
// //                 'retry': {'enabled': true, 'max_count': 1},
// //                 'send_sms_hash': true,
// //                 'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
// //                 'external': {
// //                   'wallets': ['paytm']
// //                 }
// //               };
// //               razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
// //               razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
// //               razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
// //               razorpay.open(options);
// //             },
// //                 child: const Text("Pay with Razorpay")),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// //
// //   void handlePaymentErrorResponse(PaymentFailureResponse response){
// //     /*
// //     * PaymentFailureResponse contains three values:
// //     * 1. Error Code
// //     * 2. Error Description
// //     * 3. Metadata
// //     * */
// //     showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
// //   }
// //
// //   void handlePaymentSuccessResponse(PaymentSuccessResponse response){
// //     /*
// //     * Payment Success Response contains three values:
// //     * 1. Order ID
// //     * 2. Payment ID
// //     * 3. Signature
// //     * */
// //     showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
// //   }
// //
// //   void handleExternalWalletSelected(ExternalWalletResponse response){
// //     showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
// //   }
// //
// //   void showAlertDialog(BuildContext context, String title, String message){
// //     // set up the buttons
// //     Widget continueButton = ElevatedButton(
// //       child: const Text("Continue"),
// //       onPressed:  () {},
// //     );
// //     // set up the AlertDialog
// //     AlertDialog alert = AlertDialog(
// //       title: Text(title),
// //       content: Text(message),
// //       actions: [
// //         continueButton,
// //       ],
// //     );
// //     // show the dialog
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return alert;
// //       },
// //     );
// //   }
// // }