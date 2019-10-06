import 'package:flutter/material.dart';
import 'attractionCard.dart';
import 'attractions.dart';

List<String> restaurantImgUrl = [
  "https://lastheplace.com/images/article-images/1aLatest2008Writers/august/strata-dining-and-bar-1.jpg",
  "http://www.elitetraveler.com/wp-content/uploads/2012/11/RESTAURANT-22-462x346.jpg",
  "https://media-cdn.tripadvisor.com/media/photo-s/14/e8/1f/aa/saranda-at-7-station.jpg",
  "https://media-cdn.tripadvisor.com/media/photo-s/0b/6c/7d/3a/restaurant.jpg",
  "https://www.telegraph.co.uk/content/dam/Travel/Destinations/Africa/Morocco/Marrakech/marrakech-restaurants-al-fassia.jpg?imwidth=480",
];

List<String> popularSpots = [
  "https://amp.businessinsider.com/images/556e02d6ecad04f57bb23cfe-1920-960.jpg",     //TajMahal
  "https://i.dailymail.co.uk/i/pix/2015/06/03/08/2951217000000578-0-image-a-7_1433317819954.jpg",   //London Eye
  "https://happinesstravelshere.com/wp-content/uploads/2018/01/Sydney-TravelLemming-1024x684.jpg",    //Sydney
  "https://i.dailymail.co.uk/i/pix/2014/03/11/article-2578198-1C312B3400000578-818_634x424.jpg",    //Paris
  "http://storage.torontosun.com/v1/dynamic_resize/sws_path/suns-prod-images/1297549003043_ORIGINAL.jpg?quality=80&size=650x",    //USA
];

List<String> nearMe = [
  "https://www.tourmyindia.com/blog/wp-content/uploads/2015/04/Untitled-design.png",
  "https://farm6.staticflickr.com/5125/5305133991_8cd7df1dd2_z.jpg",
  "http://www.buzzntravel.com/cache/photos/340x220_gandhinagar_40670.jpg",
  "https://blog.weekendthrill.com/wp-content/uploads/2016/05/053016_1024_15STUNNINGP12.jpg",
];
class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: SizedBox(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Travex !!',
                      style: Theme.of(context).textTheme.title.merge(TextStyle(fontSize: 25.0)),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) => SizedBox(
                          height: 80.0,
                          width: 300.0,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(popularSpots[index],fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: SizedBox(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Near You!',
                      style: Theme.of(context).textTheme.title.merge(TextStyle(fontSize: 25.0)),                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) => SizedBox(
                          height: 80.0,
                          width: 300.0,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(nearMe[index],fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: SizedBox(
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Top Restaurants!',
                      style: Theme.of(context).textTheme.title.merge(TextStyle(fontSize: 25.0)),                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) => SizedBox(
                          height: 80.0,
                          width: 300.0,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image.network(restaurantImgUrl[index],fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
