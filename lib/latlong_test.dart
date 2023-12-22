
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class Latlongtext extends StatefulWidget {
  const Latlongtext({super.key});

  @override
  State<Latlongtext> createState() => _LatlongtextState();
}

class _LatlongtextState extends State<Latlongtext> {
  String addres='';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("LatlongTest"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(addres),
          GestureDetector(
            onTap: ()async{
              final query = "1600 Amphiteatre Parkway, Mountain View";
              var addresses = await Geocoder.local.findAddressesFromQuery(query);
              var first = addresses.first;
              print("${first.featureName} : ${first.coordinates}");



final coordinate=new Coordinates(33.6992, 72.9744 );
var address =await Geocoder.local.findAddressesFromCoordinates(coordinate);
var fast=address.first;
print("address: "+fast.featureName.toString()+fast.addressLine.toString());
setState(() {
  addres=fast.addressLine.toString() ;
});
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green
              ),
              child: Center(child: Text("Convert")),
            ),
          )
        ],
      ),
    );
  }
}
