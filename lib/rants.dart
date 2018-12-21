class DevRant {
  bool success;
  List<Rants> rants;
  List<Null> settings;
  String set;
  int wrw;
  News news;

  DevRant(
      {this.success, this.rants, this.settings, this.set, this.wrw, this.news});

  DevRant.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['rants'] != null) {
      rants = new List<Rants>();
      json['rants'].forEach((v) {
        rants.add(new Rants.fromJson(v));
      });
    }
    if (json['settings'] != null) {
      // settings = new List<Null>();
      // json['settings'].forEach((v) {
      //   settings.add(new Null.fromJson(v));
      // });
    }
    set = json['set'];
    wrw = json['wrw'];
    news = json['news'] != null ? new News.fromJson(json['news']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.rants != null) {
      data['rants'] = this.rants.map((v) => v.toJson()).toList();
    }
    if (this.settings != null) {
      // data['settings'] = this.settings.map((v) => v.toJson()).toList();
    }
    data['set'] = this.set;
    data['wrw'] = this.wrw;
    if (this.news != null) {
      data['news'] = this.news.toJson();
    }
    return data;
  }
}

class Rants {
  int id;
  String text;
  int score;
  int createdTime;
  bool image;
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

  Rants(
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

  Rants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    score = json['score'];
    createdTime = json['created_time'];
    // attachedImage = json['attached_image'];
    image = (json['attached_image'] != null && json['attached_image'] != "")
        ? true
        : false;
    attachedImage =
        (json['attached_image'] != null && json['attached_image'] != "")
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
    data['attached_image'] = this.attachedImage;
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

class News {
  int id;
  String type;
  String headline;
  String body;
  String footer;
  int height;
  String action;

  News(
      {this.id,
      this.type,
      this.headline,
      this.body,
      this.footer,
      this.height,
      this.action});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    headline = json['headline'];
    body = json['body'];
    footer = json['footer'];
    height = json['height'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['headline'] = this.headline;
    data['body'] = this.body;
    data['footer'] = this.footer;
    data['height'] = this.height;
    data['action'] = this.action;
    return data;
  }
}
