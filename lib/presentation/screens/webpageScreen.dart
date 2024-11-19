import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:extreme_work_outs/theme/app_colors.dart';
import 'package:extreme_work_outs/presentation/widgets/common/custom_drawer.dart';

class WebPage extends StatefulWidget {
  final String url;

  WebPage({required this.url});

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  late final WebViewController _webViewController;
  bool isLoading = true; // Estado para controlar el preloader
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // Clave del Scaffold

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            setState(() {
              isLoading = true; // Mostrar el indicador de carga
            });
          },
          onPageFinished: (_) {
            setState(() {
              isLoading = false; // Ocultar el indicador de carga
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState
                  ?.openDrawer(); // Abre el Drawer usando la clave
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _webViewController),
          if (isLoading)
            Container(
              color: Colors.white, // Fondo blanco detrás del preloader
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
        ],
      ),
      drawer: CustomDrawer(), // Usa el Drawer reutilizable
    );
  }
}
