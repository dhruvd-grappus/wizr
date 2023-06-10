import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/asset_paths.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Row(
        children: [
          AppLogo(),
          Spacer(),
          HeaderLogo(
            iconPath: AssetIcons.globalSearch,
          ),
          SizedBox(width: 6),
          HeaderLogo(
            iconPath: AssetIcons.hamburgerMenu,
            color: AppColors.eggShell,
          ),
        ],
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetIcons.appLogo,
    );
  }
}

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    required this.iconPath,
    this.onTap,
    super.key,
    this.color = AppColors.yellow,
    this.iconColor,
  });
  final String iconPath;
  final Color? iconColor;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: SizedBox(
            child: SvgPicture.asset(
              iconPath,
              colorFilter: (iconColor != null)
                  ? ColorFilter.mode(
                      iconColor!,
                      BlendMode.srcIn,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
