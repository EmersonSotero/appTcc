import 'package:connectivity_plus/connectivity_plus.dart';

class Conectado{

  late Future<bool> conn;

  Conectado(){
    conn = getConexao();
  }


  Future<bool> getConexao() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
    
    
  }
}