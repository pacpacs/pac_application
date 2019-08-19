import 'package:equatable/equatable.dart';
import '../../fixed/postListItem.dart';
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
  final List<PostListItem> communitys;

  CommunityLoaded({
    this.communitys,}): super ([communitys]);

  CommunityLoaded copyWith({
    List<PostListItem> communitys,
    })=> CommunityLoaded(communitys: communitys?? this.communitys);

  @override
  String toString() => 'Community Loads $communitys.itemTitle';
}
