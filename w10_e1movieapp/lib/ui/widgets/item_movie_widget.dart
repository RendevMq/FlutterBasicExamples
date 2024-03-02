import 'package:flutter/material.dart';
import 'package:w10_e1movieapp/models/movie_model.dart';
import 'package:w10_e1movieapp/pages/detail_page.dart';
import 'package:w10_e1movieapp/ui/general/colors.dart';
import 'package:w10_e1movieapp/ui/widgets/line_widget.dart';

class ItemMovieWidget extends StatelessWidget {
  // const ItemMovieWidget({super.key});

  // Map movieMap;
  MovieModel movieModel;

  ItemMovieWidget({required this.movieModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(movieId: movieModel.id,)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: height * 0.62,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://image.tmdb.org/t/p/w500/${movieModel.posterPath}",
            ),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 5))
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBrandPrimaryColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movieModel.originalTitle,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 6,
                    ),
                    LineWidget(width: 100),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      movieModel.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              movieModel.releaseDate
                                  .toString()
                                  .substring(0, 10),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              movieModel.voteCount.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff232320).withOpacity(0.8),
                ),
                child: Text(
                  movieModel.voteAverage.toStringAsFixed(1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
