import 'package:calidad_servicioupeu/blocs/pro1/pro1_bloc.dart';
import 'package:calidad_servicioupeu/blocs/ticker/ticker_bloc.dart';
import 'package:calidad_servicioupeu/modelo/pro1_modelo.dart';
import 'package:calidad_servicioupeu/repository/Pro1Repository.dart';
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
          BlocProvider(create: (_)=>Pro1Bloc( pro1Repository: Pro1Repository())),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.amberAccent),
          home: TickerPage(),
        ));
  }

}


class TickerPage extends StatelessWidget{
  final controllerCantida=new TextEditingController();
  final controllerPrecio=new TextEditingController();
  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<Pro1Bloc>(context).add(ListarPro1Event());
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
                final pro1=new ModeloPro1();
                formDialog(context, pro1);
                print("Si funciona 2");
              },
              child: Icon(Icons.add_box_sharp),
            ),
          )
        ],
      ),
      body: BlocBuilder<Pro1Bloc, Pro1State>(
        builder: (context, state){
          if(state is Pro1LoadedState){
            /*return Center(
              child: Text("Tick #${state.productosList.length}"),
            );*/

            return ListView.builder(
              itemCount: state.pro1List.length,
              itemBuilder: (context, index)=>
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Text(state.pro1List[index].idPro1.toString()),
                        title: Text(state.pro1List[index].producto_cantidad),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: (){
                              ModeloPro1 pro1=state.pro1List[index];
                              controllerCantida.text=pro1.producto_cantidad;
                              controllerPrecio.text=pro1.producto_precio.toString();
                              formDialog(context, pro1);
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
                                  BlocProvider.of<Pro1Bloc>(context).add(DeletePro1Event(pro1: state.pro1List[index]));
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
        context.read<Pro1Bloc>().add(ListarPro1Event());
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


  Future formDialog(BuildContext context, ModeloPro1 pro1){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Crear Producto"),
            content: Column(
              children: [
                TextField(
                  obscureText: false,
                  controller: controllerCantida,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerPrecio,
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
                    pro1.producto_cantidad=controllerCantida.value.text;
                    pro1.producto_precio=double.parse(controllerPrecio.value.text.toString());
                    controllerCantida.clear();
                    controllerPrecio.clear();
                    Navigator.of(context).pop(pro1);
                  })
            ],
          );
        }
    ).then((value){
      if(value.toString()!="Cencel" && value.toString()!=null){
        ModeloPro1 data=value;
        print("VER: ${data.idPro1}" );
        if(data.idPro1==null){
          print("Datos: ${data.producto_cantidad}-${data.producto_precio}");
          BlocProvider.of<Pro1Bloc>(context).add(CreatePro1Event(pro1: data));
        }else{
          BlocProvider.of<Pro1Bloc>(context).add(UpdatePro1Event(pro1: data));
        }
      }
    });
  }


}