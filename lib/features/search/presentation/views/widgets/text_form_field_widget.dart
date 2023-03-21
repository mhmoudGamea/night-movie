import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return TextFormField(
      controller: _searchedValue,
      cursorColor: primaryColor.withOpacity(0.000001),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'What are you looking for?',
        hintStyle: TextStyle(color: Colors.grey[700]!),
        contentPadding: const EdgeInsets.only(top: 14, bottom: 14, left: 10),
        border: inputBorder(0.5),
        focusedBorder: inputBorder(0.8),
        enabledBorder: inputBorder(0.5),
        suffixIcon: IconButton(
          onPressed: () {
            searchData.fetchSearchedMoviesOrSeries(
                searchItem: _searchedValue.text);
          },
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: primaryColor.withOpacity(0.5),
            size: 18,
          ),
        ),
      ),
      onFieldSubmitted: (value) =>
          searchData.fetchSearchedMoviesOrSeries(searchItem: value),
    );
  }
}

InputBorder inputBorder(double borderColorOpacity) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      width: 0,
      color: primaryColor.withOpacity(borderColorOpacity),
    ),
  );
}
