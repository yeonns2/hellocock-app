import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final DocumentSnapshot document;
  VideoPlayer(this.document);
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _controller;
  String videoId = "";

  @override
  void initState() {
    super.initState();
    videoId = widget.document['url'];
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoId),
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVideoUrl(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return CircularProgressIndicator();
          }
          return Stack(children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
            YoutubePlayer(
                aspectRatio: 16 / 9,
                onEnded: (data) {
                  _controller.pause();
                },
                progressColors: ProgressBarColors(
                    backgroundColor: kBodyTextColor,
                    playedColor: kActiveColor,
                    handleColor: kActiveColor),
                controller: _controller)
          ]);
        });
  }

  Future<String> getVideoUrl() async {
    String videourl = widget.document['url'];
    return videourl;
  }
}
