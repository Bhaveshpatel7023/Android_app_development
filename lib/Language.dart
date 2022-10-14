import 'package:flutter/material.dart';
import 'package:flutter_application_1/Number.dart';
const List<String> list = <String>['English', 'Hindi', 'Tamil', 'Panjabi'];

class Mylanguage extends StatefulWidget {
  const Mylanguage({Key? key}) : super(key: key);

  @override
  State<Mylanguage> createState() => _MylanguageState();
}

class _MylanguageState extends State<Mylanguage> {

  String value = list.first;

  @override
  Widget build(BuildContext context) {
  

    
    return Material(
      
     color:Colors.white,
     child: Container(
    //     constraints: BoxConstraints.expand(),

       child: Column(children: [
        Image(image: NetworkImage('https://previews.123rf.com/images/amin268/amin2681710/amin268171000705/88685127-vector-choose-or-change-language-icon-on-white-background-.jpg', 
        ),
        height: 200,
        width: 200,),
        Text('Please select your language',style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 25
        ),
        
        ),
        Padding(
          padding: EdgeInsets.only(top: 20,right: 10,left: 10),
          child: Text('Please select your preferred language to be used within the app. You can change this setting anytime in the more Menu.',
          textAlign: TextAlign.center,
          ),
        ),
     
     
        Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            height: 50,
            width: 300,
            //alignment: Alignment.center,
            color: Color.fromARGB(135, 139, 233, 233),
            
            child: DropdownButton<String>(
              
            value: value,
                 hint: Text('Select'),
            style: const TextStyle(color: Colors.deepPurple),
            
            onChanged: (String?_value) {
              // This is called when the user selects an item.
              setState(() {
              
                value = _value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
                 ),
          ),
        ),
        Container(
          height: 50,
          width: 300,
          child: ElevatedButton(
            
            child:Text('countion'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Mynumber()),);
            },

            
          ),
        )
       ]
       ),
     )
    );
     
  }
}
      
   
  
