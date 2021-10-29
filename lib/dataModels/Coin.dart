// To parse this JSON data, do
//
//     final coin = coinFromJson(jsonString);

import 'dart:convert';

Coin coinFromJson(String str) => Coin.fromJson(json.decode(str));

String coinToJson(Coin data) => json.encode(data.toJson());

class Coin {
  Coin({
    this.status,
    this.data,
  });

  Status status;
  List<Datum> data;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
    status: Status.fromJson(json["status"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.platform,
    this.cmcRank,
    this.lastUpdated,
    this.quote,
    this.isFav
  });

  int id;
  String name;
  String symbol;
  String slug;
  int numMarketPairs;
  String dateAdded;
  List<String> tags;
  double maxSupply;
  double circulatingSupply;
  double totalSupply;
  Platform platform;
  int cmcRank;
  String lastUpdated;
  Quote quote;
  bool isFav=false;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    numMarketPairs: json["num_market_pairs"],
    dateAdded: json["date_added"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    maxSupply: json["max_supply"] == null ? null : json["max_supply"].toDouble(),
    circulatingSupply: json["circulating_supply"].toDouble(),
    totalSupply: json["total_supply"].toDouble(),
    platform: json["platform"] == null ? null : Platform.fromJson(json["platform"]),
    cmcRank: json["cmc_rank"],
    lastUpdated: json["last_updated"],
    quote: Quote.fromJson(json["quote"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "num_market_pairs": numMarketPairs,
    "date_added": dateAdded,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "max_supply": maxSupply == null ? null : maxSupply,
    "circulating_supply": circulatingSupply,
    "total_supply": totalSupply,
    "platform": platform == null ? null : platform.toJson(),
    "cmc_rank": cmcRank,
    "last_updated": lastUpdated,
    "quote": quote.toJson(),
  };
}

class Platform {
  Platform({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.tokenAddress,
  });

  int id;
  String name;
  String symbol;
  String slug;
  String tokenAddress;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    tokenAddress: json["token_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "token_address": tokenAddress,
  };
}

class Quote {
  Quote({
    this.usd,
  });

  Usd usd;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    usd: Usd.fromJson(json["USD"]),
  );

  Map<String, dynamic> toJson() => {
    "USD": usd.toJson(),
  };
}

class Usd {
  Usd({
    this.price,
    this.volume24H,
    this.volumeChange24H,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.percentChange30D,
    this.percentChange60D,
    this.percentChange90D,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.lastUpdated,
  });

  double price;
  double volume24H;
  double volumeChange24H;
  double percentChange1H;
  double percentChange24H;
  double percentChange7D;
  double percentChange30D;
  double percentChange60D;
  double percentChange90D;
  double marketCap;
  double marketCapDominance;
  double fullyDilutedMarketCap;
  String lastUpdated;
  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
    price: json["price"].toDouble(),
    volume24H: json["volume_24h"].toDouble(),
    volumeChange24H: json["volume_change_24h"].toDouble(),
    percentChange1H: json["percent_change_1h"].toDouble(),
    percentChange24H: json["percent_change_24h"].toDouble(),
    percentChange7D: json["percent_change_7d"].toDouble(),
    percentChange30D: json["percent_change_30d"].toDouble(),
    percentChange60D: json["percent_change_60d"].toDouble(),
    percentChange90D: json["percent_change_90d"].toDouble(),
    marketCap: json["market_cap"].toDouble(),
    marketCapDominance: json["market_cap_dominance"].toDouble(),
    fullyDilutedMarketCap: json["fully_diluted_market_cap"].toDouble(),
    lastUpdated: json["last_updated"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "volume_24h": volume24H,
    "volume_change_24h": volumeChange24H,
    "percent_change_1h": percentChange1H,
    "percent_change_24h": percentChange24H,
    "percent_change_7d": percentChange7D,
    "percent_change_30d": percentChange30D,
    "percent_change_60d": percentChange60D,
    "percent_change_90d": percentChange90D,
    "market_cap": marketCap,
    "market_cap_dominance": marketCapDominance,
    "fully_diluted_market_cap": fullyDilutedMarketCap,
    "last_updated": lastUpdated,
  };
}

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
    this.totalCount,
  });

  String timestamp;
  int errorCode;
  dynamic errorMessage;
  int elapsed;
  int creditCount;
  dynamic notice;
  int totalCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    timestamp: json["timestamp"],
    errorCode: json["error_code"],
    errorMessage: json["error_message"],
    elapsed: json["elapsed"],
    creditCount: json["credit_count"],
    notice: json["notice"],
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "error_code": errorCode,
    "error_message": errorMessage,
    "elapsed": elapsed,
    "credit_count": creditCount,
    "notice": notice,
    "total_count": totalCount,
  };
}
