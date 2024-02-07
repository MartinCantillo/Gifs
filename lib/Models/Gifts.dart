/ To parse this JSON data, do
//
//     final gifs = gifsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Gifs gifsFromJson(String str) => Gifs.fromJson(json.decode(str));

String gifsToJson(Gifs data) => json.encode(data.toJson());

class Gifs {
    final List<Datum> data;
    final Meta meta;
    final Pagination pagination;

    Gifs({
        required this.data,
        required this.meta,
        required this.pagination,
    });

    factory Gifs.fromJson(Map<String, dynamic> json) => Gifs(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
        "pagination": pagination.toJson(),
    };
}

class Datum {
    final String type;
    final String id;
    final String url;
    final String slug;
    final String bitlyGifUrl;
    final String bitlyUrl;
    final String embedUrl;
    final String username;
    final String source;
    final String title;
    final String rating;
    final String contentUrl;
    final String sourceTld;
    final String sourcePostUrl;
    final int isSticker;
    final DateTime importDatetime;
    final DateTime trendingDatetime;
    final Images images;
    final User user;
    final String analyticsResponsePayload;
    final Analytics analytics;

    Datum({
        required this.type,
        required this.id,
        required this.url,
        required this.slug,
        required this.bitlyGifUrl,
        required this.bitlyUrl,
        required this.embedUrl,
        required this.username,
        required this.source,
        required this.title,
        required this.rating,
        required this.contentUrl,
        required this.sourceTld,
        required this.sourcePostUrl,
        required this.isSticker,
        required this.importDatetime,
        required this.trendingDatetime,
        required this.images,
        required this.user,
        required this.analyticsResponsePayload,
        required this.analytics,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        id: json["id"],
        url: json["url"],
        slug: json["slug"],
        bitlyGifUrl: json["bitly_gif_url"],
        bitlyUrl: json["bitly_url"],
        embedUrl: json["embed_url"],
        username: json["username"],
        source: json["source"],
        title: json["title"],
        rating: json["rating"],
        contentUrl: json["content_url"],
        sourceTld: json["source_tld"],
        sourcePostUrl: json["source_post_url"],
        isSticker: json["is_sticker"],
        importDatetime: DateTime.parse(json["import_datetime"]),
        trendingDatetime: DateTime.parse(json["trending_datetime"]),
        images: Images.fromJson(json["images"]),
        user: User.fromJson(json["user"]),
        analyticsResponsePayload: json["analytics_response_payload"],
        analytics: Analytics.fromJson(json["analytics"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "url": url,
        "slug": slug,
        "bitly_gif_url": bitlyGifUrl,
        "bitly_url": bitlyUrl,
        "embed_url": embedUrl,
        "username": username,
        "source": source,
        "title": title,
        "rating": rating,
        "content_url": contentUrl,
        "source_tld": sourceTld,
        "source_post_url": sourcePostUrl,
        "is_sticker": isSticker,
        "import_datetime": importDatetime.toIso8601String(),
        "trending_datetime": trendingDatetime.toIso8601String(),
        "images": images.toJson(),
        "user": user.toJson(),
        "analytics_response_payload": analyticsResponsePayload,
        "analytics": analytics.toJson(),
    };
}

class Analytics {
    final Onclick onload;
    final Onclick onclick;
    final Onclick onsent;

    Analytics({
        required this.onload,
        required this.onclick,
        required this.onsent,
    });

    factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
        onload: Onclick.fromJson(json["onload"]),
        onclick: Onclick.fromJson(json["onclick"]),
        onsent: Onclick.fromJson(json["onsent"]),
    );

    Map<String, dynamic> toJson() => {
        "onload": onload.toJson(),
        "onclick": onclick.toJson(),
        "onsent": onsent.toJson(),
    };
}

class Onclick {
    final String url;

    Onclick({
        required this.url,
    });

    factory Onclick.fromJson(Map<String, dynamic> json) => Onclick(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}

class Images {
    final FixedHeight original;
    final The480WStill downsized;
    final The480WStill downsizedLarge;
    final The480WStill downsizedMedium;
    final DownsizedSmall downsizedSmall;
    final The480WStill downsizedStill;
    final FixedHeight fixedHeight;
    final FixedHeight fixedHeightDownsampled;
    final FixedHeight fixedHeightSmall;
    final The480WStill fixedHeightSmallStill;
    final The480WStill fixedHeightStill;
    final FixedHeight fixedWidth;
    final FixedHeight fixedWidthDownsampled;
    final FixedHeight fixedWidthSmall;
    final The480WStill fixedWidthSmallStill;
    final The480WStill fixedWidthStill;
    final Looping looping;
    final The480WStill originalStill;
    final DownsizedSmall originalMp4;
    final DownsizedSmall preview;
    final The480WStill previewGif;
    final The480WStill previewWebp;
    final DownsizedSmall hd;
    final The480WStill the480WStill;

    Images({
        required this.original,
        required this.downsized,
        required this.downsizedLarge,
        required this.downsizedMedium,
        required this.downsizedSmall,
        required this.downsizedStill,
        required this.fixedHeight,
        required this.fixedHeightDownsampled,
        required this.fixedHeightSmall,
        required this.fixedHeightSmallStill,
        required this.fixedHeightStill,
        required this.fixedWidth,
        required this.fixedWidthDownsampled,
        required this.fixedWidthSmall,
        required this.fixedWidthSmallStill,
        required this.fixedWidthStill,
        required this.looping,
        required this.originalStill,
        required this.originalMp4,
        required this.preview,
        required this.previewGif,
        required this.previewWebp,
        required this.hd,
        required this.the480WStill,
    });

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        original: FixedHeight.fromJson(json["original"]),
        downsized: The480WStill.fromJson(json["downsized"]),
        downsizedLarge: The480WStill.fromJson(json["downsized_large"]),
        downsizedMedium: The480WStill.fromJson(json["downsized_medium"]),
        downsizedSmall: DownsizedSmall.fromJson(json["downsized_small"]),
        downsizedStill: The480WStill.fromJson(json["downsized_still"]),
        fixedHeight: FixedHeight.fromJson(json["fixed_height"]),
        fixedHeightDownsampled: FixedHeight.fromJson(json["fixed_height_downsampled"]),
        fixedHeightSmall: FixedHeight.fromJson(json["fixed_height_small"]),
        fixedHeightSmallStill: The480WStill.fromJson(json["fixed_height_small_still"]),
        fixedHeightStill: The480WStill.fromJson(json["fixed_height_still"]),
        fixedWidth: FixedHeight.fromJson(json["fixed_width"]),
        fixedWidthDownsampled: FixedHeight.fromJson(json["fixed_width_downsampled"]),
        fixedWidthSmall: FixedHeight.fromJson(json["fixed_width_small"]),
        fixedWidthSmallStill: The480WStill.fromJson(json["fixed_width_small_still"]),
        fixedWidthStill: The480WStill.fromJson(json["fixed_width_still"]),
        looping: Looping.fromJson(json["looping"]),
        originalStill: The480WStill.fromJson(json["original_still"]),
        originalMp4: DownsizedSmall.fromJson(json["original_mp4"]),
        preview: DownsizedSmall.fromJson(json["preview"]),
        previewGif: The480WStill.fromJson(json["preview_gif"]),
        previewWebp: The480WStill.fromJson(json["preview_webp"]),
        hd: DownsizedSmall.fromJson(json["hd"]),
        the480WStill: The480WStill.fromJson(json["480w_still"]),
    );

    Map<String, dynamic> toJson() => {
        "original": original.toJson(),
        "downsized": downsized.toJson(),
        "downsized_large": downsizedLarge.toJson(),
        "downsized_medium": downsizedMedium.toJson(),
        "downsized_small": downsizedSmall.toJson(),
        "downsized_still": downsizedStill.toJson(),
        "fixed_height": fixedHeight.toJson(),
        "fixed_height_downsampled": fixedHeightDownsampled.toJson(),
        "fixed_height_small": fixedHeightSmall.toJson(),
        "fixed_height_small_still": fixedHeightSmallStill.toJson(),
        "fixed_height_still": fixedHeightStill.toJson(),
        "fixed_width": fixedWidth.toJson(),
        "fixed_width_downsampled": fixedWidthDownsampled.toJson(),
        "fixed_width_small": fixedWidthSmall.toJson(),
        "fixed_width_small_still": fixedWidthSmallStill.toJson(),
        "fixed_width_still": fixedWidthStill.toJson(),
        "looping": looping.toJson(),
        "original_still": originalStill.toJson(),
        "original_mp4": originalMp4.toJson(),
        "preview": preview.toJson(),
        "preview_gif": previewGif.toJson(),
        "preview_webp": previewWebp.toJson(),
        "hd": hd.toJson(),
        "480w_still": the480WStill.toJson(),
    };
}

class The480WStill {
    final String height;
    final String width;
    final String size;
    final String url;

    The480WStill({
        required this.height,
        required this.width,
        required this.size,
        required this.url,
    });

    factory The480WStill.fromJson(Map<String, dynamic> json) => The480WStill(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "size": size,
        "url": url,
    };
}

class DownsizedSmall {
    final String height;
    final String width;
    final String mp4Size;
    final String mp4;

    DownsizedSmall({
        required this.height,
        required this.width,
        required this.mp4Size,
        required this.mp4,
    });

    factory DownsizedSmall.fromJson(Map<String, dynamic> json) => DownsizedSmall(
        height: json["height"],
        width: json["width"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "mp4_size": mp4Size,
        "mp4": mp4,
    };
}

class FixedHeight {
    final String height;
    final String width;
    final String size;
    final String url;
    final String mp4Size;
    final String mp4;
    final String webpSize;
    final String webp;
    final String frames;
    final String hash;

    FixedHeight({
        required this.height,
        required this.width,
        required this.size,
        required this.url,
        required this.mp4Size,
        required this.mp4,
        required this.webpSize,
        required this.webp,
        required this.frames,
        required this.hash,
    });

    factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
        webpSize: json["webp_size"],
        webp: json["webp"],
        frames: json["frames"],
        hash: json["hash"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "size": size,
        "url": url,
        "mp4_size": mp4Size,
        "mp4": mp4,
        "webp_size": webpSize,
        "webp": webp,
        "frames": frames,
        "hash": hash,
    };
}

class Looping {
    final String mp4Size;
    final String mp4;

    Looping({
        required this.mp4Size,
        required this.mp4,
    });

    factory Looping.fromJson(Map<String, dynamic> json) => Looping(
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
    );

    Map<String, dynamic> toJson() => {
        "mp4_size": mp4Size,
        "mp4": mp4,
    };
}

class User {
    final String avatarUrl;
    final String bannerImage;
    final String bannerUrl;
    final String profileUrl;
    final String username;
    final String displayName;
    final String description;
    final String instagramUrl;
    final String websiteUrl;
    final bool isVerified;

    User({
        required this.avatarUrl,
        required this.bannerImage,
        required this.bannerUrl,
        required this.profileUrl,
        required this.username,
        required this.displayName,
        required this.description,
        required this.instagramUrl,
        required this.websiteUrl,
        required this.isVerified,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        avatarUrl: json["avatar_url"],
        bannerImage: json["banner_image"],
        bannerUrl: json["banner_url"],
        profileUrl: json["profile_url"],
        username: json["username"],
        displayName: json["display_name"],
        description: json["description"],
        instagramUrl: json["instagram_url"],
        websiteUrl: json["website_url"],
        isVerified: json["is_verified"],
    );

    Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl,
        "banner_image": bannerImage,
        "banner_url": bannerUrl,
        "profile_url": profileUrl,
        "username": username,
        "display_name": displayName,
        "description": description,
        "instagram_url": instagramUrl,
        "website_url": websiteUrl,
        "is_verified": isVerified,
    };
}

class Meta {
    final int status;
    final String msg;
    final String responseId;

    Meta({
        required this.status,
        required this.msg,
        required this.responseId,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        status: json["status"],
        msg: json["msg"],
        responseId: json["response_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "response_id": responseId,
    };
}

class Pagination {
    final int totalCount;
    final int count;
    final int offset;

    Pagination({
        required this.totalCount,
        required this.count,
        required this.offset,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        totalCount: json["total_count"],
        count: json["count"],
        offset: json["offset"],
    );

    Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "count": count,
        "offset": offset,
    };
}