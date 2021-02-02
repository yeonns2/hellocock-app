import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hellocock/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final User user;
  final DocumentSnapshot document;
  VideoPlayer(this.user, this.document);
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _controller;

  //String videoId = YoutubePlayer.convertUrlToId(widget.document['youtube_url']);

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.document['youtube_url']),
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      progressColors: ProgressBarColors(
          backgroundColor: kBodyTextColor,
          playedColor: kActiveColor,
          handleColor: kActiveColor),
      controller: _controller,
      //showVideoProgressIndicator: true,
      onReady: () {
        print('Player is ready.');
      },
    );
  }
}
