import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_line/src/config.dart';
import 'package:red_line/src/features/movie_details/domain/provider_model.dart';

class ProviderTile extends StatelessWidget {
  final Provider provider;

  const ProviderTile({required this.provider, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
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
              width: 40,
              fit: BoxFit.cover,
            ),
            title: Text(provider.providerName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
        ));
  }
}
