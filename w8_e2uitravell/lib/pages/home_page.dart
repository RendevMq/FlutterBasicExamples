import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w8_e2uitravell/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //MediaQuery.of(context). luego tengo varias opciones.. por ejemplo "size"
    //Obetenemos el ancho del dispositivo
    print(MediaQuery.of(context).size);
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
              // height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    kColorSecondary,
                    kColorPrimary,
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Parkidin",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Text(
                              "24 °C",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Image.asset(
                              'assets/images/cloudy.png',
                              height: 22,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 22),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7),
                      child: Text(
                        "Let's find a place for you",
                        style: GoogleFonts.montserrat(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Fild parking place',
                              hintStyle: GoogleFonts.montserrat(
                                  color: Colors.black38,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.black38,
                                size: 20,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: kColorTertiary,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.filter_alt_outlined,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Parking New Year",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: kColorPrimary)),
                      Row(
                        children: [
                          Text("View More",
                              style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kColorTertiary)),
                          const SizedBox(
                            width: 6,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: kColorTertiary,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 160,
                    color: Colors.redAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/maps.png'),
                                fit: BoxFit.fitWidth),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          child: Column(
                            children: [
                              Text(
                                "Blok C Benjaminsssssssssssss",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Av. Lima 1111 Mz B UUUUUU",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
