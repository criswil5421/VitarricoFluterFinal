import 'package:calidad_servicioupeu/blocs/proveedor/proveedor_bloc.dart';
import 'package:calidad_servicioupeu/blocs/ticker/ticker_bloc.dart';
import 'package:calidad_servicioupeu/modelo/proveedor_modelo.dart';
import 'package:calidad_servicioupeu/repository/ProveedorRepository.dart';
import 'package:calidad_servicioupeu/repository/ticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_float_action_button/animated_floating_action_button.dart';
class ProveedorApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_)=>TickerBloc(Ticker())),
          BlocProvider(create: (_)=>ProveedorBloc( proveedorRepository: ProveedorRepository())),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.amberAccent),
          home: TickerPage(),
        ));
  }

}


class TickerPage extends StatelessWidget{
  final controllerNombre=new TextEditingController();
  final controllerDireccion=new TextEditingController();
  final controllerCorreo=new TextEditingController();
  final controllerTelefono=new TextEditingController();

  final GlobalKey<AnimatedFloatingActionButtonState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProveedorBloc>(context).add(ListarProveedorEvent());
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
                final proveedor=new ModeloProveedor();
                formDialog(context, proveedor);
                print("Si funciona 2");
              },
              child: Icon(Icons.add_box_sharp),
            ),
          )
        ],
      ),
      body: BlocBuilder<ProveedorBloc, ProveedorState>(
        builder: (context, state){
          if(state is ProveedorLoadedState){
            /*return Center(
              child: Text("Tick #${state.productosList.length}"),
            );*/

            return ListView.builder(
              itemCount: state.proveedorList.length,
              itemBuilder: (context, index)=>
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Text(state.proveedorList[index].proveedorId.toString()),
                        title: Text(state.proveedorList[index].proveedorNombre),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(icon: Icon(Icons.edit), onPressed: (){
                              ModeloProveedor proveedor=state.proveedorList[index];
                              controllerNombre.text=proveedor.proveedorNombre;
                              controllerDireccion.text=proveedor.proveedorDireccion;
                              controllerCorreo.text=proveedor.proveedorCorreo;
                              controllerTelefono.text=proveedor.proveedorTelefono;
                              formDialog(context, proveedor);
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
                                  BlocProvider.of<ProveedorBloc>(context).add(DeleteProveedorEvent(proveedor: state.proveedorList[index]));
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
        context.read<ProveedorBloc>().add(ListarProveedorEvent());
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


  Future formDialog(BuildContext context, ModeloProveedor proveedor){
    return showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Crear Proveedor"),
            content: Column(
              children: [
                TextField(
                  obscureText: false,
                  controller: controllerNombre,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerDireccion,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Direccion:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerCorreo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo:",
                  ),
                ),
                TextField(
                  obscureText: false,
                  controller: controllerTelefono,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Telefono:",
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
                    proveedor.proveedorNombre=controllerNombre.value.text;
                    proveedor.proveedorDireccion=controllerDireccion.value.text;
                    proveedor.proveedorCorreo=controllerCorreo.value.text;
                    proveedor.proveedorTelefono=controllerTelefono.value.text;
                    controllerNombre.clear();
                    controllerDireccion.clear();
                    controllerCorreo.clear();
                    controllerTelefono.clear();
                  })
            ],
          );
        }
    ).then((value){
      if(value.toString()!="Cencel" && value.toString()!=null){
        ModeloProveedor data=value;
        print("VER: ${data.proveedorId}" );
        if(data.proveedorId==null){
          print("Datos: ${data.proveedorNombre}-${data.proveedorDireccion}-${data.proveedorCorreo}-${data.proveedorTelefono}");
          BlocProvider.of<ProveedorBloc>(context).add(CreateProveedorEvent(proveedor: data));
        }else{
          BlocProvider.of<ProveedorBloc>(context).add(UpdateProveedorEvent(proveedor: data));
        }
      }
    });
  }


}