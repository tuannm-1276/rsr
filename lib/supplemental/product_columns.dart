import 'package:flutter/cupertino.dart';
import 'package:mcd01/model/product.dart';
import 'package:mcd01/supplemental/product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  final Product bottom, top;

  TwoProductCardColumn({this.bottom, this.top}) : assert(bottom != null);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          const spaceHeight = 44.0;

          double heightOfCards = (constraints.biggest.height - spaceHeight) /
              2.0;
          double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
          double imageAspectRatio = constraints.biggest.width / heightOfImages;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 28.0),
                  child: top != null
                      ? ProductCard(
                    imageAspectRatio: imageAspectRatio,
                    product: bottom,
                  )
                      : SizedBox(
                    height: heightOfCards,
                  )),
              SizedBox(
                height: spaceHeight,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 28.0),
                child: ProductCard(
                  imageAspectRatio: imageAspectRatio,
                  product: bottom,
                ),
              )
            ],
          );
        });
  }
}

class OneProductCardColumn extends StatelessWidget {

  final Product product;

  OneProductCardColumn({this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ProductCard(
          product: product,
        ),
        SizedBox(
          height: 40.0,
        )
      ],
    );
  }
}
