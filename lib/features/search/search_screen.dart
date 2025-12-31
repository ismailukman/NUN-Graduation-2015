import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/route_names.dart';
import '../../data/models/student.dart';
import '../../data/repositories/data_repository.dart';
import 'search_provider.dart';

/// Global search screen for finding students
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Auto-focus search field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final searchState = ref.watch(searchProvider);
    final searchNotifier = ref.read(searchProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Graduates'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(RouteNames.mainMenu),
          tooltip: 'Back',
        ),
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: 'Search graduates by name, email, or phone...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchState.query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          searchNotifier.clear();
                        },
                      )
                    : null,
              ),
              onChanged: searchNotifier.search,
            ),
          ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.2),

          // Search Info
          if (searchState.query.isNotEmpty &&
              searchState.query.length < AppConstants.minSearchCharacters)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Type at least ${AppConstants.minSearchCharacters} characters to search',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),

          // Results Count
          if (searchState.query.length >= AppConstants.minSearchCharacters)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${searchState.results.length} result(s) found',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),

          // Results List
          Expanded(
            child: searchState.results.isEmpty
                ? _EmptyState(
                    query: searchState.query,
                    minChars: AppConstants.minSearchCharacters,
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: searchState.results.length,
                    itemBuilder: (context, index) {
                      final student = searchState.results[index];
                      return _SearchResultCard(
                        student: student,
                        index: index,
                        onTap: () {
                          // Navigate to department screen
                          context.go(
                            RouteNames.departmentRoute(student.departmentId),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

/// Empty state widget
class _EmptyState extends StatelessWidget {
  final String query;
  final int minChars;

  const _EmptyState({
    required this.query,
    required this.minChars,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    String message;
    IconData icon;

    if (query.isEmpty) {
      message = 'Start typing to search for graduates';
      icon = Icons.search;
    } else if (query.length < minChars) {
      message = 'Type at least $minChars characters';
      icon = Icons.keyboard;
    } else {
      message = 'No graduates found matching "$query"';
      icon = Icons.search_off;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }
}

/// Search result card
class _SearchResultCard extends StatelessWidget {
  final Student student;
  final int index;
  final VoidCallback onTap;

  const _SearchResultCard({
    required this.student,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final department = DataRepository.getDepartmentById(student.departmentId);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
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
                    const SizedBox(height: 4),

                    // Department
                    if (department != null)
                      Text(
                        department.name,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),

                    const SizedBox(height: 4),

                    // Email or Phone
                    if (student.email != null && student.email!.isNotEmpty)
                      Text(
                        student.email!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    else if (student.phone != null && student.phone!.isNotEmpty)
                      Text(
                        student.phone!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                  ],
                ),
              ),

              // Arrow Icon
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(delay: (50 * index).ms, duration: 400.ms)
        .slideX(begin: -0.1, delay: (50 * index).ms);
  }
}
