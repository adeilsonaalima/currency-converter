import 'package:currency_converter/App/Components/field_component.dart';
import 'package:currency_converter/App/Controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  late final HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const BackgroundBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LogoImage(image: "assets/images/moeda.png"),
                Column(
                  children: [
                    FieldComponent(
                      selectedItem: homeController.toCurrency,
                      items: homeController.currencies,
                      controller: homeController.toText,
                      onChanged: (model) {
                        if (model != null) {
                          setState(() {
                            homeController.toCurrency = model;
                          });
                        }
                      },
                    ),
                    FieldComponent(
                      selectedItem: homeController.fromCurrency,
                      items: homeController.currencies,
                      controller: homeController.fromText,
                      onChanged: (model) {
                        if (model != null) {
                          setState(() {
                            homeController.fromCurrency = model;
                          });
                        }
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextButton(
                    onPressed: () {
                      homeController.convert();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return Colors.orange;
                            } else {
                              return Colors.orangeAccent;
                            }
                          },
                        ),
                        foregroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.all(15.0))),
                    child: const Text("Convert"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundBox extends StatelessWidget {
  const BackgroundBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}

class LogoImage extends StatelessWidget {
  const LogoImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Image.asset(
        image,
        width: 250,
      ),
    );
  }
}
