import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/enums/responsive_enum.dart';
import 'package:senior_flutter_test/core/extensions/responsive.dart';
import 'package:senior_flutter_test/core/extensions/screen_size.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';
import 'package:senior_flutter_test/core/generated/generated_assets/assets.gen.dart';
import 'package:senior_flutter_test/core/helpers/date_formating.dart';
import 'package:senior_flutter_test/core/helpers/set_trip_status.dart';
import 'package:senior_flutter_test/features/home/domain/entities/trip.dart';
import 'package:senior_flutter_test/features/home/presentation/widgets/shared_widgets/user_images.dart';

class TabletTripWidget extends StatelessWidget {
  final Trip trip;
  const TabletTripWidget({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: (243.25),
          height: 322,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                trip.image ??
                    "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
              ),
            ),
            borderRadius: BorderRadius.circular(15.r),
            gradient: context.appColor.tripContainerGradient,
          ),
        ),
        Container(
          width: (243.25),
          height: 322,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),

            gradient: context.appColor.tripContainerGradient,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: (8.35),
                  end: (8.35),
                  top: (8.35),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: context.appColor.containerColor,
                      child: Assets.icons.moreHorizontal.svg(),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 24,
                  start: 15,
                  end: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: setTripStatusColor(
                          context: context,
                          status: setTripStatus(status: trip.status),
                        ).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: setTripStatusColor(
                            context: context,
                            status: setTripStatus(status: trip.status),
                          ),
                          width: (0.5).sp,
                        ),
                      ),
                      child: Row(
                        spacing: 4,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            trip.status,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 16),
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      trip.title,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleLarge,
                    ),
                    SizedBox(height: 6),

                    Row(
                      children: [
                        Assets.icons.calendar.svg(width: 16, height: 16),
                        SizedBox(width: 6.w),
                        Flexible(
                          child: Text(
                            formatDateRange(trip.startDate, trip.endDate),
                            overflow: TextOverflow.ellipsis,

                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 213,
                      height: (1),
                      color: context.appColor.containerColor,
                    ),
                    SizedBox(height: 12),
                    UsersImages(
                      tourists: trip.tourists,
                      unfinishedTasks: trip.unfinishedTasks,
                      width: context.responsiveUI == ResponsiveUI.web
                          ? 244
                          : 343,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
