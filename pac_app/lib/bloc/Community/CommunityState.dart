import 'package:equatable/equatable.dart';
import '../../fixed/PostListItem.dart';
abstract class CommunityState extends Equatable{
  CommunityState([List props = const []]) : super(props);
}
class CommunityUninitialized extends CommunityState{
  @override
  String toString() => 'CommunityUninitialized';
}
class CommunityError extends CommunityState{
  @override
  String toString() => 'CommunityError';
}
class CommunityLoaded extends CommunityState{
  final List<PostListItem> communities;

  CommunityLoaded({
    this.communities,}): super ([communities]);

  CommunityLoaded copyWith({
    List<PostListItem> communities,
    })=> CommunityLoaded(communities: communities?? this.communities);

  @override
  String toString() => 'Community Loads $communities.itemTitle';
}
