import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Card Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [         
            //Card1
            Container(
              // color: Colors.redAccent,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(4, 4),
                        blurRadius: 12),
                    const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, -5),
                        blurRadius: 6),
                  ]),
              child: Column(
                children: [
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black.withOpacity(0.66)),
                  ),
                  Container(
                    width: double.infinity,
                    // height: 40,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurpleAccent.withOpacity(0.6),
                          blurRadius: 10,
                          offset: const Offset(4, 4),
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Follorw me",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            
            //Card2
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      offset: Offset(4, 4),
                      blurRadius: 10)
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/imagex1.png",
                    height: 120,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fierela de las nieves azules",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting",
                          style: TextStyle(color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            //Card3          
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(4, 4)
                    )
                  ] 
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting",
                          maxLines: 6,
                        ),
                      ),
                    ),
        
                    //OPCION 1..PARA CONTENER LA IMAGEN
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(14),
                    //   child: Image.network(
                    //     "https://images.pexels.com/photos/16435325/pexels-photo-16435325/free-photo-of-casas-pueblo-campo-casa.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    //     height: 130,
                    //     width: 130,
                    //     fit: BoxFit.cover,
                    //   ),
                    // )
        
                    //OPCION 2..PARA CONTENER LA IMAGEN
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/16435325/pexels-photo-16435325/free-photo-of-casas-pueblo-campo-casa.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                              fit: BoxFit.cover)),
                    ),
                  ],
                )),
          
            //Card4
            //RETOS
            
          
          ],
        ),
      ),
    );
  }
}
