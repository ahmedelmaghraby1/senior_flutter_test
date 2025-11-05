import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senior_flutter_test/core/extensions/screen_size.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';
import 'package:senior_flutter_test/core/extensions/translation.dart';
import 'package:senior_flutter_test/core/generated/generated_assets/assets.gen.dart';
import 'package:senior_flutter_test/core/presentation/ui/widgets/loader.dart';
import 'package:senior_flutter_test/features/home/presentation/widgets/responsive_widgets/app_bar/tablet_app_bar.dart';
import 'package:senior_flutter_test/features/home/presentation/widgets/responsive_widgets/trip_widget/tablet_trip_widget.dart';
import 'package:senior_flutter_test/features/home/presentation/widgets/shared_widgets/custom_vertical_divider.dart';
import 'package:senior_flutter_test/features/home/providers/providers.dart';

class TabletHomeScreen extends ConsumerStatefulWidget {
  const TabletHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TabletHomeScreenState();
}

class _TabletHomeScreenState extends ConsumerState<TabletHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tripsState = ref.watch(tripsNotifierProvider);
    return Scaffold(
      body: Column(
        children: [
          TabletAppBar(tabController: _tabController),
          SizedBox(height: 10.h),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 24.h),
              child: TabBarView(
                controller: _tabController,
                children: [
                  tripsState.when(
                    loading: () => const Loader(),
                    error: (e, _) => Center(child: Text(e.toString())),
                    data: (trips) => ListView(
                      children: [
                        Container(
                          padding: EdgeInsetsDirectional.symmetric(
                            vertical: 12.h,
                          ),
                          child: Row(
                            children: [
                              Text(
                                context.translations.items,
                                style: context.textTheme.headlineLarge
                                    ?.copyWith(fontSize: 32.sp),
                              ),
                              Spacer(),
                              Row(
                                spacing: 14.w,
                                children: [
                                  CircleAvatar(
                                    radius: 24.r,
                                    backgroundColor:
                                        context.appColor.containerColor,
                                    child: Assets.icons.filtersIcon.svg(
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),
                                  CustomVerticalDivider(height: 48.h),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        100.r,
                                      ),
                                      color: context.appColor.secondaryColor,
                                    ),
                                    padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 24.w,
                                      vertical: 15.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Assets.icons.plusIcon.svg(
                                          width: 20.w,
                                          height: 20,
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          'Add new item',
                                          style: context.textTheme.titleMedium
                                              ?.copyWith(
                                                color: context
                                                    .appColor
                                                    .textColor
                                                    .black,
                                                fontSize: 14.sp,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 14.w),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Wrap(
                          runSpacing: 16.w,
                          spacing: 20.h,
                          alignment: WrapAlignment.start,
                          children: List.generate(
                            trips.length,
                            (int index) => TabletTripWidget(trip: trips[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
