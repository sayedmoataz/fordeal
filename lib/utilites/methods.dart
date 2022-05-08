// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../screens/seatch/search_tf.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({Key? key, required this.image, required this.name, required this.offer}) : super(key: key);
  final String image;
  final String name;
  final String offer;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey.withOpacity(0.2),
      height: height * 0.38,
      width: double.maxFinite,
      padding: EdgeInsets.only(top: 12, right: 12, left: 12),
      child: Column(
        children: [
          SizedBox(
            child:CachedNetworkImage(
              errorWidget: (context, url, error) =>
                  Icon(
                    Icons.error,
                    size: 60,
                  ),
              imageUrl:image ,

              fit: BoxFit.cover,
            ),

            height: height * 0.28,
            width: double.infinity,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12, right: 12, left: 12),
              color: Colors.white,
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    offer,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key, required this.shownText, required this.myContext}) : super(key: key);
  final String shownText;
  final BuildContext myContext;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (myContext)=>SearchTF()));
      },
      child: Container(
        height: 35,
        width: double.maxFinite,
        decoration:
        BoxDecoration(
            border: Border.all(
              color: Colors.amber,
            ),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
        child: Row(
          children: [Icon(Icons.search),
            Text(shownText),Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined),color: Colors.grey,),
            Container(
            child: Center(child: Text('      بحث     ',style: TextStyle(color: Colors.white),)),
            height: 35,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15)
            ),
          )],
        ),
      ),
    );
  }
}
// class SearchInput extends StatelessWidget {
//   final TextEditingController textController;
//   final String hintText;
//   const SearchInput(
//       {required this.textController, required this.hintText, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(boxShadow: [
//         BoxShadow(
//             offset: const Offset(12, 26),
//             blurRadius: 50,
//             spreadRadius: 0,
//             color: Colors.grey.withOpacity(.1)),
//       ]),
//       child: TextField(
//         controller: textController,
//         onChanged: (value) {
//           //Do something wi
//         },
//         decoration: InputDecoration(
//           prefixIcon: const Icon(
//             Icons.search,
//             color: Color.fromARGB(255, 203, 202, 206),
//           ),
//           filled: true,
//           fillColor: Color.fromARGB(255, 175, 172, 172),
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//           border: const OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(25.0)),
//           ),
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white, width: 1.0),
//             borderRadius: BorderRadius.all(Radius.circular(25.0)),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white, width: 2.0),
//             borderRadius: BorderRadius.all(Radius.circular(25.0)),
//           ),
//         ),
//       ),
//     );
//   }
// }

class productCard extends StatelessWidget {
  const productCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        width: 220,
        height: height * 0.33,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            "assets/1.jpg",
            height: height * 0.25,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 6),
            child: Text(
              "where finishing",
              style: TextStyle(color: Colors.grey.withOpacity(0.8)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "US\$ 10.06",
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}


class BottomIcons2 extends StatelessWidget {
  const BottomIcons2({Key? key, required this.iconName, required this.icona, required this.color})
      : super(key: key);
  final String iconName;
  final String icona;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Column(
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.asset(
                icona,
                color: color,
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Text(iconName),
          ],
        ),
      ],
    );
  }
}

