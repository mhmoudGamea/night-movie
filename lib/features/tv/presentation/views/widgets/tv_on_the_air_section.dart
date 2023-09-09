import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/core/widgets/now_playing_shimmer.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/awesome_message.dart';
import '../../../../../core/widgets/not_avilable_poster_image.dart';
import '../../../../../core/widgets/shimmer_indicator.dart';
import '../../model_views/on_the_air/on_the_air_cubit.dart';
import '../tv_details_view.dart';

class TvOnTheAirSection extends StatelessWidget {
  const TvOnTheAirSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnTheAirCubit, OnTheAirState>(
      builder: (context, state) {
        if (state is OnTheAirSuccess) {
          return CarouselSlider(
            options: CarouselOptions(
              height: 200,
              aspectRatio: 30 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              //autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
              viewportFraction: 0.83,
            ),
            items: state.tvs.map(
              (item) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(TvDetailsView.rn, extra: item.id);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: ShaderMask(
                      shaderCallback: (rect) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            Colors.transparent,
                            primaryColor,
                          ]).createShader(rect),
                      blendMode: BlendMode.color,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: item.backdropPath == null
                            ? NotAvilablePosterImage(
                                width: MediaQuery.of(context).size.width * .9,
                                height: 200)
                            : CachedNetworkImage(
                                imageUrl: '$imageBaseUrl${item.backdropPath}',
                                fit: BoxFit.cover,
                                height: 200,
                                placeholder: (context, name) =>
                                    ShimmerIndicator(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .9,
                                        height: 200),
                              ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
        } else if (state is OnTheAirFailure) {
          return AwesomeMessage(
            height: 200,
            message: state.error,
          );
        } else {
          return const NowPlayingShimmer();
        }
      },
    );
  }
}
