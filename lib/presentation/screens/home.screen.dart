import 'package:extreme_work_outs/presentation/screens/webpageScreen.dart';
import 'package:extreme_work_outs/theme/app.styles.dart';
import 'package:flutter/material.dart';
import 'package:extreme_work_outs/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart'; // Para usar SystemNavigator.pop()

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista de elementos para llenar la cuadrícula
  final List<String> imagePaths = [
    'lib/assets/images/default/Challenges.png',
    'lib/assets/images/default/Profile.png',
    'lib/assets/images/default/Tutorials.png',
    'lib/assets/images/default/Orders.png',
    'lib/assets/images/default/Settings.png',
  ];

  final List<String> items = [
    'My Challenges',
    'Profile',
    'Tutorials',
    'Orders',
    'Settings',
  ];

  final List<String> urls = [
    'https://extremeworkouts.net/my-challenges/', 
    'https://extremeworkouts.net/athletes/daniela/', 
    'https://extremeworkouts.net/',
    'https://extremeworkouts.net/athletes/daniela/orders/',
    'https://extremeworkouts.net/athletes/daniela/settings/',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Aquí verificamos si estamos en la última pantalla de la pila de navegación
        SystemNavigator.pop(); // Cierra la app
        return false; // No permite hacer pop en la pila
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: AppColors.secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppStyles.borderRadius),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double totalWidth = constraints.maxWidth;
                      double textWidth = totalWidth * 0.7; // 70% del ancho
                      double buttonWidth = totalWidth * 0.3; // 30% del ancho

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: textWidth, // 70% del ancho disponible
                            child: Text(
                              'Fittest challenges on earth. You Dare'.tr(),
                              style: TextStyle(
                                color: Colors.white, // Color del texto
                                fontSize: 18, // Tamaño de la fuente
                                fontWeight: FontWeight.bold, // Aplica negrita
                              ),
                              textAlign: TextAlign.left, // Alineación del texto
                            ),
                          ),
                          Container(
                            width: buttonWidth, // 30% del ancho disponible
                            child: ElevatedButton(
                              onPressed: () {
                                // Acción cuando se presiona el botón
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    AppColors.textWhite, // Color de fondo
                                foregroundColor:
                                    AppColors.primaryColor, // Color del texto
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: const BorderSide(
                                    color: Colors.black, width: 1),
                                minimumSize: Size(buttonWidth, 30),
                              ),
                              child: Text('Join'.tr()),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16), // Espaciado entre el Card y el Grid
              // GridView contenido dentro de un tamaño limitado
              GridView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Desactiva el scroll del GridView
                shrinkWrap:
                    true, // Hace que el GridView tome solo el espacio necesario
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // En pantallas pequeñas, 2 columnas
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (urls[index].isNotEmpty) {
                        // Navegar a la pantalla WebPage si la URL existe
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebPage(url: urls[index]),
                          ),
                        );
                      }
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 0.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Cargar la imagen específica para cada celda
                          Image.asset(
                            imagePaths[index],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            items[index].tr(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
