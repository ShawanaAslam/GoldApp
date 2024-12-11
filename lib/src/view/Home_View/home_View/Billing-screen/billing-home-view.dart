import 'package:flutter/material.dart';

class BillingHomeView extends StatefulWidget {
  String goldPrice;
  String tolaQuantity;
  String gramsQuantity;
  String poinysQuantity;
  double totalPrice;
   BillingHomeView({super.key,
   required this.goldPrice,
     required this.gramsQuantity,
     required this.poinysQuantity,
     required this.tolaQuantity,
     required this.totalPrice

   });

  @override
  State<BillingHomeView> createState() => _BillingHomeViewState();
}

class _BillingHomeViewState extends State<BillingHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text('Tola Price:${widget.goldPrice}')
      ],),
    );
  }
}
