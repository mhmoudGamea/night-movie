import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:night_movie/features/search/presentation/view_models/search_cubit/search_cubit.dart';

import '../../../../../core/constants.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({Key? key}) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final TextEditingController _searchedValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchData = BlocProvider.of<SearchCubit>(context);
    return Row(
      children: [
        IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: primaryColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: _searchedValue,
            cursorColor: primaryColor.withOpacity(0.000001),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: primaryColor.withOpacity(0.1),
              hintText: 'What are you looking for?',
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
              border: inputBorder(0.3),
              focusedBorder: inputBorder(0.8),
              enabledBorder: inputBorder(0.3),
              suffixIconConstraints: const BoxConstraints(),
            ),
            onFieldSubmitted: (value) =>
                searchData.fetchSearchedMoviesOrSeries(searchItem: value),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          constraints: const BoxConstraints(),
          padding: EdgeInsets.zero,
          onPressed: () {
            _searchedValue.clear();
          },
          icon: const Icon(
            Icons.close,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}

InputBorder inputBorder(double borderColorOpacity) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      width: 3,
      color: primaryColor.withOpacity(borderColorOpacity),
    ),
  );
}
