import 'package:flutter/material.dart';
import 'package:flutter_application/Home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataList extends StatelessWidget {
  String img;
  String title;
  DataList({
    super.key,
    required this.img,
    required this.title,
  });

  // final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 250.w,
            height: 250.h,
            child: CircleAvatar(backgroundImage: NetworkImage(img)),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Color.fromARGB(255, 232, 218, 218),
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 42, 93, 131),
              fixedSize: Size(120.w, 30.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
            child: const Text("Back"),
          ),
        ],
      ),
    );
  }
}
