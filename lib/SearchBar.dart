import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
  
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Places to Visit"),
        backgroundColor: Color(0xffed622b),
        elevation: 10.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
          onPressed: (){
            showSearch(context: context,delegate: DataSearch());
          }
        

          
          )
        ],
      ),
      backgroundColor: Colors.white,
      
       body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return new StuffInTiles(listOfTiles[index]);
          },
          itemCount: listOfTiles.length,
        ),
        
    );
  }
}
class DataSearch extends SearchDelegate<String>{
  
final cities=[

  "kathmandu",
  "pokhara",
  "Butwal",
  "hetauda",
  "daran",
  "jhapa",
  "Mechi",	
	"Panchthar",	
	"Ilam",		
	"Koshi",	
	"Sunsari"	,
	"Dhankutta",	
	"Sankhuwasabha",		
  "Bhojpur"	,
	"Terhathum	",
	"Sagarmatha",	
	"Khotang",	
	"Solukhumbu",	
	"Udaypur",	
	"Saptari",	
	"Siraha",	
	"Janakpur",	
	"Mahottari",	
	"Sarlahi",	
	"Sindhuli",	
	"Ramechhap",
	"Dolkha",	
	"Bagmati	",
	"Kavreplanchauk",	
	"Lalitpur",	
	"Bhaktapur",	
	"Nuwakot",
	"Rasuwa",	
	"Dhading",
	"Narayani",	
	"Rauthat",
	"Bara",	
	"Parsa",	
	"Chitwan",	
	"Gandaki",	
	"Lamjung"	,
	"Tanahun",	
	"Syangja",	
	"Kaski",	
	"Manag",	
	"Dhawalagiri",	
	"Parwat",	
	"Myagdi",	
	"Baglung",	
	"Lumbini",		
	"Palpa",	
	"Nawalpur",	
	"Parasi",	
	"Rupandehi",	
	"Arghakhanchi",	
	"Kapilvastu",	
	"Rapti",	
	"Rolpa",	
	"Rukum",
	"Salyan",	
	"Dang",	
	"Bheri",	
  "Bardiya",	
  "Gulriya",
	"Surkhet",	
  "Birendranagar",
	"Dailekh",	
	"Banke",
  "Nepalgunj",
	"Jajarkot",	
	"Karnali",	
	"Humla",	
  "Simikot",
	"Kalikot",
  "Manma",
  "Mugu",	
	"Jumla",	
  "Seti",	
	"Bajhang",	
	"Achham",	
	"Doti",	
	"Kailali",	
	"Mahakali",
	"Kanchanpur",	
  "Mahendranagar",
	"Dadeldhura",	
	"Baitadi",	
	"Darchula",
];
final recentcities=[

  "kathmandu",
  "pokhara",
  "Butwal",
];
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),onPressed: (){
         query="";
        },
        
      )
      
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon:AnimatedIcons.menu_arrow ,
        progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
  return  new Container(
child: new ListView.builder(
itemBuilder: (BuildContext context, int index) {

},
itemCount: listOfTiles.length,),
);
}
  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone search for something
    final suggestionList=query.isEmpty?recentcities:cities.where((P)=>P.startsWith(query)).toList();


    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        onTap:(){
          showResults(context);
        },
      leading:Icon(Icons.location_city) ,
      
      title: RichText(
        
        text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black,fontWeight: FontWeight.bold),
            
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
                
                ),
           
            ]
          ),
          
           ),
           
      ),
      
      itemCount: suggestionList.length,
      );

  }
  
}



  


class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty)
      return new ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          onLongPress: () => print("long press"),
          onTap: () => print("tap"),
          selected: true,
          
          title: new Text(t.title));

    return new ExpansionTile(
      
      title: new Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;
  
  MyTile(this.title, [this.children = const <MyTile>[]]);

  toLowerCase() {}
}

