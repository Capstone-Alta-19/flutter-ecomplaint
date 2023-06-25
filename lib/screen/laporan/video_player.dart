// // import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';

// // import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';

// // class VideoPlayerPage extends StatefulWidget {
// //   final String videoUrl;
// //   const VideoPlayerPage({super.key, required this.videoUrl});

// //   @override
// //   _VideoPlayerPageState createState() => _VideoPlayerPageState();
// // }

// // class _VideoPlayerPageState extends State<VideoPlayerPage> {
// //   late VideoPlayerController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4")
// //       ..initialize().then((_) {
// //         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
// //         setState(() {});
// //       });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         body: Center(
// //           child: _controller.value.isInitialized
// //               ? AspectRatio(
// //                   aspectRatio: _controller.value.aspectRatio,
// //                   child: VideoPlayer(_controller),
// //                 )
// //               : Container(),
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () {
// //             setState(() {
// //               _controller.value.isPlaying ? _controller.pause() : _controller.play();
// //             });
// //           },
// //           child: Icon(
// //             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //     _controller.dispose();
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;

//   VideoPlayerScreen({required this.videoUrl});

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIOverlays([]);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
//       SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: _isFullScreen ? null : AppBar(title: Text('Video Player')),
//       body: Container(
//         height: _isFullScreen ? screenHeight : null,
//         width: _isFullScreen ? screenWidth : null,
//         child: _controller.value.isInitialized
//             ? Stack(
//                 children: [
//                   AspectRatio(
//                     aspectRatio: _controller.value.aspectRatio,
//                     child: VideoPlayer(_controller),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     child: Container(
//                       width: screenWidth,
//                       color: Colors.black.withOpacity(0.5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 if (_controller.value.isPlaying) {
//                                   _controller.pause();
//                                 } else {
//                                   _controller.play();
//                                 }
//                               });
//                             },
//                             icon: Icon(
//                               _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             : Container(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _toggleFullScreen,
//         child: Icon(
//           _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;
  String videoUrl = "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(videoUrl);

    controller.addListener(() {
      setState(() {});
    });
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() {}));
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
            } else {
              controller.play();
            }
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }
}
