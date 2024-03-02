import 'package:flutter/material.dart';
import 'package:w10_e1movieapp/models/movie_detail_model.dart';
import 'package:w10_e1movieapp/services/api_service.dart';
import 'package:w10_e1movieapp/ui/general/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:w10_e1movieapp/ui/widgets/item_cast_widget.dart';
import 'package:w10_e1movieapp/ui/widgets/line_widget.dart';

class DetailPage extends StatefulWidget {
  // const DetailPage({super.key});
  int movieId;
  DetailPage({required this.movieId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ApiService _apiServices = ApiService();
  MovieDetailMovie? movieDetailMovie;
  bool isLoading = true; //cargando

  getDataMovie() {
    _apiServices.getMovie(widget.movieId).then((value) {
      if (value != null) {
        movieDetailMovie = value;
        isLoading = false;
        print(movieDetailMovie);
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: !isLoading
          ? CustomScrollView(
              slivers: [
                //Solo van widgets de tipo sliver
                SliverAppBar(
                  title: Text(movieDetailMovie!.originalTitle),
                  centerTitle: true,
                  backgroundColor: Colors.indigo,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          "https://image.tmdb.org/t/p/w500${movieDetailMovie!.backdropPath}",
                          fit: BoxFit.cover,
                        ), // Image.network
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                kBrandPrimaryColor,
                                kBrandPrimaryColor.withOpacity(0.01),
                              ], // LinearGradient
                            ), // BoxDecoration
                          ), // Container
                        ), // Container
                      ], // Stack children
                    ), // Stack
                  ),
                  pinned: true,
                  floating: false,
                  snap: false,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    //CTRL + CLICK requiere un children obligatorio que es una lista de widgets
                    [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${movieDetailMovie!.posterPath}",
                                    height: 140,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: Colors.white70,
                                            size: 13,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            movieDetailMovie!.releaseDate
                                                .toString()
                                                .substring(0, 10),
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        movieDetailMovie!.originalTitle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white70,
                                            size: 13,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "${movieDetailMovie!.runtime} min",
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              "Overview",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            LineWidget(width: 50),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              movieDetailMovie!.overview,
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  Uri _uri = Uri.parse(
                                      movieDetailMovie!.homepage ?? "");
                                  await launchUrl(_uri);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kBransSecondaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                icon: Icon(
                                  Icons.link,
                                  color: kBrandPrimaryColor,
                                ),
                                label: Text(
                                  "Home Page",
                                  style: TextStyle(
                                    color: kBrandPrimaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              "Genres",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            LineWidget(width: 40),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 8, //separacion horizontal
                              //runSpacing: 2, //deparacion vertical
                              //crossAxisAlignment: WrapCrossAlignment.center,
                              children: movieDetailMovie!.genres
                                  .map(
                                    (e) => Chip(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      label: Text(
                                        e.name,
                                        style: TextStyle(
                                            color: kBrandPrimaryColor),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              "Cast",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            LineWidget(width: 25),
                            const SizedBox(
                              height: 16.0,
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ItemCastWidget(),
                                  ItemCastWidget(),
                                  ItemCastWidget(),
                                  ItemCastWidget(),
                                  ItemCastWidget(),
                                  ItemCastWidget(),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
