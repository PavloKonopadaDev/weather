import 'package:flutter/material.dart';
import 'package:weather_app/utils/dimens.dart';
import 'package:weather_app/utils/images.dart';
import 'package:weather_app/utils/strings.dart';

class Cat404Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(ThemeDimens.dialogMinHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(opacity: .7, child: Image(image: ThemeImages.cat)),
              Text(errorText,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Theme.of(context).hintColor)),
            ],
          ),
        ),
      );
}
