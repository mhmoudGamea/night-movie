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
  late YoutubePlayerController _youtubeController;

  void _videoSetub() {
    String? videoId = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=${widget.videoKey}');
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
      ),
    );
  }

  @override
  void initState() {
    _videoSetub();
    super.initState();
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: YoutubePlayer(
          controller: _youtubeController,
          showVideoProgressIndicator: true,
          progressIndicatorColor: primaryColor,
          progressColors: ProgressBarColors(
            playedColor: primaryColor,
            handleColor: primaryColor.withOpacity(0.2),
          ),
          bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),
          ],
        ),
      ),
    );
  }
}
