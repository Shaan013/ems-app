import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_edge_insets.dart';

class AddressCard extends StatelessWidget {
  final String address;
  final VoidCallback? onContextTap;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const AddressCard({
    super.key,
    required this.address,
    this.onDelete,
    this.onEdit,
    this.onContextTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: .hardEdge,
      color: AppColors.white,
      child: Column(
        children: [
          GestureDetector(
            onTap: onContextTap,
            child: Padding(
              padding: AppEdgeInsets.m,
              child: Row(
                children: [
                  // CircleAvatar(
                  //   radius: 30,
                  //   backgroundColor: Colors.blue,
                  //   child: Text(
                  //     address[0].toUpperCase(),
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // 10.horizontalSpace,
                  Expanded(
                    child: Text(
                      address,
                      style: TextTheme.of(context).titleMedium,
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.verticalSpace,
          Divider(height: 1),
          Row(
            children: [
              Expanded(
                child: _button(
                  context,
                  icons: Icons.delete,
                  label: "Delete",
                  splashColor: Colors.red.withAlpha(50),
                  iconColor: AppColors.blue,
                  onTap: onDelete,
                ),
              ),
              SizedBox(height: 50.h, child: VerticalDivider(width: 1)),
              Expanded(
                child: _button(
                  context,
                  icons: Icons.edit,
                  label: "Change",
                  onTap: onEdit,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _button(
    BuildContext context, {
    required VoidCallback? onTap,
    required IconData icons,
    required String label,
    Color? splashColor,
    Color? iconColor,
  }) {
    return Ink(
      height: 50.h,
      child: GestureDetector(
        onTap: onTap,
        // splashColor: splashColor,
        child: Padding(
          padding: const EdgeInsets.all(8).r,
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Icon(icons, color: iconColor),
              10.verticalSpace,
              Text(
                label,
                maxLines: 1,
                style: TextTheme.of(context).titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
