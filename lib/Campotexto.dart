import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Combustivel extends StatefulWidget {
  @override
  _CombustivelState createState() => _CombustivelState();
}

class _CombustivelState extends State<Combustivel> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var _mensagem = "";

  void _calcular(){
   double precoAlcool = double.tryParse(_controllerAlcool.text);
   double precoGasolina = double.tryParse(_controllerGasolina.text);
   if(precoAlcool == null || precoGasolina == null){
     setState(() {
       _mensagem = "Número inválido, digite um valor maior que 0 e utilize (.)";
     });
   }else{
     if((precoAlcool / precoGasolina) >= 0.7){
       setState(() {
         _mensagem = "Melhor Abastecer com gasolina." ;
       });
     }else{
       setState(() {
         _mensagem = "Melhor abastecer com alcool";
       });
     }

     limparcampos();
   };
  }

  void limparcampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          "Entrada de texto" ,

        ),
        backgroundColor: Colors.indigo,
      ),*/
      body:Container(
        color: Color.fromRGBO(255, 222, 173, 1) ,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 30),

                child: Column(
                  children: [
                    Image.asset("assets/logo.png"),





                  ],
                ),


              ),//imagem
              Padding(padding: EdgeInsets.all(20),
                child: Text("Será que vale a pena colocar Alcool ou Gasolina hoje?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    )),
              ),//Texto
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço do Alcool, ex: 2.59",
                  labelStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço da Gasolina, ex: 5.59",
                  labelStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                controller: _controllerGasolina,
              ),
              Padding(padding: EdgeInsets.all(32),
                child: RaisedButton(
                  color: Colors.indigo,
                  onPressed: _calcular,
                  child: Text("Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  ),
                  ),
                ) ,
              ),
              Padding(padding: EdgeInsets.only(top: 22,),
                child: Text(_mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,

                  ),),

              )


            ],
          ),
        )),

    );
  }
}




