import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verico/Constants/Constants.dart' as Constants;
import './ordersController.dart';

class PastOrders extends StatelessWidget {
  const PastOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var OrderController = Get.put(OrdersController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: Text("Orders",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(81, 86, 203, 1),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
            future: OrderController.fetchPastOrders(),
            builder: (context, snapshot) => (snapshot.hasData)
                ? GridView.builder(
                    padding: const EdgeInsets.all(5),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: snapshot.data!.ordersList!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Container(
                          width: 100,
                          //http://localhost:3000/products/banners/banner/64340eaf230f720447d2f93c

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                                fit: BoxFit.cover,
                                "${Constants.Url}/products/banners/banner/${snapshot.data!.ordersList![index].productId}"),
                          ),
                        ),
                      );
                    },
                  )
                : CircularProgressIndicator()),
      ],
    );
  }
}
