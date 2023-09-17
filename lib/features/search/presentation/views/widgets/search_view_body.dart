import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/helper.dart';
import '../../view_models/search_cubit/search_cubit.dart';
import 'search_list_view.dart';
import 'text_form_field_widget.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Helper.getLinearGradiant(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            const TextFormFieldWidget(),
            const SizedBox(height: 30),
            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccess) {
                    if (state.searchedMovies.isEmpty) {
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: AwesomeSnackbarContent(
                          title: 'no result!',
                          message:
                              'please check the spelling of the movie name.',
                          contentType: ContentType.warning,
                          color: Colors.amber.withOpacity(0.5),
                        ),
                      );
                    } else {
                      return SearchListView(searchList: state.searchedMovies);
                    }
                  } else if (state is SearchFailure) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: AwesomeSnackbarContent(
                        title: 'an error',
                        message: state.error,
                        contentType: ContentType.failure,
                        color: Colors.red.withOpacity(0.5),
                      ),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*


return BlocBuilder(
      builder: (context, state) {
        
      },
    );
*/