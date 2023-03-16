import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/styles.dart';

class ExpandedWidget extends StatefulWidget {
  final String overview;
  const ExpandedWidget({super.key, required this.overview});

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  late String firstHalf;
  late String secondHalf;
  var _isExpanded = false;

  @override
  void initState() {
    super.initState();
    var length = widget.overview.length;
    if (length > 120) {
      firstHalf = widget.overview.substring(0, 120);
      secondHalf = widget.overview.substring(121, length);
    } else {
      firstHalf = widget.overview;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: Styles.font13,
            )
          : Wrap(
              children: [
                Text(
                  firstHalf,
                  style: Styles.font13,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: _isExpanded
                      ? min(widget.overview.length * 20 + 20, 130)
                      : 0,
                  child: SizedBox(
                    height: min(widget.overview.length * 20 + 20, 130),
                    child: Text(
                      _isExpanded ? widget.overview : firstHalf,
                      style: Styles.font13,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        _isExpanded ? 'Show Less' : 'Show More',
                        style: Styles.fontPrimary14,
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: primaryColor,
                        size: 21,
                      )
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
