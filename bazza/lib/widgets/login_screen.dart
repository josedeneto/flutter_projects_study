import 'package:bazza/style.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHiddenPassword = true;
  Widget? viewPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: primaryColor,
        /*  image: DecorationImage(
            image: AssetImage(
              'assets/images/Group-670.png',
            ),
            fit: BoxFit.cover,
          ),*/
        ),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Image(
                      width: 70,
                      height: 70,
                      image: AssetImage('assets/images/Group-11396.png'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 50,
                      child: TextField(
                        maxLength: 9,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          filled: true,
                          fillColor: fillcolor,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Número bazza',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black45,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        obscureText: isHiddenPassword,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFBD0868),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Pin bazza',
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black45,
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                            suffixIcon: InkWell(
                              onTap: _tooglePasswordView,
                              child: const Icon(
                                Icons.visibility,
                                color: terceryColor,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueceu seu pin?',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: secondaryColor,
                                fontWeight: FontWeight.normal),
                          ),
                        ),),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/letsStart');
                      },
                      child: const Text(
                        'bazza',
                        style: buttonStyleText,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: secondaryColor,
                          fixedSize: const Size(200, 50)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Não tenho conta?',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontFamily: 'Poppins'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Registrar',
                            style: textButton,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //method password visible
  void _tooglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
