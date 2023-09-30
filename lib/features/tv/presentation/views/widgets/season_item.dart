import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/tv_episodes_model.dart';
import '../../model_views/tv_episodes/tv_episodes_cubit.dart';
import 'episodes_list.dart';

class SeasonItem extends StatefulWidget {
  final int tvId;
  final int seasonNumber;
  const SeasonItem({Key? key, required this.tvId, required this.seasonNumber})
      : super(key: key);

  @override
  State<SeasonItem> createState() => _SeasonItemState();
}

class _SeasonItemState extends State<SeasonItem> {
  var _isExpanded = false;
  late List<TvEpisodeModel> tvEpisodes;
  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<TvEpisodesCubit>(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await data.fetchEpisodes(widget.tvId, widget.seasonNumber);
            tvEpisodes = data.getTvEpisodes;

            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: ShowEpisodesButton(widget: widget, isExpanded: _isExpanded),
        ),
        if (_isExpanded) const SizedBox(height: 10),
        if (_isExpanded) EpisodesList(tvs: tvEpisodes),
      ],
    );
  }
}

class ShowEpisodesButton extends StatelessWidget {
  const ShowEpisodesButton({
    super.key,
    required this.widget,
    required bool isExpanded,
  }) : _isExpanded = isExpanded;

  final SeasonItem widget;
  final bool _isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryFirstDark,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Season ${widget.seasonNumber}',
            style: Styles.font14,
          ),
          FaIcon(
            _isExpanded ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown,
            size: 14,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
