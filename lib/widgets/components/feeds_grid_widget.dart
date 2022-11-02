import 'package:flutter/material.dart';
import 'package:ecomerce_store_app/model/product_model.dart';
import 'package:ecomerce_store_app/widgets/widget_export.dart';
import 'package:provider/provider.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsList})
      : super(key: key);
  final List<ProductsModel> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.76,
            ),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(
            value: productsList[index],
            child: const FeedsWidget(),
          );
        });
  }
}