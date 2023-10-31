class CategoryModel {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  ImageModel? image;
  int? menuOrder;
  int? count;
  String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  Links? lLinks;

  CategoryModel(
      {this.id,
      this.name,
      this.slug,
      this.parent,
      this.description,
      this.display,
      this.image,
      this.menuOrder,
      this.count,
      this.yoastHead,
      this.yoastHeadJson,
      this.lLinks});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent = json['parent'];
    description = json['description'];
    display = json['display'];
    image =
        json['image'] != null ? new ImageModel.fromJson(json['image']) : null;
    menuOrder = json['menu_order'];
    count = json['count'];
    yoastHead = json['yoast_head'];
    yoastHeadJson = json['yoast_head_json'] != null
        ? new YoastHeadJson.fromJson(json['yoast_head_json'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['parent'] = this.parent;
    data['description'] = this.description;
    data['display'] = this.display;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['menu_order'] = this.menuOrder;
    data['count'] = this.count;
    data['yoast_head'] = this.yoastHead;
    if (this.yoastHeadJson != null) {
      data['yoast_head_json'] = this.yoastHeadJson!.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Image {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  Image(
      {this.id,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.src,
      this.name,
      this.alt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['src'] = this.src;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}

class YoastHeadJson {
  String? title;
  Robots? robots;
  String? canonical;
  String? ogLocale;
  String? ogType;
  String? ogTitle;
  String? ogUrl;
  String? ogSiteName;
  String? twitterCard;
  Schema? schema;

  YoastHeadJson(
      {this.title,
      this.robots,
      this.canonical,
      this.ogLocale,
      this.ogType,
      this.ogTitle,
      this.ogUrl,
      this.ogSiteName,
      this.twitterCard,
      this.schema});

  YoastHeadJson.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    robots =
        json['robots'] != null ? new Robots.fromJson(json['robots']) : null;
    canonical = json['canonical'];
    ogLocale = json['og_locale'];
    ogType = json['og_type'];
    ogTitle = json['og_title'];
    ogUrl = json['og_url'];
    ogSiteName = json['og_site_name'];
    twitterCard = json['twitter_card'];
    schema =
        json['schema'] != null ? new Schema.fromJson(json['schema']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.robots != null) {
      data['robots'] = this.robots!.toJson();
    }
    data['canonical'] = this.canonical;
    data['og_locale'] = this.ogLocale;
    data['og_type'] = this.ogType;
    data['og_title'] = this.ogTitle;
    data['og_url'] = this.ogUrl;
    data['og_site_name'] = this.ogSiteName;
    data['twitter_card'] = this.twitterCard;
    if (this.schema != null) {
      data['schema'] = this.schema!.toJson();
    }
    return data;
  }
}

class Robots {
  String? index;
  String? follow;
  String? maxSnippet;
  String? maxImagePreview;
  String? maxVideoPreview;

  Robots(
      {this.index,
      this.follow,
      this.maxSnippet,
      this.maxImagePreview,
      this.maxVideoPreview});

  Robots.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    follow = json['follow'];
    maxSnippet = json['max-snippet'];
    maxImagePreview = json['max-image-preview'];
    maxVideoPreview = json['max-video-preview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['follow'] = this.follow;
    data['max-snippet'] = this.maxSnippet;
    data['max-image-preview'] = this.maxImagePreview;
    data['max-video-preview'] = this.maxVideoPreview;
    return data;
  }
}

class Schema {
  String? context;
  List<Graph>? graph;

  Schema({this.context, this.graph});

  Schema.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    if (json['@graph'] != null) {
      graph = <Graph>[];
      json['@graph'].forEach((v) {
        graph!.add(new Graph.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    if (this.graph != null) {
      data['@graph'] = this.graph!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Graph {
  String? type;
  String? id;
  String? url;
  String? name;
  ImageModel? images;
  ImageModel? breadcrumb;
  String? inLanguage;
  List<ItemListElement>? itemListElement;
  String? description;
  ImageModel? publisher;
  List<PotentialAction>? potentialAction;
  Logo? logo;
  ImageModel? image;

  Graph(
      {this.type,
      this.id,
      this.url,
      this.name,
      this.images,
      this.breadcrumb,
      this.inLanguage,
      this.itemListElement,
      this.description,
      this.publisher,
      this.potentialAction,
      this.logo,
      this.image});

  Graph.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    id = json['@id'];
    url = json['url'];
    name = json['name'];
    image = json['ImageModel'] != null
        ? new ImageModel.fromJson(json['ImageModel'])
        : null;
    breadcrumb = json['breadcrumb'] != null
        ? new ImageModel.fromJson(json['breadcrumb'])
        : null;
    inLanguage = json['inLanguage'];
    if (json['itemListElement'] != null) {
      itemListElement = <ItemListElement>[];
      json['itemListElement'].forEach((v) {
        itemListElement!.add(new ItemListElement.fromJson(v));
      });
    }
    description = json['description'];
    publisher = json['publisher'] != null
        ? new ImageModel.fromJson(json['publisher'])
        : null;
    if (json['potentialAction'] != null) {
      potentialAction = <PotentialAction>[];
      json['potentialAction'].forEach((v) {
        potentialAction!.add(new PotentialAction.fromJson(v));
      });
    }
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    image =
        json['image'] != null ? new ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['@id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    if (this.image != null) {
      data['ImageModel'] = this.image!.toJson();
    }
    if (this.breadcrumb != null) {
      data['breadcrumb'] = this.breadcrumb!.toJson();
    }
    data['inLanguage'] = this.inLanguage;
    if (this.itemListElement != null) {
      data['itemListElement'] =
          this.itemListElement!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    if (this.publisher != null) {
      data['publisher'] = this.publisher!.toJson();
    }
    if (this.potentialAction != null) {
      data['potentialAction'] =
          this.potentialAction!.map((v) => v.toJson()).toList();
    }
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class ItemListElement {
  String? type;
  int? position;
  String? name;
  String? item;

  ItemListElement({this.type, this.position, this.name, this.item});

  ItemListElement.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    position = json['position'];
    name = json['name'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['position'] = this.position;
    data['name'] = this.name;
    data['item'] = this.item;
    return data;
  }
}

class PotentialAction {
  String? type;
  Target? target;
  String? queryInput;

  PotentialAction({this.type, this.target, this.queryInput});

  PotentialAction.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    target =
        json['target'] != null ? new Target.fromJson(json['target']) : null;
    queryInput = json['query-input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    if (this.target != null) {
      data['target'] = this.target!.toJson();
    }
    data['query-input'] = this.queryInput;
    return data;
  }
}

class Target {
  String? type;
  String? urlTemplate;

  Target({this.type, this.urlTemplate});

  Target.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    urlTemplate = json['urlTemplate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['urlTemplate'] = this.urlTemplate;
    return data;
  }
}

class Logo {
  String? type;
  String? inLanguage;
  String? id;
  String? url;
  String? contentUrl;
  int? width;
  int? height;
  String? caption;

  Logo(
      {this.type,
      this.inLanguage,
      this.id,
      this.url,
      this.contentUrl,
      this.width,
      this.height,
      this.caption});

  Logo.fromJson(Map<String, dynamic> json) {
    type = json['@type'];
    inLanguage = json['inLanguage'];
    id = json['@id'];
    url = json['url'];
    contentUrl = json['contentUrl'];
    width = json['width'];
    height = json['height'];
    caption = json['caption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@type'] = this.type;
    data['inLanguage'] = this.inLanguage;
    data['@id'] = this.id;
    data['url'] = this.url;
    data['contentUrl'] = this.contentUrl;
    data['width'] = this.width;
    data['height'] = this.height;
    data['caption'] = this.caption;
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;

  Links({this.self, this.collection});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      var selfList = json['self'] as List;
      self = selfList.map((e) => Self.fromJson(e)).toList();
    }
    if (json['collection'] != null) {
      var collectionList = json['collection'] as List;
      collection = collectionList.map((e) => Collection.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (self != null) {
      data['self'] = self!.map((e) => e.toJson()).toList();
    }
    if (collection != null) {
      data['collection'] = collection!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['href'] = href;
    return data;
  }
}

class Collection {
  String? href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['href'] = href;
    return data;
  }
}

class ImageModel {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  ImageModel({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    src = json['src'];
    name = json['name'];
    alt = json['alt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['src'] = this.src;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}
