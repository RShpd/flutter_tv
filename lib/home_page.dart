import 'package:flutter/material.dart';
import 'package:tv_flutter/player_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          VideoTileWidget(
            title: 'Big buck bunny',
            subtitle: 'By Blender Foundation',
            url:
                'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
          ),
          VideoTileWidget(
            title: 'The first Blender Open Movie from 2006',
            subtitle: 'By Blender Foundation',
            url:
                'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
          ),
          VideoTileWidget(
            title: 'HBO GO now works with Chromecast',
            url:
                'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
            subtitle: 'By Google',
          )
        ],
      ),
    );
  }
}

class VideoTileWidget extends StatelessWidget {
  final String title;
  final String url;
  final String subtitle;

  const VideoTileWidget({Key key, this.title, this.url, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          contentPadding: EdgeInsets.all(4),
          focusColor: Colors.yellow.withOpacity(0.2),
          title: Text(title),
          subtitle: Text(subtitle ?? ''),
          leading: Icon(Icons.video_collection_outlined, size: 35),
          trailing: IconButton(
            icon: Icon(
              Icons.play_circle_outline,
              color: Theme.of(context).primaryColor,
              size: 30,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayerPage(url: url),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
