class NewsArt{
   String imgurl;
   String newshead;
   String newscnt;
   String newsdescription;
   String newsurl;

   NewsArt({
     required this.imgurl,
     required this.newshead,
     required this.newscnt,
     required this.newsdescription,
     required this.newsurl,
   });

    static NewsArt fromApiToApp(Map<String, dynamic> article){
      return NewsArt(
        imgurl: article["urlToImage"] ?? "https://th.bing.com/th/id/R.3c66c8f67c6060f4be8c6073ed07533c?rik=uAkPRBybaMmapQ&pid=ImgRaw&r=0",
       newshead: article["title"] ?? "--",
        newscnt: article["content"] ?? "--",
        newsdescription: article["description"] ?? "--",
        newsurl: article["url"] ?? "https://news.google.com/search?q=top%20news&hl=en-PK&gl=PK&ceid=PK%3Aen");
    }

}