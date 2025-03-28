import 'package:flutter/cupertino.dart';

/// movie database api key and base configurations
const theMovieDatabaseApiKey = "";
const theMovieDatabaseApiBaseURL = "https://api.themoviedb.org/3";
const theMovieDatabaseApiImageBaseURL = "https://image.tmdb.org/t/p/w500";
const standartLoadingPage = 1;

/// status colors of the movies
Map<String, Color> statusColor = {
  "Rumored": CupertinoColors.systemGrey2,
  "Planned": CupertinoColors.systemCyan,
  "In Production": CupertinoColors.activeOrange,
  "Post Production": CupertinoColors.activeOrange,
  "Released": CupertinoColors.activeGreen,
  "Canceled": CupertinoColors.systemRed,
};
