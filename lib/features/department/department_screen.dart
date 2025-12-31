import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/route_names.dart';
import '../../data/models/department.dart';
import '../../data/models/student.dart';
import '../../data/repositories/data_repository.dart';

/// Department screen showing HOD and students
class DepartmentScreen extends StatelessWidget {
  final String departmentId;

  const DepartmentScreen({
    super.key,
    required this.departmentId,
  });

  @override
  Widget build(BuildContext context) {
    final department = DataRepository.getDepartmentById(departmentId);

    if (department == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Department not found'),
        ),
      );
    }

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // App Bar with Department Logo
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.go(RouteNames.mainMenu),
              tooltip: 'Back to Departments',
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => context.go(RouteNames.search),
                tooltip: 'Search',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                department.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      theme.colorScheme.primaryContainer,
                      theme.colorScheme.surface,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // HOD Section
          SliverToBoxAdapter(
            child: _HODCard(department: department)
                .animate()
                .fadeIn(duration: 500.ms)
                .slideY(begin: -0.1),
          ),

          // Section Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Graduates (${department.students.length})',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),

          // Students List
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final student = department.students[index];
                  return _StudentCard(
                    student: student,
                    index: index,
                  );
                },
                childCount: department.students.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Head of Department card
class _HODCard extends StatelessWidget {
  final Department department;

  const _HODCard({required this.department});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hod = department.headOfDepartment;

    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(hod.photoAssetPath),
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hod.title,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hod.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Student card widget
class _StudentCard extends StatelessWidget {
  final Student student;
  final int index;

  const _StudentCard({
    required this.student,
    required this.index,
  });

  Future<void> _launchEmail(String email) async {
    final uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchPhone(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _shareStudent() async {
    await Share.share(
      student.toShareText(),
      subject: '${student.fullName} - NUN 2015 Graduate',
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Photo
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(student.photoAssetPath),
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
            const SizedBox(width: 12),

            // Student Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    student.fullName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Email
                  if (student.email != null && student.email!.isNotEmpty)
                    InkWell(
                      onTap: () => _launchEmail(student.email!),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              student.email!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                  if (student.email != null && student.email!.isNotEmpty)
                    const SizedBox(height: 4),

                  // Phone
                  if (student.phone != null && student.phone!.isNotEmpty)
                    InkWell(
                      onTap: () => _launchPhone(student.phone!),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            student.phone!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // Share Button
            IconButton(
              icon: const Icon(Icons.share),
              iconSize: 20,
              onPressed: _shareStudent,
              tooltip: 'Share',
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (30 * index).ms, duration: 400.ms)
        .slideX(begin: -0.05, delay: (30 * index).ms);
  }
}
