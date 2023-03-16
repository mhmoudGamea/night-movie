import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/widgets/awesome_message.dart';
import '../../../../../core/widgets/shimmer_indicator.dart';
import '../../model_views/now_playing_cubit/now_playing_cubit.dart';
import '../details_view.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if (state is NowPlayingSuccess) {
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
            items: state.movies.map(
              (item) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(DetailsView.rn, extra: item);
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
                        child: CachedNetworkImage(
                          imageUrl: '$imageBaseUrl${item.backdropPath}',
                          fit: BoxFit.cover,
                          height: 200,
                          placeholder: (context, name) => ShimmerIndicator(
                              width: MediaQuery.of(context).size.width * .9,
                              height: 200),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
        } else if (state is NowPlayingFailure) {
          return AwesomeMessage(
            height: 200,
            message: state.error,
          );
        } else {
          return const SizedBox(height: 200);
        }
      },
    );
  }
}
