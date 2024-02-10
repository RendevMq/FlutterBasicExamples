import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getwidget/getwidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:w8_e1travelapp/widgets/welcome_widget.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

//USANDO CAROUSEL SLIDER
class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        items: [
          WelcomeWidget(
            title: "Viaja",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue consectetur ante eu lobortis. Phasellus tempor ligula neque, ut tincidunt dolor ultricies vitae. Nam aliquet scelerisque nisi. Vestibulum placerat orci risus, id pretium mi malesuada sed",
            color: Colors.orange,
            pathAsset: "assets/icons/avion.png",
            showButton: false,
          ),
          WelcomeWidget(
            title: "Agenda tus viajes",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue consectetur itae. Nam aliquet scelerisque nisi. Vestibulum placerat orci risus, id pretium mi malesuada sed",
            color: Colors.cyan,
            pathAsset: "assets/icons/agregar.png",
            showButton: false,
          ),
          WelcomeWidget(
            title: "Imprime tus tickets",
            description:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue consectetur ante eu lobortis",
            color: Colors.red,
            pathAsset: "assets/icons/print.png",
            showButton: true,
          ),
        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
          enableInfiniteScroll: false,
          autoPlayCurve: Curves.easeInCubic,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}


// USANDO GFCAROUSEL DE GETWIDGET
// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GFCarousel(
//         height: MediaQuery.of(context).size.height,
//         hasPagination: true,
//         activeIndicator: Colors.blue,
//         enlargeMainPage: true,
//         autoPlay: true,
//         autoPlayAnimationDuration: Duration(seconds: 4),
//         initialPage: 2,
//         reverse: true,
//         enableInfiniteScroll: true,
//         items: [
//           WelcomeWidget(
//               title: "Viaja",
//               description:
//                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue consectetur ante eu lobortis. Phasellus tempor ligula neque, ut tincidunt dolor ultricies vitae. Nam aliquet scelerisque nisi. Vestibulum placerat orci risus, id pretium mi malesuada sed",
//               color: Colors.orange,
//               pathAsset: "assets/icons/avion.png"),
//           WelcomeWidget(
//               title: "Agenda tus viajes",
//               description:
//                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue consectetur itae. Nam aliquet scelerisque nisi. Vestibulum placerat orci risus, id pretium mi malesuada sed",
//               color: Colors.cyan,
//               pathAsset: "assets/icons/agregar.png"),
//           WelcomeWidget(
//               title: "Imprime tus tickets",
//               description:
//                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec congue consectetur ante eu lobortis",
//               color: Colors.red,
//               pathAsset: "assets/icons/print.png"),
//         ],
//       ),
//     );
//   }
// }