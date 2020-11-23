import 'package:eazy_pay/Sigin.dart';
import 'package:eazy_pay/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
const kCnactiveCardcolor=Color(0xFF5f6f2e);
const kActiveCardColour=Color(0xFF9bcd9b);
const kLabelTextStyle=TextStyle(
  fontSize: 18.0,
  color: Color(0xFF014133),
);
enum Gender{
  mael,
  famel,
}
class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  Gender oopGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5f6f2e),

        title: Text('EZY SCAN'),
      ),
      body: SafeArea(

        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    child: Image.asset('Image/ezy-scan.png'),
                    radius: 50.0,
                     backgroundColor: Colors.white,
                  ),
                ),
        SizedBox(
          width: 100.0,
          child: TextLiquidFill(
            text: 'EZY-SCAN',
            waveColor: Color(0xFF014133),
            boxBackgroundColor: Color(0xFF5f6f2e),
            textStyle: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 100.0,
          ),
        )
            ],
              ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading:Icon(FontAwesomeIcons.heartbeat,
                color: Color(0xFF9bcd9b),
                ),
                title: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
              SizedBox(
                width: 5.0,
                height: 5.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.heart,
                  color: Color(0xFF9bcd9b),
                  ),
                   title: TextField(
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Last Name',
                hintStyle: TextStyle(
                 fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white54,
                  ),
                  ),
                 ),
                 ),
               ),
              SizedBox(
                width: 5.0,
                height: 5.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.mail,
                    color: Color(0xFF9bcd9b),
                  ),
                  title: TextField(
               decoration: InputDecoration(
                border: InputBorder.none,
               hintText: 'Your Email',
                hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 20.0,
                color: Colors.white54,
                ),
               ),
              ),
               ),
              ),
              SizedBox(
                width: 5.0,
                height: 5.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.vpn_key_outlined,
                  color: Color(0xFF9bcd9b),
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                       hintText: 'Password',
                     hintStyle: TextStyle(
                     fontWeight: FontWeight.bold,
                         fontSize: 20.0,
                      color: Colors.white54,
                 ),
                 ),
                 ),
                   ),
                 ),
              SizedBox(
                width: 5.0,
                height: 5.0,
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child:ReusableCard(
                      onprased: (){
                        setState(() {
                          oopGender=Gender.mael;
                        });
                      },
                      color:oopGender==Gender.mael ? kActiveCardColour:kCnactiveCardcolor,

                      cardChild:IconContent(
                        icon: FontAwesomeIcons.mars,
                        labl: 'Male',
                      ),
                    ) ,
                    ),
             Expanded(child:ReusableCard(
             onprased: (){
               setState(() {
               oopGender=Gender.famel;
               });
               },
               color:oopGender==Gender.famel ? kActiveCardColour:kCnactiveCardcolor,
               cardChild:IconContent(
               icon: FontAwesomeIcons.venus,
               labl: 'Female',
                  ),
                  ) ,
               ),
                  ],
                ),
              ),
              GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                   Container(

                    child: Center(
                      child: Text('CreateAccount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 49.0,
                        color: Colors.white
                      ),
                      ),
                    ),
                    width: double.infinity,
                     decoration: BoxDecoration(
                         color: Color(0xFF9bcd9b),
                         borderRadius:BorderRadius.only( topLeft: Radius.circular(7),topRight: Radius.circular(7)  )
                     ),
                  ),
               ],
                ),

               onTap: () {
               Navigator.push(context, MaterialPageRoute(builder:(context) {
               return Home();
               },
                 ),
               );
               }
              ),
              ],

               ),
        ),
      ),
    );
  }
}


class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color,this.cardChild,this.onprased});
  final Color color;
  final Widget cardChild;
  final Function onprased;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onprased,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color:color ,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
class IconContent extends StatelessWidget {
  IconContent({this.icon,this.labl});
  final IconData icon;
  final String labl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
          size: 50.0,
        ),
        Text(labl,style:kLabelTextStyle,
        )
      ],
    );
  }
}