import 'package:flutter/widgets.dart';

class Animal{
  Color color;
  String name;
  String preamble;
  String text;
  String lifespan;
  int speed;
  Animal(Color color,String name,String preamble,String text,String lifespan,int speed){
    this.color=color;
    this.name=name;
    this.preamble=preamble;
    this.text=text;
    this.lifespan=lifespan;
    this.speed=speed;
  } 
}