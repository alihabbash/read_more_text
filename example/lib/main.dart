import 'package:flutter/material.dart';
import 'package:read_more_text/read_more_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read more text demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReadMoreText(
              // This is the main or contents text you needs to specify.
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package\n'
              'This is a very long text to demo the usages of this package',
              // This is the number of lines before start trimming the
              // content text
              numLines: 2,
              // If you need to customize or localize the read less text
              // you should pass it here.
              readLessText: 'Read less',
              // If you need to customize or localize the read more text
              // you should pass it here.
              readMoreText: 'Read more',
              // If you need to customize read more icon.
              // IMPORTANT: you should pass read more and read less icons
              // or not passing any icon at all, otherwise it will throw
              // exception.
              // If you don't want the default icon to be shown,
              // you should pass SizedBox.shrink().
              readMoreIcon: const SizedBox.shrink(),
              readLessIcon: const Icon(
                Icons.arrow_upward,
                color: Colors.blue,
              ),
              // Specify the alignment of read more text and icon
              // default is AlignmentDirectional.bottomEnd.
              readMoreAlign: AlignmentDirectional.center,
              // The main or content text style.
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              // Handler to when the user clicks on read more/less.
              onReadMoreClicked: _onReadMoreClicked,
              // Specify the read more/less text style.
              readMoreTextStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blue
              ),
              // The read more icon color
              // It has no effect if you specify a custom icon.
              readMoreIconColor: Colors.black,
              // The locale of the main content text.
              // It should be passed if the main content has a different locale
              // from the app locale,
              // e.g: the app locale is en and the passed main text is german.
              // It helps the package to accurately calculate number of lines,
              // you should not pass a different locale from the main text
              // otherwise, it may lead to miscalculation of the lines
              // the main text takes in the screen.
              locale: const Locale('en'),
            ),
            const SizedBox(height: 16),
            // you can use also ReadMoreText.selectable to use SelectableText
            // instead of Text widget.
            //
            // you will need to wrap the widget with a `TextSelectionTheme` if
            // you want to customize the color of the selection area.
            TextSelectionTheme(
              data: const TextSelectionThemeData(
                selectionColor: Colors.amber,
              ),
              child: ReadMoreText.selectable(
                // This is the main or contents text you needs to specify.
                'This is a very long text to demo the usages of this package\n'
                    'This is a very long text to demo the usages of this package\n'
                    'This is a very long text to demo the usages of this package\n'
                    'This is a very long text to demo the usages of this package',
                // This is the number of lines before start trimming the
                // content text
                numLines: 2,
                // If you need to customize or localize the read less text
                // you should pass it here.
                readLessText: 'Read less',
                // If you need to customize or localize the read more text
                // you should pass it here.
                readMoreText: 'Read more',
                // If you need to customize read more icon.
                // IMPORTANT: you should pass read more and read less icons
                // or not passing any icon at all, otherwise it will throw
                // exception.
                // If you don't want the default icon to be shown,
                // you should pass SizedBox.shrink().
                readMoreIcon: const SizedBox.shrink(),
                readLessIcon: const Icon(
                  Icons.arrow_upward,
                  color: Colors.blue,
                ),
                // Specify the alignment of read more text and icon
                // default is AlignmentDirectional.bottomEnd.
                readMoreAlign: AlignmentDirectional.center,
                // The main or content text style.
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                // Handler to when the user clicks on read more/less.
                onReadMoreClicked: _onReadMoreClicked,
                // Specify the read more/less text style.
                readMoreTextStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue
                ),
                // The read more icon color
                // It has no effect if you specify a custom icon.
                readMoreIconColor: Colors.black,
                // The locale of the main content text.
                // It should be passed if the main content has a different locale
                // from the app locale,
                // e.g: the app locale is en and the passed main text is german.
                // It helps the package to accurately calculate number of lines,
                // you should not pass a different locale from the main text
                // otherwise, it may lead to miscalculation of the lines
                // the main text takes in the screen.
                locale: const Locale('en'),
                // you can specify custom toolbar options to the selectable text
                // widget.
                toolbarOptions: const ToolbarOptions(
                  copy: true,
                  selectAll: true,
                ),
                // specify whether to show the cursor even when you don't select
                // any text.
                showCursor: true,
                // you can also set the cursor width and height in here
                // those will take effect only when showCursor is true
                cursorHeight: 12,
                cursorWidth: 12,
                // specify the cursor color, it will take effect only when
                // showCursor is true.
                cursorColor: Colors.amber,
                // specify the cursor radius, it will take effect only when
                // showCursor is true.
                cursorRadius: const Radius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onReadMoreClicked() {
  }
}
