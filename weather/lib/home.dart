import 'package:flutter/material.dart';
import 'package:weather/model/json.dart';
import 'package:weather/network/network.dart';
import 'package:weather/ui/bottomview.dart';
import 'package:weather/ui/midview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<WeatherForecastModel> forecast;
  String _cityName ;
  @override
  void initState() {
    super.initState();
    forecast = getWeather(cityName: _cityName);
    // print(forecast);
//   forecast.then((weather) =>{
// print("Fetching Data From Server The Given Data result Is  :${weather.message} ${weather.list[0].weather[0].description}"),
//   });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: ListView(
        children: <Widget>[
          textFieldView(), //search bar

          Container(
            // child: Text("Hello"),
            child: FutureBuilder(
                future: forecast,
                builder: (BuildContext context,
                    AsyncSnapshot<WeatherForecastModel> snapshot) {
                  if (snapshot.hasData) {
                    // return Text("All Good");
                    return Column(
children: <Widget>[
  // midView(snapshot),
  MidView(snapshot: snapshot,),
  // ottomView(snapshot, context)
  BottomView(snapshot: snapshot,)
],
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.redAccent,
                        ),
                      ),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.all(Radius.circular(8))
        // ),
        color: Colors.white,
        child: TextField(
          
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
            _cityName =value;
            forecast = getWeather(cityName: _cityName);
            });
          },
        ),
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) =>new Network().getWeatherForecast(cityName:_cityName);
}
