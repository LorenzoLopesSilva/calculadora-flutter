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

class _CalculadoraS extends State<Calculadora>{
  final textoTela = "";
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Exibir(
              textoExibir: "Teste"
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnNumero(
                  funcao: (){},
                  texto: "1"
                ),
                BtnNumero(
                  funcao: (){},
                  texto: "2"
                ),
                BtnNumero(
                  funcao: (){},
                  texto: "3"
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnNumero(
                  funcao: (){},
                  texto: "1"
                ),
                BtnNumero(
                  funcao: (){},
                  texto: "2"
                ),
                BtnNumero(
                  funcao: (){},
                  texto: "3"
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnNumero(
                  funcao: (){},
                  texto: "1"
                ),
                BtnNumero(
                  funcao: (){},
                  texto: "2"
                ),
                BtnNumero(
                  funcao: (){},
                  texto: "3"
                ),
              ]
            ),
          ]
        )
      )
    );
  }
  
}

//----------- Campo para Exibir numeros e resultados -------------

class Exibir extends StatelessWidget{
  final String textoExibir;
  
  const Exibir({
    super.key,
    required this.textoExibir
  });
  
  @override
  Widget build(BuildContext context){
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Text(textoExibir)
    );
  }
}

//------------ Botão dos numeros -----------

class BtnNumero extends StatelessWidget{
  final double size;
  final Color cor;
  final Function funcao;
  final String texto;
  
  BtnNumero({
    super.key,
    this.size = 100,
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