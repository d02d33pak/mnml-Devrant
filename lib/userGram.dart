class UserGram {
  bool success;
  Profile profile;

  UserGram({this.success, this.profile});

  UserGram.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    return data;
  }
}

class Profile {
  String username;
  int score;
  String about;
  String location;
  int createdTime;
  String skills;
  String github;
  String website;
  Content content;
  Avatar avatar;
  AvatarSm avatarSm;
  int dpp;

  Profile(
      {this.username,
      this.score,
      this.about,
      this.location,
      this.createdTime,
      this.skills,
      this.github,
      this.website,
      this.content,
      this.avatar,
      this.avatarSm,
      this.dpp});

  Profile.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    score = json['score'];
    about = json['about'];
    location = json['location'];
    createdTime = json['created_time'];
    skills = json['skills'];
    github = json['github'];
    website = json['website'];
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
    avatarSm = json['avatar_sm'] != null
        ? new AvatarSm.fromJson(json['avatar_sm'])
        : null;
    dpp = json['dpp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['score'] = this.score;
    data['about'] = this.about;
    data['location'] = this.location;
    data['created_time'] = this.createdTime;
    data['skills'] = this.skills;
    data['github'] = this.github;
    data['website'] = this.website;
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    if (this.avatarSm != null) {
      data['avatar_sm'] = this.avatarSm.toJson();
    }
    data['dpp'] = this.dpp;
    return data;
  }
}

class Content {
  Content content;
  Counts counts;

  Content({this.content, this.counts});

  Content.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    counts =
        json['counts'] != null ? new Counts.fromJson(json['counts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    if (this.counts != null) {
      data['counts'] = this.counts.toJson();
    }
    return data;
  }
}

class Contents {
  List<Null> rants;
  List<Null> upvoted;
  List<Null> comments;
  List<Favorites> favorites;

  Contents({this.rants, this.upvoted, this.comments, this.favorites});

  Contents.fromJson(Map<String, dynamic> json) {
    if (json['favorites'] != null) {
      favorites = new List<Favorites>();
      json['favorites'].forEach((v) {
        favorites.add(new Favorites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.favorites != null) {
      data['favorites'] = this.favorites.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Favorites {
  int id;
  String text;
  int score;
  int createdTime;
  String attachedImage;
  int numComments;
  List<String> tags;
  int voteState;
  bool edited;
  int rt;
  int rc;
  List<Links> links;
  bool special;
  int userId;
  String userUsername;
  int userScore;
  UserAvatar userAvatar;
  UserAvatarLg userAvatarLg;

  Favorites(
      {this.id,
      this.text,
      this.score,
      this.createdTime,
      this.attachedImage,
      this.numComments,
      this.tags,
      this.voteState,
      this.edited,
      this.rt,
      this.rc,
      this.links,
      this.special,
      this.userId,
      this.userUsername,
      this.userScore,
      this.userAvatar,
      this.userAvatarLg});

  Favorites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    score = json['score'];
    createdTime = json['created_time'];
    attachedImage = json['attached_image'];
    numComments = json['num_comments'];
    tags = json['tags'].cast<String>();
    voteState = json['vote_state'];
    edited = json['edited'];
    rt = json['rt'];
    rc = json['rc'];
    if (json['links'] != null) {
      links = new List<Links>();
      json['links'].forEach((v) {
        links.add(new Links.fromJson(v));
      });
    }
    special = json['special'];
    userId = json['user_id'];
    userUsername = json['user_username'];
    userScore = json['user_score'];
    userAvatar = json['user_avatar'] != null
        ? new UserAvatar.fromJson(json['user_avatar'])
        : null;
    userAvatarLg = json['user_avatar_lg'] != null
        ? new UserAvatarLg.fromJson(json['user_avatar_lg'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['score'] = this.score;
    data['created_time'] = this.createdTime;
    data['attached_image'] = this.attachedImage;
    data['num_comments'] = this.numComments;
    data['tags'] = this.tags;
    data['vote_state'] = this.voteState;
    data['edited'] = this.edited;
    data['rt'] = this.rt;
    data['rc'] = this.rc;
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    data['special'] = this.special;
    data['user_id'] = this.userId;
    data['user_username'] = this.userUsername;
    data['user_score'] = this.userScore;
    if (this.userAvatar != null) {
      data['user_avatar'] = this.userAvatar.toJson();
    }
    if (this.userAvatarLg != null) {
      data['user_avatar_lg'] = this.userAvatarLg.toJson();
    }
    return data;
  }
}

class Links {
  String type;
  String url;
  String shortUrl;
  String title;
  int start;
  int end;
  int special;

  Links(
      {this.type,
      this.url,
      this.shortUrl,
      this.title,
      this.start,
      this.end,
      this.special});

  Links.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
    shortUrl = json['short_url'];
    title = json['title'];
    start = json['start'];
    end = json['end'];
    special = json['special'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['url'] = this.url;
    data['short_url'] = this.shortUrl;
    data['title'] = this.title;
    data['start'] = this.start;
    data['end'] = this.end;
    data['special'] = this.special;
    return data;
  }
}

class UserAvatar {
  String b;
  String i;

  UserAvatar({this.b, this.i});

  UserAvatar.fromJson(Map<String, dynamic> json) {
    b = json['b'];
    i = json['i'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['b'] = this.b;
    data['i'] = this.i;
    return data;
  }
}

class UserAvatarLg {
  String b;
  String i;

  UserAvatarLg({this.b, this.i});

  UserAvatarLg.fromJson(Map<String, dynamic> json) {
    b = json['b'];
    i = json['i'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['b'] = this.b;
    data['i'] = this.i;
    return data;
  }
}

class Counts {
  int rants;
  int upvoted;
  int comments;
  int favorites;
  int collabs;

  Counts(
      {this.rants, this.upvoted, this.comments, this.favorites, this.collabs});

  Counts.fromJson(Map<String, dynamic> json) {
    rants = json['rants'];
    upvoted = json['upvoted'];
    comments = json['comments'];
    favorites = json['favorites'];
    collabs = json['collabs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rants'] = this.rants;
    data['upvoted'] = this.upvoted;
    data['comments'] = this.comments;
    data['favorites'] = this.favorites;
    data['collabs'] = this.collabs;
    return data;
  }
}

class Avatar {
  String b;
  String i;

  Avatar({this.b, this.i});

  Avatar.fromJson(Map<String, dynamic> json) {
    b = json['b'];
    i = json['i'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['b'] = this.b;
    data['i'] = this.i;
    return data;
  }
}

class AvatarSm {
  String b;
  String i;

  AvatarSm({this.b, this.i});

  AvatarSm.fromJson(Map<String, dynamic> json) {
    b = json['b'];
    i = json['i'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['b'] = this.b;
    data['i'] = this.i;
    return data;
  }
}
