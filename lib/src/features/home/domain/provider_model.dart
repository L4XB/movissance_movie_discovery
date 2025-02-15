class ProviderModel {
  final int id;
  final String logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;
  final String country = 'US';

  ProviderModel({
    required this.id,
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: json['id'],
      logoPath: json['logo_path'],
      providerId: json['provider_id'],
      providerName: json['provider_name'],
      displayPriority: json['display_priority'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo_path': logoPath,
      'provider_id': providerId,
      'provider_name': providerName,
      'display_priority': displayPriority,
    };
  }
}
