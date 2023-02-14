import 'package:onde_eh_hoje/layers/domain/entities/comment_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/place_entity.dart';
import 'package:onde_eh_hoje/layers/domain/entities/user_entity.dart';

final User mockedUser = User(
    id: "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
    name: 'Gabriel',
    email: 'gabjhsa@gmail.com');

final Place mockedPlace = Place(
    id: "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
    name: 'Legend',
    latitude: -59.87432174921,
    longitude: 60.8320948);

final Comment mockedComment = Comment(
    id: "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
    user: mockedUser,
    message: 'This is a sample message',
    place: mockedPlace);

final Comment mockedNullIdComment = Comment(
  user: mockedUser,
  message: 'This is a sample message',
  place: mockedPlace,
);

final Map<String, dynamic> mockDataJson = {
  'id': '75d11f00-7ebe-4c8e-8fdd-6662db353d9c',
  'user': {
    'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
    'name': 'Gabriel',
    'email': 'gabjhsa@gmail.com'
  },
  'message': 'This is a sample message',
  'place': {
    'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
    'name': 'Legend',
    'latitude': -59.87432174921,
    'longitude': 60.8320948
  },
};

final Map<String, dynamic> mockUserJson = {
  'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
  'name': 'Gabriel',
  'email': 'gabjhsa@gmail.com'
};

final Map<String, dynamic> mockedListofUsersJson = {
  'users': [
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Gabriel',
      'email': 'gabjhsa@gmail.com'
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Gabriel',
      'email': 'gabjhsa@gmail.com'
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Gabriel',
      'email': 'gabjhsa@gmail.com'
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Gabriel',
      'email': 'gabjhsa@gmail.com'
    }
  ]
};

final Map<String, dynamic> mockedListOfPlacesJson = {
  'places': [
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Legend',
      'latitude': -59.87432174921,
      'longitude': 60.8320948
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Yves',
      'latitude': -59.87432174921,
      'longitude': 60.8320948
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Spirit',
      'latitude': -59.87432174921,
      'longitude': 60.8320948
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Legend',
      'latitude': -59.87432174921,
      'longitude': 60.8320948
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'name': 'Legend',
      'latitude': -59.87432174921,
      'longitude': 60.8320948
    }
  ]
};

final Map<String, dynamic> mockedPlaceJson = {
  'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
  'name': 'Legend',
  'latitude': -59.87432174921,
  'longitude': 60.8320948
};

final Map<String, dynamic> mockedCommentJson = {
  'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
  'user': {
    'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
    'name': 'Gabriel',
    'email': 'gabjhsa@gmail.com'
  },
  'message': 'This is a sample message',
  'place': {
    'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
    'name': 'Legend',
    'latitude': -59.87432174921,
    'longitude': 60.8320948
  }
};

final Map<String, dynamic> mockedListOfCommentsJson = {
  'comments': [
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'user': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Gabriel',
        'email': 'gabjhsa@gmail.com'
      },
      'message': 'This is a sample message',
      'place': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Legend',
        'latitude': -59.87432174921,
        'longitude': 60.8320948
      }
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'user': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Gabriel',
        'email': 'gabjhsa@gmail.com'
      },
      'message': 'This is a sample message',
      'place': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Legend',
        'latitude': -59.87432174921,
        'longitude': 60.8320948
      }
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'user': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Gabriel',
        'email': 'gabjhsa@gmail.com'
      },
      'message': 'This is a sample message',
      'place': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Legend',
        'latitude': -59.87432174921,
        'longitude': 60.8320948
      }
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'user': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Gabriel',
        'email': 'gabjhsa@gmail.com'
      },
      'message': 'This is a sample message',
      'place': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Legend',
        'latitude': -59.87432174921,
        'longitude': 60.8320948
      }
    },
    {
      'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
      'user': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Gabriel',
        'email': 'gabjhsa@gmail.com'
      },
      'message': 'This is a sample message',
      'place': {
        'id': "75d11f00-7ebe-4c8e-8fdd-6662db353d9c",
        'name': 'Legend',
        'latitude': -59.87432174921,
        'longitude': 60.8320948
      }
    }
  ]
};
