import 'dart:io';

import 'package:app_mobile/core/constants/color_constants.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewByUrl extends StatefulWidget {
  const VideoViewByUrl({Key key, this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  _VideoViewByFileState createState() => _VideoViewByFileState();
}

class _VideoViewByFileState extends State<VideoViewByUrl> {
  VideoPlayerController _videoController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            "Lỗi tải video",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlackColors,
      child: Center(
        child: _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: Chewie(
                  controller: _chewieController,
                ),
              )
            : Container(),
      ),
    );
  }
}
