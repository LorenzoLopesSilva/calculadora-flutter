import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora()
    );
  }
}

class Calculadora extends StatefulWidget{
  const Calculadora ({super.key});
  
  State<Calculadora> createState() => _CalculadoraS();
}

//--------------- Tela Principal (une os componentes) ----------------------- 

class _CalculadoraS extends State<Calculadora>{
  String textoTela = "";
  String textoCalculo = "Teste";
  List numeros = [];

  
  
  
  //Funções dos botões dos numeros
  void add1() => setState(() => textoTela += "1");
  void add2() => setState(() => textoTela += "2");
  void add3() => setState(() => textoTela += "3");
  void add4() => setState(() => textoTela += "4");
  void add5() => setState(() => textoTela += "5");
  void add6() => setState(() => textoTela += "6");
  void add7() => setState(() => textoTela += "7");
  void add8() => setState(() => textoTela += "8");
  void add9() => setState(() => textoTela += "9");
  void add0() => setState(() => textoTela += "0");
  
  //funções do header
  void clear(){
    numeros.clear();
    setState(() {
      textoTela = "";
      textoCalculo = "";
    });
  }
  
  
  void realizar(){
    double _resultado = 0;
    double numero = double.parse(textoTela);
    numeros.add(numero);
    for(var i in numeros){
      _resultado += i;
    }
    numeros.clear();
    setState(() => textoTela = "$_resultado");
  }
  
  void adicao(){
    if(textoTela != ""){
      double numero = double.parse(textoTela);
      textoTela = "";
      numeros.add(numero);
    }
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Calculadora")
      ),
      body: SafeArea(
        child: Column(
          children: [
            Exibir(
              textoExibir: textoTela,
              textoCalculo: textoCalculo
            ),
            Row(
              children: [
                Column(
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BtnHeader(
                          funcao: () => clear,
                          texto: "C",
                          cor: Colors.indigo
                        ),
                        BtnHeader(
                          funcao: (){},
                          texto: "CE",
                          cor: Colors.indigo
                        ),
                        BtnHeader(
                          funcao: (){},
                          texto: "Del",
                          cor: Colors.red
                        ),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BtnNumero(
                          funcao: () => add1,
                          texto: "1"
                        ),
                        BtnNumero(
                          funcao: () => add2,
                          texto: "2"
                        ),
                        BtnNumero(
                          funcao: () => add3,
                          texto: "3",
                        ),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BtnNumero(
                          funcao: () => add4,
                          texto: "4"
                        ),
                        BtnNumero(
                          funcao: () => add5,
                          texto: "5"
                        ),
                        BtnNumero(
                          funcao: () => add6,
                          texto: "6"
                        ),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BtnNumero(
                          funcao: () => add7,
                          texto: "7"
                        ),
                        BtnNumero(
                          funcao: () => add8,
                          texto: "8"
                        ),
                        BtnNumero(
                          funcao: () => add9,
                          texto: "9"
                        ),
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BtnNumero(
                          funcao: () {},
                          texto: "+/-",
                          cor: Colors.indigo
                        ),
                        BtnNumero(
                          funcao: () => add0,
                          texto: "0"
                        ),
                        BtnNumero(
                          funcao: () {},
                          texto: ",",
                          cor: Colors.indigo
                        ),

                      ]
                    )
                  ]
                ),
                //Operrações
                Column(
                  children: [
                    BtnHeader(
                      funcao: () => realizar,
                      texto: "=",
                      cor: Colors.green
                    ),
                    BtnNumero(
                      funcao: (){},
                      texto: "÷"
                    ),
                    BtnNumero(
                      funcao: (){},
                      texto: "x"
                    ),
                    BtnNumero(
                      funcao: (){},
                      texto: "-"
                    ),
                    BtnNumero(
                      funcao: () => adicao,
                      texto: "+"
                    ),
                  ]
                )
              ]
            )
          ]
        )
      )
    );
  }
  
}

//------------------------------------- COMPONENTES -------------------------------------------

//----------- Campo para Exibir numeros e resultados -------------

class Exibir extends StatelessWidget{
  final String textoExibir;
  final String textoCalculo;
  
  const Exibir({
    super.key,
    required this.textoExibir,
    required this.textoCalculo
  });
  
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10),
      height: 70,
      width: double.infinity,
      color: Colors.grey[300],
      child: Column(
        children: [
          Text(textoCalculo),
          Text(
            textoExibir,
            style: TextStyle(
              fontSize: 20
            )
          )
        ]
      )
    );
  }
}

//------------ Botão dos numeros -----------

class BtnNumero extends StatelessWidget{
  final double size;
  final Color cor;
  final Function funcao;
  final String texto;
  
  const BtnNumero({
    super.key,
    this.size = 80,
    this.cor = Colors.blue,
    required this.funcao,
    required this.texto
  });
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: funcao(),
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(size * 0.1)
        ),
        child: Text(
          texto,
          style: TextStyle(color: Colors.white)
        )
      )
    );
  }
}

//--------------- Botão Cabeçalho--------------------
class BtnHeader extends StatelessWidget{
  final double size;
  final Color cor;
  final Function funcao;
  final String texto;
  
  const BtnHeader({
    super.key,
    this.size = 80,
    this.cor = Colors.blue,
    required this.funcao,
    required this.texto
  });
  
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: funcao(),
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        height: size * 0.5,
        width: size,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(size * 0.1)
        ),
        child: Text(
          texto,
          style: TextStyle(color: Colors.white)
        )
      )
    );
  }
}