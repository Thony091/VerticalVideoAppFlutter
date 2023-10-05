

import 'package:intl/intl.dart';

class HumanFormats{
  
  static String humanReadbleNumer (double number){

    //Importar libreria "intl" estandar para formato de número
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,//sin decimales
      symbol: '',//sin simbolos
    ).format(number);

   return formatterNumber; 
  }

}