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
  double _result = 0;
  bool isFirst = true;
  String operacao = "";
  String sinal = "";

  
  
  
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
  void virgula() => setState(() => textoTela += ".");
  
  //funções do header
  void clear(){
    numeros.clear();
    isFirst = true;
    setState(() {
      textoTela = "";
      textoCalculo = "";
      _result = 0;
    });
  }
  
  //Funções dos botões
  void resultado(){
    double numero = double.parse(textoTela);
    if(operacao == "ad"){
      if(isFirst){
        _result = numero;
      }
      else{
        _result += numero;
      }
    }
    
    else if(operacao == "sub"){
      if(isFirst){
        _result = numero;
      }
      else{
        _result -= numero;
      }
    }
    
    else if(operacao == "mult"){
      if(isFirst){
        _result = numero;
      }
      else{
        _result *= numero;
      }
    }
    else if(operacao == "divi"){
      if(isFirst){
        _result = numero;
      }
      else{
        _result /= numero;
      }
    }
    isFirst = false;

    textoTela = "";
    setState((){
      textoCalculo = "$_result $sinal";
    });
  }
  
  void adicao(){
      if(isFirst){
        operacao = "ad";
        sinal = "+";
        resultado();
      }
      else{
        sinal = "+";
        resultado();
        operacao = "ad";
        
      }

      setState((){
        textoTela = "";
      });
  }
  void subtracao(){
      print("$isFirst");
      if(isFirst){
        operacao = "sub";
        sinal = "-";
        resultado();
      }
      else{
        sinal = "-";
        resultado();
        operacao = "sub";
        
      }

      setState((){
        textoTela = "";
      });
  }
  void multiplicacao(){
      print("$isFirst");
      if(isFirst){
        operacao = "mult";
        sinal = "×";
        resultado();
      }
      else{
        sinal = "×";
        resultado();
        operacao = "mult";
      }

      setState((){
        textoTela = "";
      });
  }
  void divisao(){
      print("$isFirst");
      if(isFirst){
        operacao = "divi";
        sinal = "÷";
        resultado();
      }
      else{
        sinal = "÷";
        resultado();
        operacao = "divi";
      }

      setState((){
        textoTela = "";
      });
  }
  
  void finalizar(){
    resultado();
    isFirst = true;
    setState((){
      textoCalculo = "";
      textoTela = "$_result";
    });
  }
  
  //Funções dos outros botões
  void deletar(){
    setState((){
      textoTela = textoTela.substring(0, textoTela.length -1);
    });
  }
  
  void ce(){
    setState((){
      textoTela = "";
    });
  }
  

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text("Calculadora", style: TextStyle(color: Colors.white))
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
                          funcao: () => ce,
                          texto: "CE",
                          cor: Colors.indigo
                        ),
                        BtnHeader(
                          funcao: () => deletar,
                          texto: "⇐",
                          cor: Colors.indigo
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
                          funcao: () => virgula,
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
                      funcao: () => finalizar,
                      texto: "=",
                      cor: Colors.green
                    ),
                    BtnNumero(
                      funcao: () => divisao,
                      texto: "÷",
                      cor: Colors.purple[900]!
                    ),
                    BtnNumero(
                      funcao: () => multiplicacao,
                      texto: "x",
                      cor: Colors.purple[900]!
                    ),
                    BtnNumero(
                      funcao: () => subtracao,
                      texto: "-",
                      cor: Colors.purple[900]!
                    ),
                    BtnNumero(
                      funcao: () => adicao,
                      texto: "+",
                      cor: Colors.purple[900]!
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