import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application/dataList.dart';
import 'package:flutter_application/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

Future<List<Data>> fetchData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    // print(jsonResponse);
    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Data>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Home"),
              automaticallyImplyLeading: false,
              backgroundColor: Color.fromARGB(255, 25, 27, 61),
            ),
            body: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  // print(snapshot.data![index].url);
                  final img = snapshot.data![index].url;
                  final title = snapshot.data![index].title;
                  return Padding(
                    padding: EdgeInsets.only(
                        right: 8.w, left: 8.w, top: 8.h, bottom: 8.h),
                    child: SizedBox(
                      height: 100.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color.fromARGB(255, 59, 76, 89),
                          fixedSize: Size(0.15.sw, 10.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.w),
                          ),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DataList(img: img, title: title),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50.w,
                              height: 50.h,
                              child: CircleAvatar(
                                  backgroundImage: NetworkImage(img)),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            SizedBox(
                              width: 300.w,
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 232, 218, 218),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // By default show a loading spinner.
        return const Center(
            child: SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
