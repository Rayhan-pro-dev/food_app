///commented main data
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
   static const routeName="productsview";
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // bool _showOnlyFavorites = false;
  // bool _isinit = true;
  // bool isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  // void didChangeDependencies() {
  //   if (_isinit) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //     Provider.of<Products>(context).fachAndSetProducts()
  //     .then((value) {
  //        setState(() {
  //         isLoading = false;
  //       });
  //     });
  //   }
  //   _isinit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Manager'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              // setState(() {
              //   if (selectedValue == FilterOptions.favorites) {
              //     _showOnlyFavorites = true;
              //   } else {
              //     _showOnlyFavorites = false;
              //   }
              // });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Show All'),
              ),
            ],
          ),
          // Consumer<Cart>(
          //   builder: ((_, cart, ch) =>
          //       Badge(value: cart.itemCount.toString(), child: ch!)),
          //   child: IconButton(
          //     icon: const Icon(Icons.shopping_cart),
          //     onPressed: (() {
          //       Navigator.pushNamed(context, CartScreen.routeName);
          //     }),
          //   ),
          // )
        ],
      ),
      // drawer: const AppDrawer(),
      body: ProductsGrid(),
      // isLoading
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ProductsGrid(_showOnlyFavorites),
    );
  }
}
