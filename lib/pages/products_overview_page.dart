// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/product_list.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {

  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                value: FilterOptions.Favorite,
                child: Text('Somente favoritos'),               
              ),
              PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Todos'),               
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if(selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
        ],
      ),
      body: ProductGrid(showFavoriteOnly: _showFavoriteOnly),
    );
  }
}
