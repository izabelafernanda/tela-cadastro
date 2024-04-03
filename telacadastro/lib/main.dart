import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const double minFontSize = 12;
  static const double maxFontSize = 32;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double fontSize = 16;
  String? selectedGender;
  bool emailNotifications = true;
  bool phoneNotifications = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: fontSize),
        ),
      ),
      home: Scaffold(
        drawer: Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Minha conta',
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Crie sua conta'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nome'),
                TextField(
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Digite o seu nome',
                  ),
                  enabled: true,
                  maxLength: 20,
                ),
                const Text('Data de nascimento'),
                TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: "DD/MM/YYYY",
                  ),
                ),
                const Text('Telefone'),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Digite seu telefone',
                  ),
                  enabled: true,
                  maxLength: 10,
                ),
                const Text('E-mail'),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Digite o seu e-mail',
                  ),
                ),
                const Text('Senha'),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Digite a sua senha',
                  ),
                  obscureText: true,
                  enabled: true,
                  maxLength: 8,
                ),
                const SizedBox(height: 16.0),
                const Text('Gênero:'),
                Row(
                  children: <Widget>[
                    const Text('Masculino'),
                    Radio<String>(
                      value: 'Masculino',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                    const Text('Feminino'),
                    Radio<String>(
                      value: 'Feminino',
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text('Notificações:'),
                const SizedBox(height: 16.0),
                const Text('E-mail'),
                SwitchListTile(
                  value: emailNotifications,
                  onChanged: (value) {
                    setState(() {
                      emailNotifications = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                const Text('Celular'),
                SwitchListTile(
                  value: phoneNotifications,
                  onChanged: (value) {
                    setState(() {
                      phoneNotifications = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                Slider(
                  value: fontSize,
                  min: MyApp.minFontSize,
                  max: MyApp.maxFontSize,
                  divisions: (MyApp.maxFontSize - MyApp.minFontSize).round(),
                  label: 'Font Size ($fontSize)',
                  onChanged: (value) => setState(() {
                    fontSize = value;
                  }),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Cadastrar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
