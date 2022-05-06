import 'package:bazza/components/actualy_plan.dart';
import 'package:bazza/components/status_account.dart';
import 'package:bazza/style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                          color:primaryColor
                          ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Colors.black.withOpacity(0.10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 45, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bem vindo(a),',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'José'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: secondaryColor, fontFamily: 'Poppins'),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                 // ignore: prefer_const_constructors
                                 ActualyPlan(planTitle: 'Plano actual',typeOfPlan: 'Mensal: 2.000 kz',),
                                const SizedBox(
                                  width: 10,
                                ),
                                StatusAccount(
                                  statusTitle: 'Status'.toUpperCase(),
                                  statusSubtitle: 'Dados: 120 MB',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 390),
              ],
            ),
          ),
          Positioned(
            top: 195,
            right: 20,
            left: 20,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 455,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(8.0),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 6,
                  children: [
                    card(
                      'Carregar',
                      const Icon(
                        Icons.monetization_on_outlined,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                    card(
                      'Minha conta',
                      const Icon(
                        Icons.person_outline_outlined,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                    card(
                      'Trocar plano',
                      const Icon(
                        Icons.sync_alt_outlined,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                    card(
                      'Pacotes',
                      const Icon(
                        Icons.wysiwyg_outlined,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                    card(
                      'Lojas',
                      const Icon(
                        Icons.store_mall_directory_outlined,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                    card(
                      'Suporte',
                      const Icon(
                        Icons.headset_mic_outlined,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  card(String gridText, Widget iconItem) {
    return Card(
      shadowColor: Colors.white54,
      elevation: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconItem,
          const SizedBox(
            height: 5,
          ),
          Text(
            gridText,
            style: const TextStyle(fontSize: 14, color: terceryColor),
          )
        ],
      ),
    );
  }

