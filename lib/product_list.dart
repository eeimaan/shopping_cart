import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class productlist extends StatefulWidget {
  const productlist({super.key});

  @override
  State<productlist> createState() => _productlistState();
}

class _productlistState extends State<productlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          badges.Badge(
            
            badgeContent: Text('0',style: TextStyle(color: Colors.deepPurple),),
            animationDuration: Duration(microseconds: 300),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,size: 30,
            ),
            badgeColor: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        title: const Text(
          'Shop Here !',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(children: []),
    );
  }
}
