import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/detail_view.dart';
import 'package:news_app/view/widgets/news_container.dart';

class NewsContainer extends StatelessWidget {
   String imgurl;
   String newshead;
   String newscnt;
   String newsdescription;
   String newsurl;

   NewsContainer({super.key,
   required this.imgurl,
   required this.newshead,
   required this.newscnt,
   required this.newsdescription,
   required this.newsurl,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,          
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage.assetNetwork(
                     height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    placeholder: "assets/images/placeholder.jpg", image: imgurl),
                    SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child:   Column(
                      children: [
                        Text(newshead.length >90 ? "${newshead.substring(0,90)}..." : newshead,
                         style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5),
                         Text(newsdescription, style: TextStyle(fontSize: 15, color: Colors.black45), ),
                        SizedBox(height: 20),
                         Text(
                          newscnt != "--" ?
                          newscnt.length >250 ? newscnt.substring(0,250) :
                          "${newscnt.toString().substring(0, newscnt.length-15)}..." : newscnt,
                          style: TextStyle(fontSize: 18),), 
                      ],
                    ), ) , 
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                           DetailViewScreen(newsurl: newsurl)
                           ));
                        },
                        child: Text("Read More"),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: 10),
                ],
               ),
    );
  }
}