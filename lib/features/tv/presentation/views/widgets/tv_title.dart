import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:night_movie/features/tv/data/models/tv_detail_model.dart';
import 'package:night_movie/features/tv/presentation/model_views/details/details_cubit.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class TvTitle extends StatelessWidget {
  final TvDetailModel model;
  const TvTitle({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final webViewCheck = BlocProvider.of<DetailsCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          model.name,
          style: Styles.font17,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            webViewCheck.tvWebView(
                context: context,
                isValidUrl: model.homePage.isEmpty,
                url: model.homePage);
          },
          icon: Image.asset(
            'assets/images/view.png',
            width: 22,
            color: primaryColor.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
