import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/model/json.dart';
import 'package:weather/ui/helper.dart';
import 'package:weather/utlies/forecast.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.formatDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[Saturday,Dec 14,2019]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(dayOfWeek)
        ),
        
      ),
            Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              weatherDescription: forecastList[index].weather[0].main,
              size: 45,
            ),
          ),
          // getWeatherIcon(
          //     weatherDescription: forecastList[index].weather[0].main,
          //     color: Colors.pinkAccent,
          //     size: 45),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].temp.min.toStringAsFixed(0)} °F",
                        
                        ),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 17,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${forecastList[index].temp.max.toStringAsFixed(0)} °F"),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.white,
                      size: 17,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Hum:${forecastList[index].humidity.toStringAsFixed(0)} %"),
//                     Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white,
//                       size: 17,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Win:${forecastList[index].speed.toStringAsFixed(1)} mi/h"),
//                     Icon(FontAwesomeIcons.wind, color: Colors.white,
//                       size: 17,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
  
     

    ],
  );
}