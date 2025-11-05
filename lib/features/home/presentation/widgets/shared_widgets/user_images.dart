import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';
import 'package:senior_flutter_test/core/extensions/translation.dart';
import 'package:senior_flutter_test/core/generated/generated_assets/assets.gen.dart';
import 'package:senior_flutter_test/core/presentation/ui/widgets/loader.dart';
import 'package:senior_flutter_test/features/home/domain/entities/tourist.dart';

class UsersImages extends StatelessWidget {
  const UsersImages({
    super.key,
    this.tourists,
    required this.unfinishedTasks,
    required this.width,
  });
  final List<Tourist>? tourists;
  final int unfinishedTasks;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: tourists != null
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: [
        if (tourists != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tourists!.length > 3) ...[
                for (int i = 0; i < 3; i++)
                  Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: context.appColor.containerColor,
                      child: tourists![i].image != null
                          ? Container(
                              height: 24,
                              width: 24,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const Loader(),
                                imageUrl: tourists![i].image!,
                                fit: BoxFit.fill,
                                height: 24,
                                width: 24,
                                errorWidget: (context, url, error) =>
                                    Assets.images.userImage.image(
                                      height: 24,
                                      width: 24,
                                      fit: BoxFit.fill,
                                    ),
                              ),
                            )
                          : Assets.images.userImage.image(),
                    ),
                  ),
                Align(
                  widthFactor: 0.5,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: context.appColor.containerColor,
                    child: Center(
                      child: Text(
                        '+${tourists!.length.toString()}',
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              ] else
                for (int i = 0; i < tourists!.length; i++)
                  Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: context.appColor.grey,
                      child: tourists![i].image != null
                          ? Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const Loader(),
                                imageUrl: tourists![i].image!,
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) =>
                                    Assets.images.userImage.image(
                                      height: 24,
                                      width: 24,
                                      fit: BoxFit.fill,
                                    ),
                              ),
                            )
                          : Assets.images.userImage.image(),
                    ),
                  ),
            ],
          ),
        Flexible(
          child: Tooltip(
            message: context.translations.unfinishedTasks(unfinishedTasks),
            child: Text(
              context.translations.unfinishedTasks(unfinishedTasks),
              style: context.textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
