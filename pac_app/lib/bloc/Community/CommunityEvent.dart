import 'package:equatable/equatable.dart';
abstract class CommunityEvent extends Equatable{}
class Fetch extends CommunityEvent{
  @override
  String toString() => 'Fetch';
}