import 'package:navegacion_flu/src/providers/menu_provider.dart';
import 'package:navegacion_flu/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('♡♡♡♡ MY APP BY KARLY ♡♡♡♡'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context){
    return FutureBuilder(
      future: menuProvider.cargarData(),
      builder: (context, snapshot){
        print(snapshot.data);
        return ListView(children: _listaItems(snapshot.data, context));
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context){
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: Colors.deepPurpleAccent,
        ),
        onTap: () {
         /*   context: context,
          showDialog(
            builder: (BuildContext context) => _buildPopUpDialog(context, opt['texto']),
        },
          );*/
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    }
    );
    return opciones;
  }

  Widget _buildPopUpDialog(BuildContext context, String opt) {
    return new AlertDialog(
      title: const Text('Me diste click'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Hola soy la opcion ' + opt),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cerrar'),
        ),
     ],
    );
  }
}