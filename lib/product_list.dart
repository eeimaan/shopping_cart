import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:shopping_cart/cart_model.dart';
import 'package:shopping_cart/cart_provider.dart';
import 'package:shopping_cart/cart_screen.dart';
import 'package:shopping_cart/db_helper.dart';

class productlist extends StatefulWidget {
  const productlist({super.key});

  @override
  State<productlist> createState() => _productlistState();
}

class _productlistState extends State<productlist> {
  List<String> productName = [
    '  Tomatoes ',
    '  Carrots',
    '  Onions',
    '  Ginger',
    '  Capsicum Green',
    '  Fresh Spinach Leaves',
    '  Cauliflower ',
  ];
  List<String> productUnit = [
    '  KG',
    '  KG',
    '  KG',
    '  KG',
    '  KG',
    '  KG',
    '  KG',
  ];
  List<int> productPrice = [170, 205, 160, 409, 504, 150, 167];
  List<String> productImage = [
    'https://cdn.shopify.com/s/files/1/0336/7167/5948/products/image-of-hot-house-red-cluster-tomatoes-fruit-14764460834860_600x600.jpg?v=1616953953',
    'https://cdn.shopify.com/s/files/1/0244/4961/3905/products/carrot.jpg?v=1588226706',
    'https://static.libertyprim.com/files/varietes/oignon-rouge-large.jpg?1569346180',
    'https://www.greenearthorganics.ie/image/cache/data/ginger-web-800x800.jpg',
    'https://freshbuy.pk/wp-content/uploads/2022/11/Capsicum.jpg',
    'https://media.naheed.pk/catalog/product/cache/49dcd5d85f0fa4d590e132d0368d8132/1/2/1212537-1.jpg',
    'https://5.imimg.com/data5/YW/FU/MY-46595757/fresh-cauliflower-28gobhi-29-281kg-29-500x500.png',
  ];

  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      //backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartScreen()));
            },
            child: badges.Badge(
              badgeContent: Consumer<CartProvider>(
                builder: (context, value, Widget? child) {
                  return Text(
                    value.getCounter().toString(),
                    style: const TextStyle(color: Colors.green),
                  );
                },
              ),
              animationDuration: const Duration(microseconds: 300),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 30,
              ),
              badgeColor: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: const Text(
          'Shop Here !',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                height: 100,
                                width: 100,
                                image: NetworkImage(
                                    productImage[index].toString()),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productName[index].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      productUnit[index].toString() +
                                          " " +
                                          r"$" +
                                          productPrice[index].toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          print(index);
                                          print(index);
                                          print(productName[index].toString());
                                          print(productPrice[index].toString());
                                          print(productPrice[index]);
                                          print('1');
                                          print(productUnit[index].toString());
                                          print(productImage[index].toString());

                                          dbHelper!
                                              .insert(Cart(
                                                  id: index,
                                                  productId: index.toString(),
                                                  productName:
                                                      productName[index]
                                                          .toString(),
                                                  initialPrice:
                                                      productPrice[index],
                                                  productPrice:
                                                      productPrice[index],
                                                  quantity: 1,
                                                  unitTag: productUnit[index]
                                                      .toString(),
                                                  image: productImage[index]
                                                      .toString()))
                                              .then((value) {
                                            cart.addTotalPrice(double.parse(
                                                productPrice[index]
                                                    .toString()));
                                            cart.addCounter();

                                            const snackBar = SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  'Product is added to cart'),
                                              duration: Duration(seconds: 1),
                                            );

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }).onError((error, stackTrace) {
                                            print("error" + error.toString());
                                            const snackBar = SnackBar(
                                                backgroundColor: Colors.red,
                                                content: Text(
                                                    'Product is already added in cart'),
                                                duration: Duration(seconds: 1));

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          });
                                        },
                                        child: Container(
                                          height: 35,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Center(
                                            child: Text(
                                              'Add to cart',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
