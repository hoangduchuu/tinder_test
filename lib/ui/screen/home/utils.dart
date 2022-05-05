import '../../widgets/action_button.dart';

var actionButtonData = [
  {
    'type': ActionButtonType.back,
    'icon': 'assets/images/refresh_icon.svg',
    'color': 0xFFFFBA49,
    'height': 50.0,
    'iconSize': 25.0,
  },
  {
    'type': ActionButtonType.dislike,
    'icon': 'assets/images/close_icon.svg',
    'color': 0xFFFD5F60,
    'height': 60.0,
    'iconSize': 30.0,
  },
  {
    'type': ActionButtonType.superLike,
    'icon': 'assets/images/star_icon.svg',
    'color': 0xFF14A8E7,
    'height': 50.0,
    'iconSize': 25.0,
  },
  {
    'type': ActionButtonType.like,
    'icon': 'assets/images/like_icon.svg',
    'color': 0xFF36E6B7,
    'height': 60.0,
    'iconSize': 30.0,
  },
  {
    'type': ActionButtonType.speedUp,
    'icon': 'assets/images/thunder_icon.svg',
    'color': 0xFFA44fE3,
    'height': 50.0,
    'iconSize': 25.0,
  }
];

var navigationItems = [
  {
    'activeIcon': 'assets/images/explore_active_icon.svg',
    'icon': 'assets/images/explore_icon.svg',
  },
  {
    'activeIcon': 'assets/images/likes_active_icon.svg',
    'icon': 'assets/images/likes_icon.svg',
  },
  {
    'activeIcon': 'assets/images/ignored_active_icon.svg',
    'icon': 'assets/images/ignored_icon.svg',
  },
  {
    'activeIcon': 'assets/images/account_active_icon.svg',
    'icon': 'assets/images/account_icon.svg',
  }
];

List<String> getMockAvatar(String originPicture) {
  return [
    originPicture,
    'assets/images/girls/img_1.jpeg',
    'assets/images/girls/img_2.jpeg',
    'assets/images/girls/img_3.jpeg',
    'assets/images/girls/img_4.jpeg',
    'assets/images/girls/img_5.jpeg',
    'assets/images/girls/img_6.jpeg',
    'assets/images/girls/img_7.jpeg',
    'assets/images/girls/img_8.jpeg',
    'assets/images/girls/img_9.jpeg',
    'assets/images/girls/img_10.jpeg',
    'assets/images/girls/img_11.jpeg',
    'assets/images/girls/img_12.jpeg',
    'assets/images/girls/img_13.jpeg',
    'assets/images/girls/img_14.jpeg',
    'assets/images/girls/img_15.jpeg',
    'assets/images/girls/img_16.jpeg'
  ];
}
