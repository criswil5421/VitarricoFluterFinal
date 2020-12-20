import 'package:calidad_servicioupeu/blocs/Salidas/salidas_bloc.dart';
import 'package:calidad_servicioupeu/blocs/ticker/ticker_bloc.dart';
import 'package:calidad_servicioupeu/modelo/salidas_modelo.dart';
import 'package:calidad_servicioupeu/repository/SalidasRepository.dart';
import 'package:calidad_servicioupeu/repository/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_float_action_button/animated_floating_action_button.dart';
class TickerApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>TickerBloc(Ticker())),
          BlocProvider(create: (_)=>SalidasBloc( salidasRepository: SalidasRepository())),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.amberAccent),
          home: TickerPage(),
        ));
  }

}


class TickerPage extends StatelessWidget{
  final controllerFecha=new TextEditingController();
  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SalidasBloc>(context).add(ListarSalidasEvent());
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
              child: Text(" Titulo (NA)"),
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
                final producto=new ModeloSalidas();
                formDialog(context, producto);
                print("Si funciona 2");
              },
              child: Icon(Icons.add_box_sharp),
            ),
          )
        ],
      ),
      body: BlocBuilder<SalidasBloc, SalidasState>(
        builder: (context, state){
          if(state is SalidasLoadedState){
            /*return Center(
              child: Text("Tick #${state.productosList.length}"),
            );*/

            return ListView.builder(
              itemCount: state.salidasList.length,
              itemBuilder: (context, index)=>
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Text(state.salidasList[index].salidaId.toString()),
                        title: Text(state.salidasList[index].salidaFecha),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: (){
                              ModeloSalidas salidas=state.salidasList[index];
                              controllerFecha.text=salidas.salidaFecha;
                              formDialog(context, salidas);
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
                                  BlocProvider.of<SalidasBloc>(context).add(DeleteSalidasEvent(salidas: state.salidasList[index]));
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
        context.read<SalidasBloc>().add(ListarSalidasEvent());
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


  Future formDialog(BuildContext context, ModeloSalidas producto){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Crear Producto"),
            content: Column(
              children: [
                TextField(
                  obscureText: false,
                  controller: controllerFecha,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerFecha,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Precio:",
                  ),
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(child: Text('CANCEL'),
                  onPressed: (){
                    Navigator.of(context).pop('Cencel');
                  }),
              FlatButton(child: Text('Guardar'),
                  onPressed: (){
                    producto.salidaFecha=controllerFecha.value.text;
                    controllerFecha.clear();;
                    Navigator.of(context).pop(producto);
                  })
            ],
          );
        }
    ).then((value){
      if(value.toString()!="Cencel" && value.toString()!=null){
        ModeloSalidas data=value;
        print("VER: ${data.salidaId}" );
        if(data.salidaId==null){
          print("Datos: ${data.salidaFecha}");
          BlocProvider.of<SalidasBloc>(context).add(CreateSalidasEvent(salidas: data));
        }else{
          BlocProvider.of<SalidasBloc>(context).add(UpdateSalidasEvent(salidas: data));
        }
      }
    });
  }


}