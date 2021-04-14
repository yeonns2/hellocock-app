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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVideoUrl(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return CircularProgressIndicator();
          }
          return YoutubePlayer(
            progressColors: ProgressBarColors(
                backgroundColor: kBodyTextColor,
                playedColor: kActiveColor,
                handleColor: kActiveColor),
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(snapshot.data),
              flags: YoutubePlayerFlags(
                hideControls: true,
                controlsVisibleAtStart: true,
                autoPlay: true,
              ),
            ),
            showVideoProgressIndicator: false,
            onReady: () {
              print('Player is ready.');
            },
          );
        });
  }

  Future<String> getVideoUrl() async {
    String videourl = widget.document['url'];
    return videourl;
  }
}
