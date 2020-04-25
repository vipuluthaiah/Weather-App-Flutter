import 'package:flutter/material.dart';
import 'package:weather/model/json.dart';
import 'package:weather/ui/helper.dart';
import 'package:weather/utlies/forecast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var dateFormated =
        new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$city,$country",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Text(
              "${Util.formatDate(dateFormated)}",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            // Icon(
            //   Icons.wb_sunny,
            //   size: 245,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: getWeatherIcon(
                    weatherDescription: forecastList[0].weather[0].main,
                    color: Colors.white,
                    size: 195),
              ),
            ),
            // Entreprenuer69696969
            // Icon(FontAwesomeIcons.cloud,size: 245,
            // color: Colors.black26,
            // ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${forecastList[0].temp.day.toStringAsFixed(0)}°F ",
                    style: TextStyle(fontSize: 34, color: Colors.white),
                  ),
                  Text(
                    "${forecastList[0].weather[0].description} ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "${forecastList[0].speed.toStringAsFixed(1)} min/h",
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                        Icon(
                          FontAwesomeIcons.wind,
                          size: 24,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    // padding: const EdgeInsets.all(8.0),

                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 12.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              "${forecastList[0].humidity.toStringAsFixed(1)} %",
                              style: TextStyle(
                              color: Colors.white
                            ),
                              ),
                          // Icon(
                          //   Icons.arrow_forward,
                          //   size: 24,
                          //   color: Colors.brown,
                          // )
                          // Image.network("https://image.flaticon.com/icons/svg/2750/2750702.svg",
                          // fit: BoxFit.contain,

                          // ),
                          // Container(
                          //   width: 50,
                          //   height: 50,
                          //   decoration: BoxDecoration(
                          //     shape: BoxShape.rectangle,
                          //     image: DecorationImage(
                          //       image:NetworkImage("https://image.flaticon.com/icons/svg/2750/2750702.svg")
                          //        ,fit: BoxFit.cover,
                          //     )
                          //   ),
                          // )

                          // Icon(FontAwesomeIcons.wind),
                          Icon(
                            FontAwesomeIcons.solidGrinBeamSweat,
                            size: 24,
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 12.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  "${forecastList[0].temp.max.toStringAsFixed(0)} °F",
                                  style: TextStyle(
                              color: Colors.white
                            ),),
                              // Icon(
                              //   Icons.wb_sunny,
                              //   size: 24,
                              //   color: Colors.brown,
                              // )
                              Icon(
                                FontAwesomeIcons.cloudSun,
                                size: 24,
                                color: Colors.redAccent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
//   var forecastList = snapshot.data.list;
//   var city = snapshot.data.city.name;
//   var country = snapshot.data.city.country;
//   var dateFormated = new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
//   Container mideView = Container(
//     child: Padding(
//       padding: const EdgeInsets.all(6.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "$city,$country",
//               style: TextStyle(fontSize: 20, color: Colors.white),
//             ),
//           ),
//           Text(
//             "${Util.formatDate(dateFormated)}",
//             style: TextStyle(fontSize: 16, color: Colors.white),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           // Icon(
//           //   Icons.wb_sunny,
//           //   size: 245,
//           // ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: getWeatherIcon(
//               weatherDescription: forecastList[0].weather[0].main,
//               color: Colors.white,size: 198
//             ),
//           ),
//           // Entreprenuer69696969
//                   // Icon(FontAwesomeIcons.cloud,size: 245,
//                   // color: Colors.black26,
//                   // ),

//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "${forecastList[0].temp.day.toStringAsFixed(0)}°F ",
//                   style: TextStyle(fontSize: 34, color: Colors.white),
//                 ),
//                 Text(
//                   "${forecastList[0].weather[0].description} ",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text("${forecastList[0].speed.toStringAsFixed(1)} min/h"),
//                   Icon(FontAwesomeIcons.wind,size: 24,color: Colors.redAccent,),

//                     ],

//                   ),

//                 ),
//                   Padding(
//             // padding: const EdgeInsets.all(8.0),

//             padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("${forecastList[0].humidity.toStringAsFixed(1)} %"),
//                   // Icon(
//                   //   Icons.arrow_forward,
//                   //   size: 24,
//                   //   color: Colors.brown,
//                   // )
//                   // Image.network("https://image.flaticon.com/icons/svg/2750/2750702.svg",
//                   // fit: BoxFit.contain,

//                   // ),
//                   // Container(
//                   //   width: 50,
//                   //   height: 50,
//                   //   decoration: BoxDecoration(
//                   //     shape: BoxShape.rectangle,
//                   //     image: DecorationImage(
//                   //       image:NetworkImage("https://image.flaticon.com/icons/svg/2750/2750702.svg")
//                   //        ,fit: BoxFit.cover,
//                   //     )
//                   //   ),
//                   // )

//                   // Icon(FontAwesomeIcons.wind),
//                   Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 24,color: Colors.redAccent,),

//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
//             child: Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text("${forecastList[0].temp.max.toStringAsFixed(0)} °F"),
//                       // Icon(
//                       //   Icons.wb_sunny,
//                       //   size: 24,
//                       //   color: Colors.brown,
//                       // )
//                   Icon(FontAwesomeIcons.cloudSun,size: 24,color: Colors.redAccent,),

//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//               ],
//             ),
//           ),

//         ],
//       ),
//     ),
//   );
//   return mideView;
// }
