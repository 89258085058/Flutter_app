import 'package:flutter/material.dart';
import 'domain/settings.dart';

void main() => runApp(BolidApp());

class BolidApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bolid',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(title: Text('BOLID'), leading: Icon(Icons.add_moderator),),
        body: SettingsList(),
      ),
    );
  }
}

class SettingsList extends StatelessWidget {

  final settings = <Settings>[
    Settings(title: 'Раздел 1', user: 'Max', path: '1', leve: 'Без событий'),
    Settings(title: 'Раздел 2', user: 'Ivan', path: '3', leve: 'Сбой'),
    Settings(title: 'Раздел 3', user: 'ergey', path: '4', leve: 'Сбой'),
    Settings(title: 'Раздел 4', user: 'Antin', path: '5', leve: 'Тревога'),
    Settings(title: 'Раздел 5', user: 'Sasha', path: '6', leve: 'Тревога')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: settings.length,
            itemBuilder: (context, i){
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black12),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(Icons.settings, color: Colors.black38),
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(width: 1, color: Colors.lightBlueAccent))
                      ),

                    ),
                    title: Text(settings[i].title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    trailing: Icon(Icons.keyboard_arrow_right, color: Colors.lightBlueAccent),
                    subtitle: subtitle(context, settings[i]),

                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Settings settings){
  var color = Colors.black12;
  double indicatorLevel = 0;
  switch(settings.leve){
    case 'Без событий':
      color = Colors.green;
      indicatorLevel = 1;
      break;

    case 'Сбой':
      color = Colors.yellow;
      indicatorLevel = 1;
      break;

    case 'Тревога':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Colors.black38,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: Text(settings.leve, style: TextStyle(color: Colors.black))
      )
    ],
  );

}





