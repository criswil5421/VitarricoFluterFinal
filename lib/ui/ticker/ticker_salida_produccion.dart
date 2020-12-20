import 'package:calidad_servicioupeu/blocs/salidaProduccion/salida_produccion_bloc.dart';
import 'package:calidad_servicioupeu/blocs/ticker/ticker_bloc.dart';
import 'package:calidad_servicioupeu/modelo/salida_produccion_modelo.dart';
import 'package:calidad_servicioupeu/repository/SalidaProduccionRepository.dart';
import 'package:calidad_servicioupeu/repository/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_float_action_button/animated_floating_action_button.dart';

class SalidaProduccionApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>TickerBloc(Ticker())),
          BlocProvider(create: (_)=>SalidaProduccionBloc( salidaproduccionRepository : SalidaProduccionRepository())),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.amberAccent),
          home: TickerPage(),
        ));
  }

}


class TickerPage extends StatelessWidget{
  final controllersalpro_fecha=new TextEditingController();
  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SalidaProduccionBloc>(context).add(ListarSalidaProduccionEvent());
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<TickerBloc, TickerState>(
          builder: (context, state){
            if(state is TickerTickSusccess){
              return Center(
                child: Text("Titulos Tick #${state.count}"),
              );
            }
            return const Center(
              child: Text(" Ticker salida produccion"),
            );
          },
        ),
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){
                print("Si funciona");
              },
              child: Icon(Icons.search, size: 26.0,),
            ),
          ),
          Padding(padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){
                final salidaproduccion=new ModeloSalidaProduccion();
                formDialog(context, salidaproduccion);
                print("Si funciona 2");
              },
              child: Icon(Icons.add_box_sharp),
            ),
          )
        ],
      ),
      body: BlocBuilder<SalidaProduccionBloc, SalidaProduccionState>(
        builder: (context, state){
          if(state is SalidaProduccionLoadedState){
            /*return Center(
              child: Text("Tick #${state.productosList.length}"),
            );*/

            return ListView.builder(
              itemCount: state.salidaproduccionList.length,
              itemBuilder: (context, index)=>
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Text(state.salidaproduccionList[index].salpro_id.toString()),
                        title: Text(state.salidaproduccionList[index].salpro_fecha),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: (){
                              ModeloSalidaProduccion salidaproduccion=state.salidaproduccionList[index];
                              controllersalpro_fecha.text=salidaproduccion.salpro_fecha;
                              formDialog(context, salidaproduccion);
                            }),
                            IconButton(icon: Icon(Icons.delete), onPressed: (){
                              showDialog(context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text("Mensaje de confirmacion"),
                                      content: Text("Desea Eliminar?"),
                                      actions: [
                                        FlatButton(child: const Text('CANCEL'),
                                          onPressed: (){
                                            Navigator.of(context).pop('Failure');
                                          },
                                        ),
                                        FlatButton( child: const Text('ACCEPT'),
                                            onPressed: (){
                                              Navigator.of(context).pop('Success');
                                            })
                                      ],
                                    );
                                  }
                              ).then((value){
                                if(value.toString()=="Success"){
                                  BlocProvider.of<SalidaProduccionBloc>(context).add(DeleteSalidaProduccionEvent(salidaproduccion: state.salidaproduccionList[index]));
                                }
                              });




                            })
                          ],
                        ),
                      ),
                    ),
                  ),
            );

          }
          return const Center(
            child: Text("Aqui va la numeracion de incremento"),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
          BottomNavigationBarItem(icon: new Icon(Icons.email), title: new Text("MSG")),
          BottomNavigationBarItem(icon: new Icon(Icons.person), title: new Text("Perfil")),
        ],
      ),

      floatingActionButton: AnimatedFloatingActionButton(
        key: fabKey,
        fabButtons: <Widget>[
          add(context),
          image(),
          inbox()
        ],
        colorStartAnimation: Colors.blue,
        colorEndAnimation: Colors.red,
        animatedIconData: AnimatedIcons.menu_close,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }


  Widget add(BuildContext context) {
    return FloatActionButtonText(
      onPressed: (){
        context.read<TickerBloc>().add(TickerStarted());
        context.read<SalidaProduccionBloc>().add(ListarSalidaProduccionEvent());
        fabKey.currentState.animate();
      },
      icon: Icons.add,
      text: "Listar/Start Timer",
      textLeft: -150,
    );
  }

  Widget image() {
    return FloatActionButtonText(
      onPressed: (){
        fabKey.currentState.animate();
      },
      icon: Icons.image,
      textLeft: -150,
      text: "Visualizar Rota",
    );
  }

  Widget inbox() {
    return FloatActionButtonText(
      onPressed: (){
        fabKey.currentState.animate();
      },
      icon: Icons.inbox,
      textLeft: -135,
      text: "Desbloquear",
    );
  }


  Future formDialog(BuildContext context, ModeloSalidaProduccion salidaproduccion){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Crear salidaproduccion"),
            content: Column(
              children: [
                TextField(
                  obscureText: false,
                  controller: controllersalpro_fecha,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "salpro_fecha:",
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(child: Text('CANCEL'),
                  onPressed: (){
                    Navigator.of(context).pop('Cencel');
                  }),
              FlatButton(child: Text('Guardar'),
                  onPressed: (){
                    salidaproduccion.salpro_fecha=controllersalpro_fecha.value.text;
                    controllersalpro_fecha.clear();
                    Navigator.of(context).pop(salidaproduccion);
                  })
            ],
          );
        }
    ).then((value){
      if(value.toString()!="Cencel" && value.toString()!=null){
        ModeloSalidaProduccion data=value;
        print("VER: ${data.salpro_id}" );
        if(data.salpro_id==null){
          print("Datos: ${data.salpro_fecha}");
          BlocProvider.of<SalidaProduccionBloc>(context).add(CreateSalidaProduccionEvent(salidaproduccion: data));
        }else{
          BlocProvider.of<SalidaProduccionBloc>(context).add(UpdateSalidaProduccionEvent(salidaproduccion: data));
        }
      }
    });
  }
}