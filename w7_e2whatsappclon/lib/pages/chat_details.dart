import 'package:flutter/material.dart';
import 'package:w7_e2whatsappclon/data/data_dummy.dart';

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25, //Para controlar el espaciado por la izquierdda
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ),
            const SizedBox(
              width: 8,
            ),
            //Lo envoolvermos en un expand para que no haya d esbordameinto, ya que si el nombre es muy extenso se rompe ya que la columna es quien se esta adaptandoo.. entonces al colocar un expand.. esto ya no sucede porque se adapta al espacio sobrante

            //Por ser AppBar completa con "..."
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ximena Lopez",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Last seen today 2:20 PM",
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Stack(children: [
        //Fondo
        Container(
            //Por estar dentro de un stack, se adapta a todo
            color: Colors.black.withOpacity(0.09)),

        //Listado de mensajes
        ListView.builder(
          itemCount: chatMessageList.length,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              //Aparte que lo alinea ya no occpua todo el ancho
              alignment: chatMessageList[index].messageType =="me" ? Alignment.topRight : Alignment.topLeft , 
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: chatMessageList[index].messageType =="me" ?Color(0xffE3FFC4) : Colors.white,
                  borderRadius:  BorderRadius.only(
                      bottomRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                      topRight: chatMessageList[index].messageType =="me" ? Radius.circular(0) : Radius.circular(14),
                      topLeft: chatMessageList[index].messageType =="me" ? Radius.circular(14) :  Radius.circular(0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        offset: const Offset(4, 4),
                        blurRadius: 10.0)
                  ],
                ),
                child: Text(chatMessageList[index].messageContent),
              ),
            );
          },
        ),

        //Input del nuevo mensaje //Scafoold
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type message",
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 16,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.sentiment_satisfied_alt,
                        size: 30,
                        color: Colors.black45,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize
                            .min, //Establecemos al ancho minimo para que no hayya problemas
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attach_file,
                              size: 30,
                              color: Colors.black45,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Colors.black45,
                            ),
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                        ],
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                GestureDetector(
                  onTap: () {
                    print("HOLA");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color(0xff00887B),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
