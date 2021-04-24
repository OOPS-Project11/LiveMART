import 'package:flutter/material.dart';
import 'package:flutter_app/Models/ItemDetails.dart';
import 'package:flutter_app/components/text_field_container.dart';

class cart extends StatefulWidget {

  String itemname, retailername;
  int qty , index;
  double price , cost;

  cart(this.itemname, this.qty, this.price, this.retailername);

  void addToCart(){
    index = ItemsCart.length +1;
    ItemsCart[index]["name"] = itemname;
    ItemsCart[index]["cost"] = price;
    ItemsCart[index]["quantity"] = qty;
    ItemsCart[index]["shopname"] = retailername;
    ItemsCart[index]["price"] =price;
  }

  @override
  _cartState createState() => _cartState();

}

class _cartState extends State<cart> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('LiveMART | CART')
      ),
      body:ItemList(),
    );
  }
}

class ItemList extends StatefulWidget {

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: ItemsCart.length,
        itemBuilder: (context,index) {
          return SingleItem(
            itemName: ItemsCart[index]["name"],
            itemCost: ItemsCart[index]["cost"],
            quantity: ItemsCart[index]["quantity"],
            retailer: ItemsCart[index]["shopname"],
            totalPrice: ItemsCart[index]["price"],

          );
        });
  }
}

class SingleItem extends StatelessWidget {
  final String itemName,retailer;
  final int quantity;
  final double itemCost,totalPrice;

  const SingleItem({Key key,
    this.itemName,
    this.itemCost,
    this.quantity,
    this.retailer , this.totalPrice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.orangeAccent.withOpacity(0.2),
                        offset: Offset(3, 2),
                        blurRadius: 30)
                  ]),
              child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          "Images/fruits/"+itemName+".jpeg",
                          height: 120,
                          width: 140,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: itemName +
                                      "\n",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                  "\INR $itemCost /kg\n",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: retailer,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              /*TextSpan(
                                  text:inStock=="true"?"In stock \n":"Out of stock \n",
                                  style: TextStyle(
                                      color: inStock=="true"?Colors.green:Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:inStock=="false"? "Available On: "+availableDate+"\n":"\n",
                                  style: TextStyle(
                                      color: inStock=="true"?Colors.green:Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),

                               */
                            ]))
                      ],
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: SizedBox(
                        height: 40,
                          width: 40,
                          child: Text(quantity.toString(),style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 35),
                          ),
                      ),
                    )
                  ]
              )
          ),
        )
    );
  }
}


class addToCart {

  String itemname, retailername;
  int qty , index;
  double price , cost;




}