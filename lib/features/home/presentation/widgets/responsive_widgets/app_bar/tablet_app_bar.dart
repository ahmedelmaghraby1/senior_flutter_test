import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/enums/tab_items_eunm.dart';
import 'package:senior_flutter_test/core/extensions/screen_size.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';
import 'package:senior_flutter_test/core/extensions/translation.dart';
import 'package:senior_flutter_test/core/generated/generated_assets/assets.gen.dart';
import 'package:senior_flutter_test/features/home/presentation/widgets/shared_widgets/custom_vertical_divider.dart';

class TabletAppBar extends StatelessWidget {
  final TabController tabController;

  const TabletAppBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 80.w),
      // height: 86,
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(width: 10, color: context.appColor.containerColor),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: 18.h),
            child: Assets.icons.logo.svg(width: 82.w, height: 40),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: TabBar(
              overlayColor: WidgetStatePropertyAll(
                context.appColor.secondaryColor,
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4),
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              controller: tabController,
              tabs: TabItems.values
                  .map((e) => Tab(text: context.translations.tabItems(e.name)))
                  .toList(),
            ),
          ),
          SizedBox(width: 25.w),
          Row(
            spacing: 24.w,
            children: [
              CustomVerticalDivider(),
              Tooltip(
                message: context.translations.settings,
                child: Assets.icons.settingsIcon.svg(width: 24.w, height: 24),
              ),
              Tooltip(
                message: context.translations.notification,
                child: Assets.icons.notification.svg(width: 24.w, height: 24),
              ),
              CustomVerticalDivider(),
              Row(
                children: [
                  Assets.images.userImage.image(width: 32.w, height: 32),
                  SizedBox(width: 10),
                  SizedBox(
                    child: Text(
                      'John Doe',
                      style: context.textTheme.bodyLarge?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.keyboard_arrow_down, size: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
