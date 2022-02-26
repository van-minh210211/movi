import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:login/model/movied.dart';
import 'package:provider/provider.dart';
import 'MoviOverview.dart';
import 'network/Movi.dart';
class Homesceen extends StatefulWidget {
  const Homesceen({ Key? key }) : super(key: key);
  @override
  _HomesceenState createState() => _HomesceenState();
}

class _HomesceenState extends State<Homesceen> {
   late Future<Movied> movied;

   @override
   void didChangeDependencies() {
     movied = Provider.of<Movise>(context, listen: false).fetchMovi();
     super.didChangeDependencies();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: FutureBuilder<Movied>(
        future: movied,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final results = snapshot.data!.results;
            return GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2 / 3,
              ),
              itemCount: results?.length ,
              itemBuilder: (context, index) {
                 return  ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieOverview(
                              movie: results[index],
                            ),
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl:
                        'https://image.tmdb.org/t/p/w500${results?[index].posterPath}',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black87,
                      title: Text(
                        results![index].originalTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container();
        },
      ),
    );
  }

}
