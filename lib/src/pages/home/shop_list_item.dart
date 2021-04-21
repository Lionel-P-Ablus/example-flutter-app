import 'package:flutter/material.dart';
import 'package:flutter_app/src/constants/api.dart';
import 'package:flutter_app/src/constants/asset.dart';
import 'package:flutter_app/src/model/product_response.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopListItem extends StatelessWidget {
  final Function press;
  final double maxHeight;
  final ProductResponse product;

  const ShopListItem(this.maxHeight, this.product, {Key key, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GestureDetector ใช้ในกรนี้ที่ function นั้นกดไม่ได้ให้เอาตัวนี้ไปครอบ
    return GestureDetector(
      onTap: press,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildImage(),
            Expanded(
              child: _buildInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildInfo() => Padding(
    padding: EdgeInsets.all(6),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          product.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '\$ ${product.price}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${product.stock} prices',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
            )
          ],
        ),
      ],
    ),
  );

  Stack _buildImage() {
    final height = maxHeight * 0.7; // ทำให้เป็น %
    final productImage = product.image;
    return Stack(
      children: [
        productImage != null && productImage.isNotEmpty
            ? Image.network(
          '${API.IMAGE_URL}/$productImage',
          height: height,
          width: double.infinity,
          fit: BoxFit.cover,
        )
            : Image.asset(
          Asset.noPhotoImage,
          height: height,
          width: double.infinity,
        ),
        if (product.stock <= 0)
          Positioned(
            top: 1,
            right: 1,
            child: Card(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.box,
                      size: 15.0,
                      color: Colors.black,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'out of stock',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}