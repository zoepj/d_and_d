import 'dart:io';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_and_d/models/videos_list.dart';
import 'package:d_and_d/widgets/videos/video_player_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../side_drawer.dart';

const String _baseUrl = 'www.googleapis.com';
const String API_KEY = 'AIzaSyCwZJv9ajfl62HoQyDQc1ueiTo12zuiVH4';
List<VideoItem> videos = [];
PageInfo pageInfo = PageInfo();
const String _playListId = "PLJmFJXf3BXjwXkNFo_-iwtHb24AuJcXqx";
VideosList _videosList = VideosList(videos: videos, pageInfo: pageInfo);


class ListVideosPage extends StatefulWidget {
  const ListVideosPage({Key? key}) : super(key: key);

  @override
  _ListVideosPageState createState() => _ListVideosPageState();
}

class _ListVideosPageState extends State<ListVideosPage>{
  String _nextPageToken = "";
  VideosList _videosList = VideosList(videos: videos, pageInfo: pageInfo);
  var _first = true;

  Future<VideosList> getVideosList(
      {required String playListId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '32',
      'pageToken': '',
      'key': API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );

    var response = await http.get(uri, headers: headers);
    // print(response.body);
    VideosList videosList = videosListFromJson(response.body);
    print ("AQUI" + videosList.videos.length.toString());
    return videosList;
  }


  _loadVideos() async {
    VideosList tempVideosList = await getVideosList(
      playListId: _playListId,
    );
    _videosList.videos = [];
    _nextPageToken = tempVideosList.nextPageToken;
    _videosList.videos.addAll(tempVideosList.videos);
    print('videos: ${_videosList.videos.length}');
    print('_nextPageToken $_nextPageToken');
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    if (_first) {
        _loadVideos().then((_videosList) => setState(() {
          _first = false;
        }));
      }

      if (_videosList == null) {
        return  Scaffold(
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
            )
        );
      }

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

      body: ListView.builder(
      controller: _scrollController,
      itemCount: _videosList.videos.length,
      itemBuilder: (context, index) {
        VideoItem videoItem = _videosList.videos[index];
        return
          InkWell(
          onTap: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return VideoPlayerPage(
                    videoItem: videoItem,
                  );
                }));
          },
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: videoItem
                      .video.thumbnails.thumbnailsDefault.url,
                ),
                SizedBox(width: 20),
                Flexible(child: Text(videoItem.video.title)),
              ],
            ),
          ),
        );
      },

      ),
      );
  }
}