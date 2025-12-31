import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_constants.dart';
import '../../data/models/student.dart';
import '../../data/repositories/data_repository.dart';

/// State class for search results
class SearchState {
  final String query;
  final List<Student> results;
  final bool isSearching;

  const SearchState({
    this.query = '',
    this.results = const [],
    this.isSearching = false,
  });

  SearchState copyWith({
    String? query,
    List<Student>? results,
    bool? isSearching,
  }) {
    return SearchState(
      query: query ?? this.query,
      results: results ?? this.results,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}

/// Search state notifier
class SearchNotifier extends Notifier<SearchState> {
  @override
  SearchState build() => const SearchState();

  /// Perform search across all students
  void search(String query) {
    // Update query
    state = state.copyWith(query: query, isSearching: true);

    // Check minimum characters
    if (query.trim().length < AppConstants.minSearchCharacters) {
      state = state.copyWith(results: [], isSearching: false);
      return;
    }

    // Search all students
    final results = DataRepository.searchStudents(query.trim());

    state = state.copyWith(results: results, isSearching: false);
  }

  /// Clear search
  void clear() {
    state = const SearchState();
  }
}

/// Provider for search state
final searchProvider = NotifierProvider<SearchNotifier, SearchState>(() {
  return SearchNotifier();
});
