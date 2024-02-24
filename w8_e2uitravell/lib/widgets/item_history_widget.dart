import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:w8_e2uitravell/constants.dart';

class ItemHistoryWidget extends StatelessWidget {
  const ItemHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(5, 5),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/car.png",
            width: 50,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Blok A Sarimi",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, color: kColorPrimary),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Av. Lima 2323",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: kColorPrimary.withOpacity(0.55),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "05, Sep 2022",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: kColorPrimary.withOpacity(0.55),
                ),
              ),
              Text(
                "\$20.00",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: Color(0xff50BC9C),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
