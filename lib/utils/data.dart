
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List populars = [
  
  {
    "image": "https://images.unsplash.com/photo-1544025162-d76694265947?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_favorited": true,
    "price": "\$20.50",
    "name": "Cheesy Stake",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "Egg - Salad",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "image": "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjd8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_favorited": false,
    "name": "Greeny Salad",
    "price" : "\$8.50",
    "description": "Breakfast aand Brunch - Juice and Smoothies",
    "time": "15-25 Min",
    "delivery_fee": "\$2.49 Delivery Fee",
    "rate": "4.5",
    "rate_number": "22"
  },
  {
    "image": "https://images.unsplash.com/photo-1533630336171-85a2cde85463?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_favorited": false,
    "price": "\$8.50",
    "name": "Milk Breakfast",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "Egg - Salad",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "image": "https://images.unsplash.com/photo-1559058789-672da06263d8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjd8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_favorited": false,
    "price": "\$6.90",
    "name": "Freshy Salmon",
    "description": "Breakfast and Brunch - Juice and Smoothies",
    "time": "15-25 Min",
    "delivery_fee": "\$2.49 Delivery Fee",
    "rate": "4.4",
    "rate_number": "22"
  },

];

List categories = [
  {
    "name" : "한식",
    "icon" : Icons.rice_bowl
  },
  {
    "name" : "양식",
    "icon" :  FontAwesomeIcons.hamburger
  },
  {
    "name" : "중식",
    "icon" : Icons.ramen_dining
  },
  {
    "name" : "일식",
    "icon" : FontAwesomeIcons.fish
  },
  {
    "name" : "분식",
    "icon" : FontAwesomeIcons.cookie
  },
  {
    "name" : "카페",
    "icon" : FontAwesomeIcons.coffee
  },
];

const List featured = [
  {
    "image": "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_favorited": true,
    "price": "\$18.75",
    "name": "생생조개",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "무한리필 안시켜도 양 많은",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "image":"https://images.unsplash.com/photo-1543339308-43e59d6b73a6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price" : "\$12.50",
    "is_favorited": false,
    "name": "와인어클락 신림점",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "무한리필 안시켜도 양 많은",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.8",
    "rate_number": "273"
  },
  {
    "image": "https://images.unsplash.com/photo-1511909525232-61113c912358?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_favorited": false,
    "name": "칵테일앤드림",
    "price" : "\$15.25",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "무한리필 안시켜도 양 많은",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "image": "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$5.50",
    "name": "미남참치 신림점",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "무한리필 안시켜도 양 많은",
    "is_favorited": true,
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.5",
    "rate_number": "273"
  },
];
