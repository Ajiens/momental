import 'package:flutter/material.dart';

import 'package:momental/Forum/models/postingan.dart';
import 'package:momental/Forum/widget/postingan_card.dart';
import 'package:momental/constant/query.dart';

class ScrollingForum extends StatefulWidget {
  const ScrollingForum({super.key});

  @override
  State<ScrollingForum> createState() => _ScrollingForumState();
}

class _ScrollingForumState extends State<ScrollingForum> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  List<Postingan> postingan = [];
  int _offsetQuery = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    getData();
  }

  @override
  void dispose(){
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> getData() async {
    var db = Database();
    var queryStr = '''
      SELECT U.username, K.nama_komunitas, K.tagline, P.konten, P.is_poll, P.created_at, P.id_postingan, P.id_komunitas, P.email_pembuat
      FROM POSTINGAN P
      JOIN KOMUNITAS K ON P.id_komunitas = K.id_komunitas
      JOIN PENGGUNA U ON P.email_pembuat = U.email
      ORDER BY created_at DESC
      LIMIT 10 OFFSET $_offsetQuery
    ''';

    try{
      List<Postingan> temp = await db.query(
        queryStr, 
        fromMap: (row) => Postingan.fromMap(row)
      );
      setState(() {
        postingan = postingan + temp;
        _offsetQuery += 10;
      });
    } catch (e){
      print(e.toString());
    }
  }

  void _scrollListener() {
    if (isLoading) return;

    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      setState(() {
        isLoading = true;
      });

      getData();

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller:  _scrollController,
      // itemExtent: 14,
      itemCount: isLoading ? postingan.length+1 : postingan.length,
      itemBuilder: (context, index) {
          print(postingan[index].idPostingan);
          return PostinganCard(postingan: postingan[index]);
        // if (index < postingan.length){
        // }else{
        //   return const Center(child: CircularProgressIndicator());
        // }
    });
  }
}