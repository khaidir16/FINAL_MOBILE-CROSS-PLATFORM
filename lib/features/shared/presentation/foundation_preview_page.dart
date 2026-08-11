import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_roles.dart';
import '../../../core/services/service_registry.dart';

class FoundationPreviewPage extends StatelessWidget {
  const FoundationPreviewPage({super.key});

  static const List<AppRole> _roles = AppRole.values;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SelectionArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 36),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _TopBar(colors: colors),
                    const SizedBox(height: 22),
                    _HeroSection(colors: colors),
                    const SizedBox(height: 28),
                    Text(
                      'Fondasi arsitektur',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const _FoundationStatusGrid(),
                    const SizedBox(height: 30),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Role LMS',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        _StatusPill(
                          label: '4 role target minimum',
                          icon: Icons.verified_outlined,
                          foreground: colors.primary,
                          background: colors.primaryContainer,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        final int columns = constraints.maxWidth >= 940
                            ? 3
                            : constraints.maxWidth >= 620
                                ? 2
                                : 1;

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _roles.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: columns,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            mainAxisExtent: 178,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return _RoleCard(role: _roles[index]);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 28),
                    _NextPhaseBanner(colors: colors),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: <Widget>[
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.school_rounded, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                AppConstants.appName,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                AppConstants.appTagline,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        _StatusPill(
          label: 'Phase 1',
          icon: Icons.check_circle_outline_rounded,
          foreground: colors.onSecondaryContainer,
          background: colors.secondaryContainer,
        ),
      ],
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[colors.primary, colors.tertiary],
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool compact = constraints.maxWidth < 720;
          final Widget copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const _StatusPill(
                label: AppConstants.phaseOneLabel,
                icon: Icons.task_alt_rounded,
                foreground: Color(0xFF15342B),
                background: Color(0xFFD8F7EA),
              ),
              const SizedBox(height: 18),
              Text(
                'Fondasi modern untuk LMS SMK lintas platform.',
                style: textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Struktur modular sudah disiapkan untuk Android, Web, autentikasi multi-role, dan integrasi Firebase pada fase berikutnya.',
                style: textTheme.bodyLarge?.copyWith(
                  color: const Color(0xFFE8ECFF),
                  height: 1.5,
                ),
              ),
            ],
          );

          final Widget mark = Container(
            width: compact ? double.infinity : 190,
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0x22FFFFFF),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0x33FFFFFF)),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              size: 70,
              color: Colors.white,
            ),
          );

          if (compact) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                copy,
                const SizedBox(height: 22),
                mark,
              ],
            );
          }

          return Row(
            children: <Widget>[
              Expanded(child: copy),
              const SizedBox(width: 28),
              mark,
            ],
          );
        },
      ),
    );
  }
}

class _FoundationStatusGrid extends StatelessWidget {
  const _FoundationStatusGrid();

  @override
  Widget build(BuildContext context) {
    final List<_FoundationItem> items = <_FoundationItem>[
      const _FoundationItem(
        title: 'Flutter',
        subtitle: 'Project & Material 3 siap',
        icon: Icons.flutter_dash_rounded,
        ready: true,
      ),
      const _FoundationItem(
        title: 'Web',
        subtitle: 'Sudah teruji di browser',
        icon: Icons.language_rounded,
        ready: true,
      ),
      const _FoundationItem(
        title: 'Android',
        subtitle: 'Sudah teruji di device fisik',
        icon: Icons.android_rounded,
        ready: true,
      ),
      _FoundationItem(
        title: 'Firebase',
        subtitle: ServiceRegistry.isFirebaseConfigured
            ? 'Sudah terhubung'
            : 'Dikerjakan pada Phase 2',
        icon: Icons.cloud_outlined,
        ready: ServiceRegistry.isFirebaseConfigured,
      ),
    ];

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int columns = constraints.maxWidth >= 900
            ? 4
            : constraints.maxWidth >= 520
                ? 2
                : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 122,
          ),
          itemBuilder: (BuildContext context, int index) {
            return _FoundationStatusCard(item: items[index]);
          },
        );
      },
    );
  }
}

class _FoundationItem {
  const _FoundationItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.ready,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final bool ready;
}

class _FoundationStatusCard extends StatelessWidget {
  const _FoundationStatusCard({required this.item});

  final _FoundationItem item;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: item.ready ? colors.primaryContainer : colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              item.icon,
              color: item.ready ? colors.onPrimaryContainer : colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title,
                  style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Icon(
            item.ready ? Icons.check_circle_rounded : Icons.schedule_rounded,
            size: 19,
            color: item.ready ? colors.primary : colors.onSurfaceVariant,
          ),
        ],
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({required this.role});

  final AppRole role;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(
                  _iconForRole(role),
                  color: colors.onSecondaryContainer,
                  size: 22,
                ),
              ),
              const Spacer(),
              if (role.isMinimumFinalTarget)
                _StatusPill(
                  label: 'Target final',
                  icon: Icons.flag_outlined,
                  foreground: colors.primary,
                  background: colors.primaryContainer,
                ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            role.label,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            role.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall?.copyWith(
              color: colors.onSurfaceVariant,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForRole(AppRole role) => switch (role) {
        AppRole.student => Icons.school_outlined,
        AppRole.subjectTeacher => Icons.menu_book_outlined,
        AppRole.homeroomTeacher => Icons.groups_outlined,
        AppRole.counselor => Icons.psychology_alt_outlined,
        AppRole.dutyTeacher => Icons.fact_check_outlined,
        AppRole.admin => Icons.admin_panel_settings_outlined,
      };
}

class _NextPhaseBanner extends StatelessWidget {
  const _NextPhaseBanner({required this.colors});

  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.route_outlined, color: colors.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Berikutnya: integrasi backend Firebase',
                  style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 5),
                Text(
                  'Phase 1 hanya menyiapkan fondasi, arsitektur, tema, dan validasi cross-platform. Firebase belum diaktifkan agar tahapan tetap terkontrol.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({
    required this.label,
    required this.icon,
    required this.foreground,
    required this.background,
  });

  final String label;
  final IconData icon;
  final Color foreground;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 15, color: foreground),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ],
      ),
    );
  }
}
