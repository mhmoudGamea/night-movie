import 'package:flutter/material.dart';
import 'package:night_movie/core/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerBox extends StatefulWidget {
  final String videoKey;
  const TrailerBox({Key? key, required this.videoKey}) : super(key: key);

  @override
  State<TrailerBox> createState() => _TrailerBoxState();
}

class _TrailerBoxState extends State<TrailerBox> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    String? videoId;
    videoId = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=${widget.videoKey}');
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 11 / 7,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: primaryColor,
            progressColors: ProgressBarColors(
              playedColor: primaryColor,
              handleColor: primaryColor.withOpacity(0.2),
            ),
            aspectRatio: 11 / 7,
          ),
        ),
      ),
    );
  }
}
