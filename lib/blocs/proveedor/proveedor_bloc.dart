import 'dart:async';
import 'package:calidad_servicioupeu/modelo/proveedor_modelo.dart';
import 'package:calidad_servicioupeu/repository/ProveedorRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'proveedor_event.dart';
part 'proveedor_state.dart';

class ProveedorBloc extends Bloc<ProveedorEvent, ProveedorState>{

  final ProveedorRepository _proveedorRepository;

  ProveedorBloc({ProveedorRepository proveedorRepository}) :
        _proveedorRepository=proveedorRepository,
        super(ProveedorInitialState());


  @override
  Stream<ProveedorState> mapEventToState(ProveedorEvent event) async* {
    if (event is ListarProveedorEvent) {
      yield ProveedorLoadingState();
      try {
        List<ModeloProveedor> proveedorList = await _proveedorRepository.getProveedor();
        yield ProveedorLoadedState(proveedorList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield ProveedorError(e);
      }



    }else if(event is DeleteProveedorEvent){
      try{
        await _proveedorRepository.deleteProveedor(event.proveedor.proveedorId);
        yield ProveedorLoadingState();
        List<ModeloProveedor> proveedorList= await _proveedorRepository.getProveedor();
        yield ProveedorLoadedState(proveedorList);
      }catch(e){
        print("Error ${e.toString()}");
        yield ProveedorError(e);
      }
    }else if(event is CreateProveedorEvent){
      try{
        await _proveedorRepository.createProveedor(event.proveedor);
        yield ProveedorLoadingState();
        List<ModeloProveedor> proveedorList= await _proveedorRepository.getProveedor();
        yield ProveedorLoadedState(proveedorList);
      }catch(e){
        print("Error ${e.toString()}");
        yield ProveedorError(e);
      }
    }else if(event is UpdateProveedorEvent){
      try{
        await _proveedorRepository.updateProveedor(event.proveedor.proveedorId, event.proveedor);
        yield ProveedorLoadingState();
        List<ModeloProveedor> proveedorList= await _proveedorRepository.getProveedor();
        yield ProveedorLoadedState(proveedorList);
      }catch(e){
        print("Error ${e.toString()}");
        yield ProveedorError(e);
      }
    }
  }

}