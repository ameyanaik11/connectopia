import 'package:bloc/bloc.dart';
import 'package:connectopia/src/features/profile/domain/models/post.dart';
import 'package:connectopia/src/features/profile/domain/models/user.dart';
import 'package:connectopia/src/features/search_users/data/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:pocketbase/pocketbase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepo _searchRepo = SearchRepo();
  bool hasFoundMedia = false;
  bool hasFoundUsers = false;

  SearchBloc() : super(SearchInitial()) {
    on<SearchUsersEvent>((event, emit) async {
      try {
        if (event.query.isEmpty) return emit(SearchInitial());
        emit(SearchLoading());
        ResultList<RecordModel> usersRecord =
            await _searchRepo.searchUsers(event.query);
        List<User> users =
            usersRecord.items.map((e) => User.fromRecord(e)).toList();
        final postsRecord = await _searchRepo.searchPosts(event.query);
        List<Post> posts =
            postsRecord.items.map((e) => Post.fromRecord(e)).toList();
        if (posts.isNotEmpty)
          hasFoundMedia = true;
        else
          hasFoundMedia = false;

        if (users.isNotEmpty)
          hasFoundUsers = true;
        else
          hasFoundUsers = false;

        emit(SearchLoadedState(users, posts));
        users = [];
        posts = [];
      } catch (e) {
        emit(SearchErrorState(e.toString()));
      }
    });
  }
}