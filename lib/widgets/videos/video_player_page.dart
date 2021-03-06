import 'package:d_and_d/models/videos_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../side_drawer.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({required this.videoItem});
  final VideoItem videoItem;

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  //
  late YoutubePlayerController _controller;
  late bool _isPlayerReady;

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoItem.video.resourceId.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      //
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        title: const Text("Guide"),
      ),
      body: SingleChildScrollView (child: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              _isPlayerReady = true;
            },
          ),
          Padding(padding: const EdgeInsets.all(10),child:
            Text(widget.videoItem.video.title, style: const TextStyle(fontSize: 20,  fontWeight: FontWeight.bold),)
          ),
          Padding(padding: const EdgeInsets.all(10),child:
            Text(widget.videoItem.video.description, style: const TextStyle(fontSize: 15),)
          ),


        ],
      )
      )
    );
  }
}
