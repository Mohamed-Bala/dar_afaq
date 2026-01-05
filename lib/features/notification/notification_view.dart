import 'package:dar_afaq/features/dashboard/logic/home_cubit.dart';
import 'package:dar_afaq/features/dashboard/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/spacing.dart';
import '../../core/widgets/refresh_Indicator_widget.dart';
import '../../core/widgets/snackbar_message.dart';
import 'widgets/Notifications_widget.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final time = DateTime.now().subtract(const Duration(hours: 2));
  final Set<int> _readIndexes = {}; // تتبع عناصر المقروءة محلياً

  @override
  void initState() {
    super.initState();
    // طلب الإشعارات عند فتح الصفحة بعد إطار البناء
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NotificationsCubit>().emitGetNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الإشعارات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocListener<NotificationsCubit, NotificationsState>(
        listener: (context, state) {
          state.maybeWhen(
            notificationsError: (error) {
              final msg = error.message ?? "حدث خطأ";
              SnackBarMessage()
                  .showErrorSnackBar(message: msg, context: context);
            },
            notificationsSuccess: (_) {
              if (mounted) {
                setState(() => _readIndexes.clear());
              }
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<NotificationsCubit, NotificationsState>(
          builder: (context, state) {
            return state.maybeWhen(
              notificationsLoading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              notificationsSuccess: (notificationsResponse) {
                final notifications =
                    notificationsResponse.notificationsDataResponse ?? [];

                return RefreshIndicatorWidget(
                  onRefresh: () async {
                    context.read<NotificationsCubit>().emitGetNotifications();
                  },
                  child: notifications.isEmpty
                      ? buildEmptyState()
                      : ListView.separated(
                          padding: EdgeInsets.all(15.h),
                          itemCount: notifications.length,
                          separatorBuilder: (context, index) =>
                              verticalSpace(12),
                          itemBuilder: (context, index) {
                            return NotificationItem(
                              item: notifications[index]!,
                              index: index,
                            );
                          },
                        ),
                );
              },
              notificationsError: (error) =>
                  Center(child: Text(error.message ?? "خطأ")),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
