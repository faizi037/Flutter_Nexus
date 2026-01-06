import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'; 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
List<dynamic> photos =[];

   Future<void> getPhotos() async{
    Uri uri=Uri.parse('https://jsonplaceholder.typicode.com/posts');
      Response response = await get(
        uri,
 headers: {'Accept': 'application/json'},
      );
    if(response.statusCode==200){

debugPrint(response.statusCode.toString());
photos = await (jsonDecode(response.body));

    }else{
      debugPrint('Error Occur And Response is ${response.statusCode}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Photos')),
      ),

      body: Column(
        children: [
          /// Elvated button
           ElevatedButton(onPressed: () async{
              await getPhotos();
              setState(() {
                
              });
            }, child: const Text('Get Photos')),
          /// list of photos
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index) => const SizedBox(height: 16.0,),
            shrinkWrap:true,
            itemCount:photos.length,
          
          itemBuilder:(context,index){
            final photo=photos[index];
            return ListTile(
              title: Text(photo['title'] ),
leading: Image.network(
  'https://picsum.photos/seed/${photos[index]['id']}/100',
  errorBuilder: (context, error, stackTrace) =>
      const Icon(Icons.broken_image),
),

            );
          }
          )
          ),
        ],
      ),
    );
  }
}