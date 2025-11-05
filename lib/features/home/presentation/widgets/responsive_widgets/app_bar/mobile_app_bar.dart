import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/extensions/screen_size.dart';
import 'package:senior_flutter_test/core/extensions/translation.dart';
import 'package:senior_flutter_test/core/generated/generated_assets/assets.gen.dart';
import 'package:senior_flutter_test/features/home/presentation/widgets/shared_widgets/custom_vertical_divider.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsetsDirectional.only(end: 20),
      title: Assets.icons.logo.svg(width: 82, height: 40),
      actions: [
        Tooltip(
          message: context.translations.items,
          child: Assets.icons.settingsIcon.svg(width: 24, height: 24),
        ),
        SizedBox(width: 12.w),
        Tooltip(
          message: context.translations.items,
          child: Assets.icons.notification.svg(width: 24, height: 24),
        ),
        SizedBox(width: 12.w),
        CustomVerticalDivider(height: 22.h),
        Assets.images.userImage.image(width: 32, height: 32),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomDivider(),
      ),
    );
  }
}
