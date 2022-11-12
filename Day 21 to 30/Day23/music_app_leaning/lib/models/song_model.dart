class Song {
  final String title;
  final String description;
  final String url;
  final String backgroundUrl;

  Song({
    required this.title,
    required this.description,
    required this.url,
    required this.backgroundUrl,
  });

  static List<Song> songs = [
    Song(
      title: 'Glass',
      description: 'Glass',
      url: 'assets/music/glass.mp3',
      backgroundUrl: 'assets/images/glass.jpg',
    ),
    Song(
      title: 'Illusions',
      description: 'Illusions',
      url: 'assets/music/illusions.mp3',
      backgroundUrl: 'assets/images/illusions.jpg',
    ),
    Song(
      title: 'Pray',
      description: 'Pray',
      url: 'assets/music/pray.mp3',
      backgroundUrl: 'assets/images/pray.jpg',
    )
  ];
}
