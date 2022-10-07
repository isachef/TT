

abstract class PhotoEvent {}

class GetPhotoEvent extends PhotoEvent{
  final int id;

  GetPhotoEvent(this.id);
}