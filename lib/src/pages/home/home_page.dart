import 'package:flutter/material.dart';
import 'package:flutter_app/src/config/app_route.dart';
import 'package:flutter_app/src/model/product_response.dart';
import 'package:flutter_app/src/pages/home/shop_list_item.dart';
import 'package:flutter_app/src/services/network.dart';

import 'common_drawer.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: CommonDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder<List<ProductResponse>>(
        future: NetworkService().productAll(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final productList = snapshot.data;
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4),
              itemBuilder: (context, index) => LayoutBuilder(
                  builder: (context, constraint) => ShopListItem(
                        constraint.maxHeight,
                        productList[index],
                        press: () async {
                          await Navigator.pushNamed(
                            context,
                            AppRoute.managementRoute,
                            arguments: productList[index], // send a data to new page
                          );
                          setState(() {

                          });
                        },
                      )),
              itemCount: productList.length,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () async {
          await Navigator.pushNamed(context, AppRoute.managementRoute);
          setState(() {
            // เสร็จแล้ว ให้ refresh หน้าใหม่
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
