import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

class ProviderTile extends StatelessWidget {
  final Provider provider;

  const ProviderTile({required this.provider, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaler = MediaQuery.of(context).textScaler;
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.008),
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey5,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListTile(
            leading: Image.network(
              theMovieDatabaseApiImageBaseURL + provider.logoPath,
              width: size.width * 0.1,
              fit: BoxFit.cover,
            ),
            title: Text(provider.providerName,
                style: TextStyle(
                    fontSize: scaler.scale(18), fontWeight: FontWeight.w500)),
          ),
        ));
  }
}
