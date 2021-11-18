// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter/foundation.dart';
// import 'package:demo/meta/meta.dart';
//
// enum Gender {
//   male,
//   female,
// }
// Gender selectedGender;
//
// const kActiveColor = Color(0xffd50100);
// const kInactiveColor = Color(0xff2b3131);
// Color femaleCont = kActiveColor;
// Color maleCont = kInactiveColor;
//
// const kLabelText = TextStyle(fontSize: 18.0);
// const kNumberText = TextStyle(
//   fontSize: 45.0,
//   fontWeight: FontWeight.bold,
// );
// int height = 170;
// int weight = 60;
// int age = 25;
//
// class InputPage extends StatefulWidget {
//   const InputPage({Key? key}) : super(key: key);
//
//   @override
//   _InputPageState createState() => _InputPageState();
// }
//
// class _InputPageState extends State<InputPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BMI CALCULATOR'),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ReusableContainer(
//                       otp: () {
//                         setState(() {
//                           selectedGender = Gender.male;
//                         });
//                       },
//                       customChild: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Icon(
//                             FontAwesomeIcons.mars,
//                             size: 75,
//                           ),
//                           SizedBox(
//                             height: 12,
//                           ),
//                           Text(
//                             'MALE',
//                             style: kLabelText,
//                           ),
//                         ],
//                       ),
//                       contColor: selectedGender == Gender.male
//                           ? kActiveColor
//                           : kInactiveColor,
//                     ),
//                   ),
//                   Expanded(
//                     child: ReusableContainer(
//                       otp: () {
//                         setState(() {
//                           selectedGender = Gender.female;
//                         });
//                       },
//                       customChild: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Icon(
//                             FontAwesomeIcons.venus,
//                             size: 75,
//                           ),
//                           SizedBox(
//                             height: 12,
//                           ),
//                           Text(
//                             'FEMALE',
//                             style: kLabelText,
//                           ),
//                         ],
//                       ),
//                       contColor: selectedGender == Gender.female
//                           ? kActiveColor
//                           : kInactiveColor,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ReusableContainer(
//                       contColor: kInactiveColor,
//                       customChild: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             'SELECT HEIGHT',
//                             style: kLabelText,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.baseline,
//                             textBaseline: TextBaseline.alphabetic,
//                             children: <Widget>[
//                               Text(
//                                 height.toString(),
//                                 style: kNumberText,
//                               ),
//                               Text(
//                                 'CM',
//                                 style: kLabelText,
//                               ),
//                             ],
//                           ),
//                           SliderTheme(
//                             data: SliderTheme.of(context).copyWith(
//                               thumbShape: RoundSliderThumbShape(
//                                   enabledThumbRadius: 16.0),
//                               thumbColor: kInactiveColor,
//                               overlayShape:
//                                   RoundSliderOverlayShape(overlayRadius: 32.0),
//                               activeTrackColor: Colors.white,
//                               inactiveTrackColor: Colors.green,
//                             ),
//                             child: Slider(
//                               value: height.toDouble(),
//                               min: 120.0,
//                               max: 220.0,
//                               onChanged: (double changeHeight) {
//                                 setState(() {
//                                   height = changeHeight.round();
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: ReusableContainer(
//                       contColor: kInactiveColor,
//                       customChild: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             'WEIGHT',
//                             style: kLabelText,
//                           ),
//                           Text(
//                             weight.toString(),
//                             style: kNumberText,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               buttonPlusMinus(
//                                 buttonIcon: FontAwesomeIcons.minus,
//                                 onPress: () {
//                                   setState(() {
//                                     weight--;
//                                   });
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 10.0,
//                               ),
//                               buttonPlusMinus(
//                                 buttonIcon: FontAwesomeIcons.plus,
//                                 onPress: () {
//                                   setState(() {
//                                     weight++;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: ReusableContainer(
//                       contColor: kInactiveColor,
//                       customChild: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Text(
//                             'AGE',
//                             style: kLabelText,
//                           ),
//                           Text(
//                             age.toString(),
//                             style: kNumberText,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               buttonPlusMinus(
//                                 buttonIcon: FontAwesomeIcons.minus,
//                                 onPress: () {
//                                   setState(() {
//                                     age--;
//                                   });
//                                 },
//                               ),
//                               SizedBox(
//                                 width: 10.0,
//                               ),
//                               buttonPlusMinus(
//                                 buttonIcon: FontAwesomeIcons.plus,
//                                 onPress: () {
//                                   setState(() {
//                                     age++;
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: Center(child: Text('CALCULATE RESULTS', style: TextStyle(fontSize: 25),),),
//               height: 75.0,
//               width: double.infinity,
//               color: Color(0xffd50100),
//               margin: EdgeInsets.only(top: 18.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class buttonPlusMinus extends StatelessWidget {
//   buttonPlusMinus({this.buttonIcon, this.onPress});
//   final IconData? buttonIcon;
//   final Function()? onPress;
//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       child: Icon(buttonIcon),
//       onPressed: onPress,
//       fillColor: kInactiveColor,
//       constraints: BoxConstraints.tightFor(
//         width: 44.0,
//         height: 44.0,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(6.0),
//       ),
//     );
//   }
// }
//
// class ReusableContainer extends StatelessWidget {
//   const ReusableContainer(
//       {@required this.contColor,
//       @required this.customChild,
//       @required this.otp});
//   final Color? contColor;
//   final Widget? customChild;
//   final Function()? otp;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: otp,
//       child: Container(
//         child: customChild,
//         margin: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//             color: contColor, borderRadius: BorderRadius.circular(15.0)),
//       ),
//     );
//   }
// }
