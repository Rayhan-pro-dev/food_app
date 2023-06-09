import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';


class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(
      {super.key,
      required this.name,
      required this.description,
      required this.id,
      required this.image,
      required this.price});
  final String name;
  final String image;
  final double price;
  final String id;
  final String description;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  bool ismobile(context) {
    var devicesize = MediaQuery.of(context).size.width;
    if (devicesize <= 800) {
      return true;
    } else
      return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        child: MyAppBar(title: "title",),
        preferredSize: const Size.fromHeight(kToolbarHeight),
      ),
      body: Container(
          margin: const EdgeInsets.only(right: 16,),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
              ismobile(context)?Center(
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.contain,
                        height:ismobile(context)?300: 500,
                        width: ismobile(context)?300: 500,
                      ),
                    )
                  :Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                !ismobile(context)?Expanded(
                    flex: 2,
                    child: Center(
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                        height: 500,
                        // width: 500,
                      ),
                    ),
                  ):Container(),
                  // Spacer(),
                  Expanded(
                    flex: ismobile(context)?1:3,
                    child: Container(
                      margin: EdgeInsets.only(top: ismobile(context)?20: 80, left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          "Product Name: ${ widget.name}",
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                          "Availability: In Stock",
                            style: TextStyle(
                                 fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                           "Description:\n\n${widget.description}",
                            style: const TextStyle(
                                // fontSize: 22,
                                ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Price:\$${widget.price.toString()}",
                            style: const TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w600),
                          ),
                           const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          color: Colors.deepOrange,
                                            onPressed: () {},
                                            icon: const Icon(Icons.remove)),
                                        const Text("1"),
                                        IconButton(
                                           color: Colors.deepOrange,
                                            onPressed: () {},
                                            icon: const Icon(Icons.add))
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 4,
                                  child: TextButton(
                                   
                                    onPressed: () {},
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.deepOrange)),
                                    child: const Text("Add to Cart",style: TextStyle(color: Colors.white),),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                            height: 143,
                          ),
              const Text("Releted Products",style: TextStyle(fontSize: 25),)
            ]),
          )),
    );
  }
}
