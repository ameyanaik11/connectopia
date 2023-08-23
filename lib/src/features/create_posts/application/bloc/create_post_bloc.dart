import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/data/errors_repo.dart';
import '../../data/create_posts_repo.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  XFile? pickedFile;
  List<XFile?> pickedFiles = [];
  String? userLocation;
  bool enableLocation = false;
  bool enableStory = false;
  ErrorHandlerRepo handleError = ErrorHandlerRepo();

  CreatePostBloc() : super(CreatePostInitial()) {
    on<GalleryButtonClickedEvent>((event, emit) async {
      pickedFiles = [];
      pickedFile = null;
      final picker = ImagePicker();
      pickedFiles = await picker.pickMultiImage();
      if (pickedFiles.isEmpty) return;
      emit(PickedImageFromGallery(pickedFile: pickedFiles));
    });
    on<CameraButtonClickedEvent>((event, emit) async {
      pickedFiles = [];
      pickedFile = null;
      final picker = ImagePicker();
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile == null) return;
      emit(CapturedPhoto(capturedPhoto: pickedFile));
    });

    on<LocationButtonClickedEvent>((event, emit) async {
      CreatePostRepo repo = CreatePostRepo();
      enableLocation = !enableLocation;
      emit(ToggleLocation(enableLocation));
      try {
        final location = await repo.determineLocation();
        userLocation = '${location.locality}, ${location.country}';
      } catch (err) {
        String errorMsg = handleError.handleError(err);
        emit(PostCreationFailure(errorMsg));
      }
    });

    on<ToggleStoryButtonClickedEvent>((event, emit) async {
      enableStory = !enableStory;
      emit(ToggleStory(enableStory));
    });

    on<CreatePostButtonClickedEvent>((event, emit) async {
      emit(CreatingPost());
      CreatePostRepo repo = CreatePostRepo();
      if (!event.enableLocation) userLocation = null;
      if (pickedFile != null) pickedFiles.add(pickedFile!);

      try {
        await repo.createPost(
            event.caption, userLocation, event.toggleStory, pickedFiles);
        emit(CreatedPost());
        pickedFile = null;
        pickedFiles = [];
        userLocation = null;
      } catch (err) {
        String errorMsg = handleError.handleError(err);
        emit(PostCreationFailure(errorMsg));
        pickedFile = null;
        pickedFiles = [];
        userLocation = null;
      }
    });

    on<CaptionChangedEvent>((event, emit) {
      if (event.caption.isNotEmpty)
        emit(ValidCaptionState());
      else
        emit(CreatePostInitial());
    });
  }
}
