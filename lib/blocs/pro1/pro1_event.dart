

part of 'pro1_bloc.dart';


abstract class Pro1Event{
  final ModeloPro1 pro1;
  const Pro1Event({this.pro1});
}

class ListarPro1Event extends Pro1Event{ ListarPro1Event(); }

class DeletePro1Event extends Pro1Event{
  DeletePro1Event({@required ModeloPro1 pro1}):super(pro1:pro1);
}

class UpdatePro1Event extends Pro1Event{
  UpdatePro1Event({@required ModeloPro1 pro1}):super(pro1:pro1);
}

class CreatePro1Event extends Pro1Event{
  CreatePro1Event({@required ModeloPro1 pro1}):super(pro1:pro1);
}