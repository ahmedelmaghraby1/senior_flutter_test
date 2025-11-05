import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senior_flutter_test/core/extensions/screen_size.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';
import 'package:senior_flutter_test/core/extensions/translation.dart';
import 'package:senior_flutter_test/core/generated/generated_assets/assets.gen.dart';
import 'package:senior_flutter_test/core/presentation/ui/widgets/loader.dart';
import 'package:senior_flutter_test/features/home/presentation/widgets/responsive_widgets/app_bar/mobile_app_bar.dart';
import 'package:senior_flutter_test/features/home/presentation/widgets/responsive_widgets/trip_widget/Mobile_trip_widget.dart';
import 'package:senior_flutter_test/features/home/providers/providers.dart';

class MobileHomeScreen extends ConsumerWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripsState = ref.watch(tripsNotifierProvider);

    return Scaffold(
      drawer: Drawer(),
      appBar: MobileAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.translations.items,
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontSize: 24.sp,
                  ),
                ),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: context.appColor.containerColor,
                  child: Assets.icons.filtersIcon.svg(width: 20, height: 20),
                ),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: tripsState.when(
                loading: () => const Loader(),
                error: (e, _) => Center(child: Text(e.toString())),
                data: (trips) => ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemCount: trips.length,
                  itemBuilder: (BuildContext context, int index) =>
                      MobileTripWidget(trip: trips[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
