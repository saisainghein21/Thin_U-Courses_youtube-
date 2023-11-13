import 'package:flutter/material.dart';
import '../models/channel_model.dart';
import '../models/video_model.dart';
import '../services/api_service.dart';
import 'course_video_screen.dart';

class CourseLessonScreen extends StatefulWidget {
  @override
  _CourseLessonScreenState createState() => _CourseLessonScreenState();
}

class _CourseLessonScreenState extends State<CourseLessonScreen> {
  Channel? _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCp-k3mxuzR8StQiga5lu9Lg');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    if (_channel == null) {
      return CircularProgressIndicator();
    }
    return Container(
        // margin: EdgeInsets.all(10.0),
        //
        // height: 100.0,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black12,
        //       offset: Offset(0, 1),
        //       blurRadius: 6.0,
        //     ),
        //   ],
        // ),
        // child: Row(
        //   children: <Widget>[
        //     CircleAvatar(
        //       backgroundColor: Colors.white,
        //       radius: 35.0,
        //       backgroundImage: NetworkImage(_channel!.profilePictureUrl),
        //     ),
        //     SizedBox(width: 10.0),
        //     Expanded(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           Text(
        //             _channel!.title,
        //             style: TextStyle(
        //               color: Colors.black,
        //               fontSize: 20.0,
        //               fontWeight: FontWeight.w600,
        //             ),
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //           Text(
        //             '${_channel!.subscriberCount} subscribers',
        //             style: TextStyle(
        //               color: Colors.grey[600],
        //               fontSize: 16.0,
        //               fontWeight: FontWeight.w600,
        //             ),
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
        );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(

          builder: (_) => VideoScreen(id: video.id, title: video.title),
        ),
      ),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          // padding: EdgeInsets.all(10.0),

          height: 70.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(0, 0),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Image(
                  width: 70.0,
                  image: NetworkImage(video.thumbnailUrl),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      video.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos.length < int.parse(_channel!.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel!.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _buildProfileInfo();
                  }
                  Video video = _channel!.videos[index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
    );
  }
}
