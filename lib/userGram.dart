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
  Contents content;
  Counts counts;

  Content({this.content, this.counts});

  Content.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? new Contents.fromJson(json['content']) : null;
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
  List<Rantss> rants;
  int counter = 0;
  // List<Null> upvoted;
  // List<Null> comments;
  // List<Null> favorites;

//if above variables are needed then paste these inside {} below
// , this.upvoted, this.comments, this.favorites
  Contents({this.rants});

  Contents.fromJson(Map<String, dynamic> json) {
    if (json['rants'] != null) {
      rants = new List<Rantss>();
      json['rants'].forEach((v) {
        counter++;
        rants.add(new Rantss.fromJson(v));
      });
    }
    // if (json['upvoted'] != null) {
    //   upvoted = new List<Null>();
    //   json['upvoted'].forEach((v) {
    //     upvoted.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['comments'] != null) {
    //   comments = new List<Null>();
    //   json['comments'].forEach((v) {
    //     comments.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['favorites'] != null) {
    //   favorites = new List<Null>();
    //   json['favorites'].forEach((v) {
    //     favorites.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rants != null) {
      data['rants'] = this.rants.map((v) => v.toJson()).toList();
    }
    // if (this.upvoted != null) {
    //   data['upvoted'] = this.upvoted.map((v) => v.toJson()).toList();
    // }
    // if (this.comments != null) {
    //   data['comments'] = this.comments.map((v) => v.toJson()).toList();
    // }
    // if (this.favorites != null) {
    //   data['favorites'] = this.favorites.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Rantss {
  int id;
  String text;
  int score;
  int createdTime;
  AttachedImage attachedImage;
  int numComments;
  List<String> tags;
  int voteState;
  bool edited;
  int rt;
  int rc;
  int userId;
  String userUsername;
  int userScore;
  UserAvatar userAvatar;
  UserAvatarLg userAvatarLg;

  Rantss(
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
      this.userId,
      this.userUsername,
      this.userScore,
      this.userAvatar,
      this.userAvatarLg});

  Rantss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    score = json['score'];
    createdTime = json['created_time'];
    attachedImage = (json['attached_image'] != null && json['attached_image'] != "")
        ? new AttachedImage.fromJson(json['attached_image'])
        : null;
    numComments = json['num_comments'];
    tags = json['tags'].cast<String>();
    voteState = json['vote_state'];
    edited = json['edited'];
    rt = json['rt'];
    rc = json['rc'];
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
    if (this.attachedImage != null) {
      data['attached_image'] = this.attachedImage.toJson();
    }
    data['num_comments'] = this.numComments;
    data['tags'] = this.tags;
    data['vote_state'] = this.voteState;
    data['edited'] = this.edited;
    data['rt'] = this.rt;
    data['rc'] = this.rc;
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

class AttachedImage {
  String url;
  int width;
  int height;

  AttachedImage({this.url, this.width, this.height});

  AttachedImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
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
