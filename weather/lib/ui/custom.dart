import 'package:flutter/material.dart';



class CustomGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2), 
      itemBuilder: (BuildContext contex ,int index){
        return Card(

        );
      }
      );

  }
}