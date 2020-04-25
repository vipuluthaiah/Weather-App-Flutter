import 'package:flutter/material.dart';
import 'package:weather/model/json.dart';
import 'forecastcard.dart';

class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel>snapshot;
final bool reverse;
  const BottomView({Key key, this.snapshot, this.reverse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        "7-Day Weather Info".toUpperCase(),
        style: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.bold),
      ),
      Container(
        height: 180,
        padding: EdgeInsets.symmetric(vertical: 16, ),
        child: ListView.separated(
          // scrollDirection: Axis.horizontal,
          //  scrollDirection: Axis.vertical,
          scrollDirection: Axis.horizontal,
          //  reverse: true,
             separatorBuilder: (context,index) =>SizedBox(width:14.0,), 
             itemCount: snapshot.data.list.length,
            itemBuilder: (context ,index)=>ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: MediaQuery.of(context).size.width /2,
                height: 160,
                child: forecastCard(snapshot ,index),
                decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white,Colors.white]
                ,begin: Alignment.topLeft,end: Alignment.bottomRight
                )
        
                ),
              ),
            ),

             ),
      )
    ],
  );
  }
}

// Widget BottomV(
//     AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
//   var forecastList = snapshot.data.list;

//   return
// }