List<MyTile> listOfTiles = <MyTile>[

  
  
  new MyTile(
    'Kathmandu',
    <MyTile>[
      
      new MyTile(
        
        'Pasupatinath Temple',
        <MyTile>[
        
          new MyTile(
            'The Pashupatinath Temple is considered one of the holiest place for the Hindus. It is located 6 km east from Kathmandu. The structure is a two-storey building and is built in pagoda style. The site is a collection of temples, ashrams, images and inscriptions. The structures in this perimeter were raised over the centuries and lies right besides the banks of the holy Bagmati river. The temple has been on the World Heritage list since 1979.',),
        ],
         
      ),
     
      new MyTile(
        'Swayambhunath Stupa',
      <MyTile>[
        
        new MyTile('Swayambhunath Stupa is believed to be around 2500 years old and because of this it is considered probably one of the oldest monuments making its name in the list. The structure represents the four elements of earth, fire, wind and water. The 13 rings of the spire symbolizes the 13 steps of the ladder leading to Nirvana. There are 365 steps passing through which you will reach the holy site of Swayambhunath stupa.')
      ],
      ),


      new MyTile(
        'Boudhanath Stupa',
        <MyTile>[
          new MyTile('This Boudhanath Stupa is one of the oldest and biggest monument built in the Himalayan nation. The structure was built around the 5th century A.D. It is a 36 m high unique three level mandala style structure. People following Buddhist religion flock in thousands during the Buddhist festivities. This monument is more or less similar to the Swayambhunath Stupa.')
        ],
        ),

new MyTile(
  'Kathmandu Durbar Square',
   <MyTile>[
     new MyTile('This is an ancient royal courtyard which lies in the heart of the capital city, Kathmandu. Another name for Kathmandu Durbar Square is Hanuman Dhoka Palace. The latter is more of a popular name these days. This is the ancient royal courtyard of the Nepalese royalty. There are many temples which are dedicated to different Hindu deities. Most of the buildings here were constructed from the 15th – 18th century. The palace is named after the Hindu god Hanuman, who is regarded as the protector of the entire palace.')
   ],
),

new MyTile(
  'Patan Durbar Square',
  <MyTile>[
new MyTile('The Patan Durbar Square is situated only 8 km south-east of Kathmandu city. This city is one of the oldest cities in Kathmandu valley. The city was founded in the 3rd century. It is an open museum of the finest Newari craftsmanship. The Hindu and Buddhist monuments are scattered around this ancient royal courtyard.')
  ],
),

new MyTile(
  'Changu Narayan Temple',
   <MyTile>[
     new MyTile('The ancient Hindu temple of Changu Narayan is located on a high hilltop that is also known as Changu or Dolagiri. This historic structure was built around the 3rd century A.D. The area was surrounded by forest with champak tree and a small village known as Changu village. It is located 12 km east of Kathmandu and few mile north of Bhaktapur.')
   ]
),


new MyTile(
  'Nagarkot',
   <MyTile>[
     new MyTile('A Top spot in tourist places in Kathmandu, travellers can enjoy Himalayan views and the panorama here. Nagarkot is well known for its stunning natural beauty and a number of hotels. The village is stacked up with hotels and accommodations, allowing you to view nature straight from the balcony. The views itself are breathtaking and it can get quite cold in here!----------Highlights:The sunrise view of the Mount Everest and other peaks gives this place a considerable edge. The major highlight of this place is the fact that 8 out of 13 Himalayan ranges in Nepal are visible from this place. The place is known for its views of the Kathmandu valley, Shivapuri National Park, Numbur Forest, Rolwaling range, Ganesh himal and Langtang range.------The location is actually quite strategic. Once upon a time, this place served as the ancient fort for Kathmandu valley. At that point of time, it was used to monitor other kingdoms. Today, it is a popular hill station, where you can stay and enjoy a blissful holiday.-------Location: Nagarkot, Bhaktapur District.')
   ]
),


new MyTile(
  ' Narayanhiti Palace',
   <MyTile>[
     new MyTile('Want to know how the politics have transformed Nepal? Well, things will get a lot clearer when you visit the Narayanhiti Palace and Museum. Full of meeting rooms and 1970s glamour, the palace has opulent interiors. The place is well known for its museum beauty. Once, King Gyanendra lived in it, but he was given 15 days to vacate the property after his fall from the throne.--------Highlights:This palace is also the place where Prince Dipendra massacred his family in 2001. The place is morbidly market and the bullet holes are still visible on some of the walls. But nevertheless, this place offers a peek into the regal lifestyle of the royals, the one that people only dream about.-------Location:Kathmandu.')
   ]
),



new MyTile(
  'Langtang National Park',
   <MyTile>[
     new MyTile('Explore starry nights, have a rendezvous with the wild and discover the joys of nature by visiting Langtang National Park. The fourth national park and the first Himalayan National Park in the country encompass 26 Village Committees. The stunningly beautiful park has borders with Tibet and follows the course of Bhote Kosi and Trisuli rivers.------Highlights: With forests of pine and bamboo trees, this park captures attention instantly. It ascends through the pastures at the alpine meadows and it is right here where you will find outstanding mountain views. The flora and fauna of this place is just incredible, one of the reasons why it is perfect for hiking and camping trips. Langtang national park is also known as a great trekking place in Kathmandu. The place has decent tea houses and quite friendly locals who can help you through the course of your journey.-------Location:Close to Kathmandu.')
   ]
),


new MyTile(
  'Garden of Dreams',
   <MyTile>[
     new MyTile('The beautifully restored Swapna Baigicha, also known as Garden of Dreams is a popular tourist place in Kathmandu to visit offers respite and rejuvenation from the stresses of the world. It is one of the most stunning places in the world. The garden was built in the 1920s and has been brought back to life by the Austrian financed team. The stunningly restored garden has gorgeous and refined details.----------Highlights:Some of the main highlights of this place includes marble inscription from Omar Khayam’s Rubaiyat, beautiful fountains and ponds. The palace is home to a quirky ‘hidden garden’ as well. It also features three pavilions. The place is ideal for going out for a picnic or just to marvel at the human-nature interaction. The place is a must visit for travelers.----------Location:Kathmandu.')
   ]
),


new MyTile(
  'Hanuman Dhoka Temple',
   <MyTile>[
     new MyTile('A part of the Durbar Square of Kathmandu, it is a complex of buildings which consists of the royal palaces of Malla kings and the Shah Dynasty. Spread over a whopping 5 acres, the place gets its name from the standing statue of the Hindu Lord Hanuman on the entrance and lists among best tourist places in Kathmandu, “Dhoka” in Nepali meaning door or gate.The statue itself dates back to 1672. The door is the entrance to the complex of Palace inside and is also the entryway to the Nasal Chok, Mul Chok, Mohan Chok and the Tribhuvan Museum, which exhibits the royal belongings of King Tribhuvan.---------Location- Durbar Square, central Kathmandu')
   ]
),

new MyTile(
  'Ashok Binayak',
   <MyTile>[
     new MyTile('A religious site, Ashok Binayak Temple is the place that shouldn’t be missed. In the midst of rubbles from the temples, a tiny golden shrine lies at the top of Maru Tole, this shrine is one of the most important shrines in the valley. Lord Ganesha is one of the most loved gods among the locals in Kathmandu and hence, this shrine has hundreds and thousands of visitors every single day. the place holds high regards in Kathmandu and is a must visit tourist place in Kathmandu.-----Highlights: If you are heading for a trek or wish to explore the place to the fullest, then make sure that you visit the temple. The temple has a self-serve tika dispenser as well, with the rejuvenating ringing of bells that will leave you de-stressed. It is believed that visiting this place will ensure safety on a forthcoming journey.-------Location: Kathmandu.')
   ]
),


new MyTile(
  'Kirtipur',
   <MyTile>[
     new MyTile('A wonderful sense of faded grandeur, coupled with serenity and sleepiness makes Kirtipur a must visit. The impressive medieval temples dot this place. Located close to Kathmandu, the district is primarily known for its historic treasures and part of a long list of places to visit in Kathmandu.--------Highlights: The highlights of this place is how it can help you transcend into a bygone era. Apart from the temples and the medieval architectures, the place is known for its historic story, wherein when Prithvi Narayan Shah stormed into the valley in 1768 and won the town, he ordered that nose and lips be cut off every male in the town. Only those who could play wind instruments were left with their nose and lips. The town, which was shaken by the earthquake has largely been restored. The place offers multiple panoramas of some beautiful mountains across the country which makes it a favoured tourist place in Kathmandu.--------Location: Kirtipur, Kathmandu District.')
   ]
),



new MyTile(
  'Royal Botanical Gardens',
   <MyTile>[
     new MyTile('Kathmandu can get quite crowded during the holidays. But if you want someplace peaceful and quiet, then there’s a perfect spot for you. It is the Royal Botanical Gardens. The place is quaint and great for walking and picnic. However, you might want to avoid it on Fridays and Saturdays, as schoolkids often visit the place then. While the place was slightly damaged during the earthquake, repairs are going on and the place will be back to its glory.--------Highlights:One of the main highlights of this place is the visitor center, where you can experience an enormous variety of Nepal’s flora. The place includes cactus house, orchid house and a tropical house as well. In the middle of the center is the coronation pond, with a pillar. Add the Botanical Garden in the list of places to visit in Kathmandu, if you want to enjoy the beautiful nature in Nepal. ---------Location: Godavari, Kathmandu.')
   ]
),


new MyTile(
  '	Bhaktapur',
   <MyTile>[
     new MyTile('Bhaktapur is the largest of the three Newar kingdoms in the Kathmandu Valley of Nepal. Until the second half of the 15th century, it served as the capital of Nepal. Listed as a UNESCO World Heritage Site, this city is known from its rich culture and well-preserved palace courtyards and temples. It is home to the country’s traditional art, architecture and craft works.From time immemorial, this city lay on the trade route between Tibet and India. Nyatapola Temple, Bhairab Nath Temple, Dattatraya Temple, Changu Narayan, Layaku (Durbar Square), Ta Pukhu (Siddha Pokhari) and Kailashnath Mahadev Statue are some of the major attractions here.-------Highlights:The city is also famous for its Ju Ju dhau, a special type of curs, which is believed to have a unique taste that cannot be found nowhere else in Nepal. Popular mask dances centered around the lives of different deities are performed here.-----------Location: Bhaktapur District, Nepal.')
   ]
),


new MyTile(
  'Thamel',
   <MyTile>[
     new MyTile('A haven for tourists visiting Kathmandu, Thamel is a popular destination. The place has several hotels, shops and restaurants that are particularly designed to cater to a discerning range of customers.The commercial location is an easy walk from central Kathmandu and there are a number of activities that you can enjoy at this place.all its attractions makes it a place to visit in Kathmandu you cannot miss during your trip. --------Highlights: The streets are quite fascinating at Thamel. But be cautious of sellers who might want to rip you off. Otherwise, the place is good for buying anything from Tibetan Singing Bowls to Glass Pipes. Just remember to bargain a little as the prices can come down to 2/3rdof the quoted prices.Here, you can also enjoy shopping incense sticks, Kukri swords, outdoor outfits and books. Over a hundred different eateries are located at this market. So, eat whatever cuisine you wish to try.------------Location: Thamel, Kathmandu.')
   ]
),


new MyTile(
  'White Monastery',
   <MyTile>[
     new MyTile('Nepal holds a prominent place in Buddhist culture. The country has a number of monasteries, including Seto Gumba or the White Monastery. This is a natural beauty with the relevant religious importance. The white monastery is surrounded by lush green valley and vivid terrain which makes it such a delight to watch and a must place you cannot miss to visit in Kathmandu.---------Highlights: The White Monastery gives heavenly pleasure and provides bird eye’s view of the Kathmandu Valley. One of the main highlights of this monastery is its white colour as well as the serenity and calmness that it has to offer. The monastery has several murals, statues and paintings that can provide in-depth information about Buddhism. The place is on off-beaten track but located close to the Swoyambhunath Stupa.----------Location: Kathmandu.')
   ]
),


new MyTile(
  'Casino Royale',
   <MyTile>[
     new MyTile('Get ready to look suave. Style yourself in a tuxedo and throw away your backpack for a while. Polish up on some Sean Connery impressions and explore the royal world of Casino Royale, one of the most popular casinos in the country. This former Rana Palace at the Yak and Yeti Hotel is the perfect place to visit and hang out in a Kathmandu.--------Highlights: One of the leading casinos in the area, the place has a number of tables where you can enjoy gambling, card games and other plays. If you stay here long enough, you may even get the opportunity to enjoy sumptuous dinner buffets. Frequented by tourists and locals alike, the casino is an ideal place for a conversation or for socializing. Oh! And don’t forget to try slot machines.---------Location: Located in Kathmandu.')
   ]
),



new MyTile(
  '',
   <MyTile>[
     new MyTile('')
   ]
),



new MyTile(
  '',
   <MyTile>[
     new MyTile('')
   ]
)





    ],
  ),
  new MyTile(
    'Pokhara',
    <MyTile>[
      new MyTile(
        'Phewa Lake',
        <MyTile>[
     new MyTile('A freshwater lake in the Pokhara Valley region of Nepal, it is the most visited spot in the country. It is kept in check by the help of a Dam and is fed by a river stream, making it somewhat a mixture of man-made and natural freshwater lake. The second largest lake in the country, it is extremely famous for the natural beauty, the Barahi Temple which is based on an island in the lake, and the mirror-like reflections of the Annapurna, Dhaulagiri and Machhapuchhre in its waters. ')
   ]
        ),

new MyTile(
  'Devi’s Fall',
   <MyTile>[
     new MyTile('Devi’s fall is a waterfall in the Pokhara region of Nepal, where when the water drops down, it forms a sort of underground tunnel of about 30m deep and 150m long. It is named after the woman who lost her life because of drowning in the pit here.The water in falls comes from the Phewa Lake reservoir. This place is a famous attraction for visitors from all around the world who come here to witness the beauty and pray at the nearby Gupteshwor Mahadev cave.')
   ]
),

new MyTile(
  'Begnas Tal -Lake',
   <MyTile>[
     new MyTile("A quiet freshwater lake in Kaski district of Nepal that changes colour depending on the season. it is the second largest of the eight lakes in Pokhara valley with a maximum depth of 10 meters. Since it is visited comparatively less, the original beauty is undisturbed. The lake supports irrigation and fisheries. The water level in the lake is regulated by a dam constructed in 1988 as it fluctuates with season and because of use for irrigation. The pressure of increasing human population is forcing conversion of the swampy area into land for cultivation. Location: It takes about 40 minutes by bus from Pokhara to reach the lake. Not far from the maddening crowd but extremely clean and quiet")
   ]
),

new MyTile(
  'Bindyabasini Temple',
   <MyTile>[
     new MyTile('The temple comes with its own beauty which makes the temple a beautiful place to visit in Nepal.     Location:   Situated at a height of 3000 ft. above sea level and dedicated to Goddess Bhagawati, this is one of the oldest temples in Pokhara valley.     Highlights:  Situated on a hillock near busy old bazaar of Pokhara, this wonderful religious landmark has immense natural beauty and is worshipped by Hindus and Buddhist alike.Worshipers flock to this place to perform animal sacrifice, especially on Saturdays.')
   ]
),

new MyTile(
  'Nagarkot Sunrise',
   <MyTile>[
     new MyTile('Located in central Nepal, Nagarkot is snuggled at the rim of the Kathmandu Valley and gives the views of the splendid Himalayas. This quaint village is settled at an elevation of 2,175 m and the aura of the quarter is forever enticing. The land is all over laced with the beautiful greens and breathtakingly beautiful landscapes. One must not dare to miss the Nagarkot sunrise view and for this, there are several Nagarkot sunrise day tours available from which you can choose.     ---- From the peak, you can even take a glimpse of the beautiful Mount Everest which is on the northeastern side or you can take a look at the serene temples which on the western side. If you are a nature lover or a fanatical photographer then this is your place to be as it owns a bag full of surprises for you.')
   ]
),

new MyTile(
  'Annapurna Base Camp - For Trekking',
   <MyTile>[
     new MyTile('The trail that progresses towards the Annapurna Base Camp is bedecked with scenery and sights of every kind imaginable. Steady and gradual climbs through its dense forests and fertile terrace fields bring us to be amazed by the majestic and upright peaks of the Annapurna Mountains. Nayapul, Ghandruk, Sinuwa, Deurali and the base camp are the spots you will stay overnight during the trek.Traversing the scenic vistas, over course of nine days you will be engaging yourselves trekking through carpeted ridges and ravines to arrive at Machapuchare Base Camp (3700m) and finally towards the destination of this epic journey, Annapurna Base Camp, and then back to Pokhara.     --- Temperature: Day: 15°C to 20 °C and Night: 0°C to 5°C        ---- Maximum Altitude: 13,550 ft')
   ]
),

new MyTile(
  'Temple of Tal Varahi',
   <MyTile>[
     new MyTile('Tal Varahi or Tal Barahi is a lake temple in the Kaski District of Nepal. Dedicated to the Hindu Goddess Durga, this temple is located on a small island in the Lake Phewa of Pokhara, and is a great source of spirituality in the Nepalese Hindu population.   -----Highlights: Surrounding lake adds a lot of grace to this most famous Hindu temple in Pokhara. Built in the 18th century it is dedicated to Lord Vishnu in his boar incarnation. The temple has been comprehensively renovated over the years and so the pigeons have decided to make it their permanent shelter. A must visit not only for the religious mind but also for a regular tourist.')
   ]
),

new MyTile(
  'International Mountain Museum',
   <MyTile>[
     new MyTile('If you want to dig deeper into the history of mountains and other mountaineering activities, the best thing would be to take a look at the International Mountain Museum.It has documented some of the important things realted to mountains. You can find some of the hidden mysteries pertaining to Mount Everest.---------Highlights: You can check out the records of several mountaineers like Mr Herzog. It is however one of the must visit place when you are in Pokhara.')
   ]
),

new MyTile(
  'Gurkha Memorial Museum',
   <MyTile>[
     new MyTile('The amazing Gurkha Memorial Museum talks about the contribution of the Gurkha soldiers which had later joined the Indian army. The museums will definitely leave you jaw dropped as you will witness the Gurkha uniforms which is displayed in the museum. One can also view the bravery medal which they have won in the past.---------Highlights: You can also view the service Khukri which is the traditional Gurkha knife used during the war times and the museum is only open from 8:30 am to 4:30 pm.')
   ]
),



new MyTile(
  'Rupa Lake',
   <MyTile>[
     new MyTile('A quiet freshwater lake in Kaski district of Nepal that changes colour depending on the season. it is the second largest of the eight lakes in Pokhara valley with a maximum depth of 10 meters. Since it is visited comparatively less, the original beauty is undisturbed. The lake supports irrigation and fisheries. The water level in the lake is regulated by a dam constructed in 1988 as it fluctuates with season and because of use for irrigation. The pressure of increasing human population is forcing conversion of the swampy area into land for cultivation. -------Location: It takes about 40 minutes by bus from Pokhara to reach the lake. Not far from the maddening crowd but extremely clean and quiet.  ------Highlights: Boating, fishing and swimming are some of the activities you can indulge in, the bonus being surrounding green mountains.')
   ]
),

new MyTile(
  'Pokhara Shanti Stupa',
   <MyTile>[
     new MyTile('A Pagoda style buddhist monument which is located on the hill top of Ananda hill. You have to trek till the top to have the spectacular look of the place.--------Highlights: This trek allows you to have a full view of Phewa Lake and some of the most gigantic mountains too.')
   ]
),



new MyTile(
  'Gupteshwor Mahadev Cave',
   <MyTile>[
     new MyTile('Caves have always been mysterious but the curious thing about this Gupteshwor Mahadev Cave is that it comes with a religious bent too. One of the huge stalagmite is usually worshipped as Shiva Lingam. The peaceful atmosphere of the cave will definitely soothe your senses and will let you introspect a little bit. --Amidst the regular hustle and bustle of the city, it is a good place to spend some peaceful time. If you planning to visit this place it will be advisable for you to carry a torch along as it is usually dark. -------Highlights: The Gupteshwar Mahadev Cave is a combination of Devi’s fall in the upstream and the cave in the downstream, one has to climb down the metal stairs to have a real look. Although it is a bit scary but its definitely worth a watch.')
   ]
),




new MyTile(
  'Mahendra Cave',
   <MyTile>[
     new MyTile('If you are a strong Hindu believer, you wouldn’t miss the chance to visit Mahendra cave. The cave was named after Mahendra Bir Bikram Shah Dev and has several stalactites and stalagmites along with a statue of Lord Shiva which attracts almost thousands of visitors every year. ------Highlights: You cn also visit the Bat Cave which lies on a ten minutes walking distance from this cave and is also an important tourist attraction.')
   ]
),




new MyTile(
  'Ghorepani Hill',
   <MyTile>[
     new MyTile('Experience stunning views of the Annapurna range. Enjoy eating hearty meals during this introductory trek. If you are interested in doing a safe, beginner’s level trek, then this oddly comfortable trek is the right option for you.  ----------Highlights: The trek usually takes 2-5 days, depending on the tour you decide to go with. The energizing fresh mountains and the enthralling natural beauty of dramatic Annapurna range will cast an impression on your mind.The leisurely trip will also involve a cultural exchange, giving travellers the opportunity to meet and greet people from Nepali. The trek usually begins from Poon Hill and provides you with a chance to discover the Lake City of Pokhara.-------Location: Poon Hill.')
   ]
),
      
    ],
  ),
  new MyTile(
    'Rupendehi',
    <MyTile>[
      new MyTile('Google'),
      new MyTile('Samsung'),
      new MyTile(
        'OnePlus',
        <MyTile>[
          new MyTile('1'),
          new MyTile('2'),
          new MyTile('3'),
          new MyTile('4'),
          new MyTile('5'),
          new MyTile('6'),
          new MyTile('7'),
          new MyTile('8'),
          new MyTile('9'),
          new MyTile('10'),
          new MyTile('11'),
          new MyTile('12'),
        ],
      ),
    ],
  ),
  
];