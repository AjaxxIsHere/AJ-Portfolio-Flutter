class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final List<String>? url;
  final List<String> linklogo;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.linklogo,
  });
}

List<ProjectUtils> projectItems = [
  ProjectUtils(
      image: 'assets/projectAssets/nextmovie.PNG',
      title: 'NextMovie - Movie review application',
      subtitle:
          'This is a movie review application that allows users to search for movies and view their details. It also allows users to write reviews and rate movies. It uses flutter and firebase as the backend.',
      url: ['https://github.com/AjaxxIsHere/nextmovie_v2'],
      linklogo: ['assets/github.png']),
  ProjectUtils(
      image: 'assets/projectAssets/memegenerator.png',
      title: 'Meme Generator Website',
      subtitle:
          'This is a meme generator website that allows users to create memes and download them. Its made with HTML, CSS, and JavaScript.',
      url: ['https://github.com/AjaxxIsHere/meme-generator'],
      linklogo: ['assets/github.png']),
  ProjectUtils(
      image: 'assets/projectAssets/mastermind.png',
      title: 'Real life Mastermind Game',
      subtitle:
          'This is a real life Mastermind game that allows users to play the game with a computer. It uses C and Assembly language with the help of a Raspberry pi',
      url: ['https://github.com/AjaxxIsHere/RaspberryPi-MasterMInd'],
      linklogo: ['assets/github.png']),
  ProjectUtils(
      image: 'assets/projectAssets/imagefilter.png',
      title: 'Image Filter Program',
      subtitle:
          'This is an image filter program that reads hsdec files and applies a median image filter over them. It uses pure C language',
      url: ['https://github.com/AjaxxIsHere/Median-Image-Filter-In-C'],
      linklogo: ['assets/github.png']),
  ProjectUtils(
      image: 'assets/projectAssets/lockbox.png',
      title: 'LockBox Password Manager App',
      subtitle:
          'LockBox is a state of the art encrypted password manager and note taker. It uses flutter and encrypted local storage to ensure the security of the users data. Check it out by downloading through the link below!',
      url: [
        'https://drive.google.com/uc?export=download&id=1ywy3s5MrubwNw7mRzwFFItIVZUBdrctP',
        'https://github.com/AjaxxIsHere/password_manager'
      ],
      linklogo: [
        'assets/google-drive.png',
        'assets/github.png'
      ]),
  ProjectUtils(
      image: 'assets/projectAssets/portfolio.png',
      title: 'Portfolio App',
      subtitle:
          'This is the portfolio app youre looking at right now! Interesting right?',
      url: ['https://github.com/AjaxxIsHere/aj-portfolio-website'],
      linklogo: ['assets/github.png']),
];
