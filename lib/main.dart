import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShapeBox',
      theme: ThemeData.dark(),
      home: ConfiguratorScreen(),
    );
  }
}

class ConfiguratorScreen extends StatefulWidget {
  @override
  _ConfiguratorScreenState createState() => _ConfiguratorScreenState();
}

class _ConfiguratorScreenState extends State<ConfiguratorScreen> {
  double _width = 200.0;
  double _height = 100.0;
  double _borderRadius = 20.0;
  Color _containerColor = Colors.white; // Контейнер завжди білий

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "ShapeBox",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Контейнер з динамічними параметрами
            Container(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _containerColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_borderRadius),
                ),
              ),
            ),
            SizedBox(height: 40),

            // Ползунок для зміни ширини
            Text("Ширина: ${_width.toStringAsFixed(0)}"),
            Slider(
              min: 50.0,
              max: 400.0,
              value: _width,
              onChanged: (value) {
                setState(() {
                  _width = value;
                });
              },
              activeColor: Colors.blue, // Синій цвет для ползунка
            ),
            SizedBox(height: 16),

            // Ползунок для зміни висоти
            Text("Висота: ${_height.toStringAsFixed(0)}"),
            Slider(
              min: 50.0,
              max: 300.0,
              value: _height,
              onChanged: (value) {
                setState(() {
                  _height = value;
                });
              },
              activeColor: Colors.blue, // Синій цвет для ползунка
            ),
            SizedBox(height: 16),

            // Ползунок для зміни радіусу
            Text("Радіус верхнього правого кута: ${_borderRadius.toStringAsFixed(0)}"),
            Slider(
              min: 0.0,
              max: 100.0,
              value: _borderRadius,
              onChanged: (value) {
                setState(() {
                  _borderRadius = value;
                });
              },
              activeColor: Colors.blue, // Синій цвет для ползунка
            ),
            SizedBox(height: 32),

            // Підпис внизу
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Роботу виконав Lomaka Dmytro, студент КН-32',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center, // Вирівнювання тексту по центру
              ),
            ),
          ],
        ),
      ),
    );
  }
}
