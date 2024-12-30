class SocialMediaLink {
  final String name;
  final String url;
  final String iconPath;

  SocialMediaLink({
    required this.name,
    required this.url,
    required this.iconPath,
  });
}

final List<SocialMediaLink> socialMediaLinks = [
  SocialMediaLink(
    name: 'GitHub',
    url: 'https://github.com/AjaxxIsHere',
    iconPath: 'assets/icons/github.png',
  ),
  SocialMediaLink(
    name: 'Instagram',
    url:
        'https://www.instagram.com/yours.truly__aj/profilecard/?igsh=Ynh0c3d6bXVva3kx',
    iconPath: 'assets/icons/instagram.png',
  ),
  SocialMediaLink(
    name: 'LinkedIn',
    url: 'https://www.linkedin.com/in/mohamad-ajaz/',
    iconPath: 'assets/icons/linkedin.png',
  ),
  SocialMediaLink(
    name: 'Gmail',
    url: 'mailto:ajaz2468@gmail.com',
    iconPath: 'assets/icons/gmail.png',
  ),
];
