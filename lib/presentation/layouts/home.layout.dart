import 'package:extreme_work_outs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;

  const HomeLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> languageImages = {
      'en': 'lib/assets/images/default/en_US.png',
      'es': 'lib/assets/images/default/es_ES.png',
    };
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Distribuye los elementos
          children: [
            Builder(
              builder: (BuildContext context) {
                return InkWell(
                  borderRadius: BorderRadius.circular(
                      30), // Asegura que el área del clic sea redonda
                  onTap: () {
                    Scaffold.of(context)
                        .openDrawer(); // Abre el Drawer al hacer clic
                    print("Drawer opened");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Color de fondo
                      border: Border.all(
                          color: AppColors.secondaryColor,
                          width: 2), // Borde negro de 2 px
                      borderRadius:
                          BorderRadius.circular(30), // Borde redondeado
                    ),
                    width: 40, // Establecemos un tamaño cuadrado
                    height: 40, // Establecemos un tamaño cuadrado
                    alignment: Alignment
                        .center, // Centra el icono dentro del contenedor
                    child: Icon(
                      Icons.menu,
                      color: AppColors.secondaryColor, // Color del icono
                    ),
                  ),
                );
              },
            ),
            Image.asset(
              'lib/assets/images/default/logo-letras-negro.webp',
              height: 25,
              fit: BoxFit.contain,
            ),
          ],
        ),
        automaticallyImplyLeading:
            false, // Evita que se muestre un ícono de retroceso
      ),
      body: child, // Aquí se pasa el contenido específico de cada pantalla
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(title: Text("Logout".tr()), onTap: () {}),
            
            ListTile(
              title: Row(
                children: [
                  // Imagen con tamaño ajustado
                  Image.asset(
                    languageImages[context.locale.languageCode]!,
                    height: 20, // Ajusta la altura de la imagen
                    width: 20, // Ajusta el ancho de la imagen
                  ),
                  SizedBox(width: 10), // Espaciado entre la imagen y el texto
                  // Texto de idioma envuelto en un Expanded para evitar overflow
                  Expanded(
                    child: Text(
                      "Language".tr(),
                      overflow: TextOverflow
                          .ellipsis, // Asegura que el texto no se desborde
                    ),
                  ),
                ],
              ),
              trailing: Switch(
                value: context.locale.languageCode == 'es',
                onChanged: (bool value) {
                  context.setLocale(
                      value ? Locale('es', 'ES') : Locale('en', 'US'));
                },
                activeColor: Colors.green,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
