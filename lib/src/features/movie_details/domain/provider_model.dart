class ProviderModel {
  final String link;
  final List<Provider> flatrate;
  final List<Provider> rent;
  final List<Provider> buy;

  ProviderModel({
    required this.link,
    required this.flatrate,
    required this.rent,
    required this.buy,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      link: json['link'] ?? "",
      flatrate: (json['flatrate'] as List<dynamic>?)
              ?.map((item) => Provider.fromJson(item))
              .toList() ??
          [],
      rent: (json['rent'] as List<dynamic>?)
              ?.map((item) => Provider.fromJson(item))
              .toList() ??
          [],
      buy: (json['buy'] as List<dynamic>?)
              ?.map((item) => Provider.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'link': link,
      'flatrate': flatrate.map((item) => item.toJson()).toList(),
      'rent': rent.map((item) => item.toJson()).toList(),
      'buy': buy.map((item) => item.toJson()).toList(),
    };
  }
}

class Provider {
  final String logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;

  Provider({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      logoPath: json['logo_path'] ?? "",
      providerId: json['provider_id'] ?? 0,
      providerName: json['provider_name'] ?? "",
      displayPriority: json['display_priority'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'logo_path': logoPath,
      'provider_id': providerId,
      'provider_name': providerName,
      'display_priority': displayPriority,
    };
  }
}
