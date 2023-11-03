import 'package:flutter/material.dart';
import "package:zome/Preview.dart";

var data = [
  'https://media.gq.com/photos/5c5dcc945f50ad625e919ed6/master/pass/Acne-Studios-River-slim-tapered-jeans.jpg',
  'https://cdn.pixabay.com/photo/2016/12/06/09/30/blank-1886001_640.png',
  'https://i.etsystatic.com/19192884/r/il/feea9a/3648414538/il_fullxfull.3648414538_alnx.jpg',
  'https://m.media-amazon.com/images/I/515gKnUgwpL._UX679_.jpg',
  'https://m.media-amazon.com/images/I/41coVLX+EsL._SY300_SX300_.jpg',
  'https://m.media-amazon.com/images/I/41coVLX+EsL._SY300_SX300_.jpg',
  'https://assets.ajio.com/medias/sys_master/root/20230622/Q5jt/6494798ad55b7d0c63a248d2/-473Wx593H-460929914-grey-MODEL.jpg'
];

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Merchant App"),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
            icon: const Icon(Icons.search),
          )
        ],
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Material(
            shape: const CircleBorder(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 16.0), // Adjust the top padding as needed
        child: Center(
            child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GridView.builder(
            itemBuilder: (context, index) => MyZoomableItem(data[index]),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 11,
              mainAxisSpacing: 10,
            ),
          ),
        )),
      ),
    );
  }
}

class MyZoomableItem extends StatefulWidget {
  final String imageUrl;

  MyZoomableItem(this.imageUrl);

  @override
  _MyZoomableItemState createState() => _MyZoomableItemState();
}

class _MyZoomableItemState extends State<MyZoomableItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: _isHovered
          ? Transform.scale(
              scale: 1.1,
              child: buildItem(),
            )
          : buildItem(),
    );
  }

  Widget buildItem() {
    return GestureDetector(
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.black,
        //     width: 2.0,
        //   ),
        // ),
        child: Image.network(
          widget.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        // Add your onTap functionality here
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ImageUploadPage(); // Navigate to a page passing the image URL
            },
          ),
        );
      },
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
