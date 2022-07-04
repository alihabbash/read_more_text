library read_more_text;

import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  const ReadMoreText(
    this.text, {
    required this.numLines,
    required this.showMoreText,
    required this.showLessText,
    this.style,
    this.onShowMoreClicked,
    Key? key,
  }) : super(key: key);

  /// The main text that needs to be shown.
  final String text;

  /// The number of lines before trim the text.
  final int numLines;

  /// The main text style.
  final TextStyle? style;

  /// The show more text.
  final String showMoreText;

  /// The show less text.
  final String showLessText;

  final VoidCallback? onShowMoreClicked;

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  final _defaultShowMoreStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );

  var _isTextExpanded = false;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final locale = Localizations.maybeLocaleOf(context);
          final span = TextSpan(text: widget.text);
          final tp = TextPainter(
            text: span,
            locale: locale,
            maxLines: widget.numLines,
            textDirection: Directionality.of(context),
          );
          tp.layout(maxWidth: constraints.maxWidth);
          return Column(
            children: [
              Text(
                widget.text,
                maxLines: _isTextExpanded ? null : widget.numLines,
                style: widget.style,
              ),
              if (tp.didExceedMaxLines) const SizedBox(height: 8),
              if (tp.didExceedMaxLines)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8),
                  child: GestureDetector(
                    onTap: _onReadMoreClicked,
                    child: Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _isTextExpanded
                                ? widget.showLessText
                                : widget.showMoreText,
                            style: _defaultShowMoreStyle,
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      );

  void _onReadMoreClicked() {
    _isTextExpanded = !_isTextExpanded;
    setState(() {});
    widget.onShowMoreClicked?.call();
  }
}
