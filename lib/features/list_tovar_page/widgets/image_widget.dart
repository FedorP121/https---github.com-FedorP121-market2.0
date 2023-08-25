import 'package:coin/features/list_tovar_page/bloc/export_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageWidget extends StatelessWidget {
  final List<String> listImageUrl;
  const ImageWidget({
    Key? key,
    required this.listImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageCounterBloc = ImageCounterBloc();
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: _ListImageWidget(
              listImageUrl: listImageUrl,
              imageCounterBloc: imageCounterBloc,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {},
            child: const SizedBox(
              width: double.infinity,
              height: 225,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () => imageCounterBloc
                  .add(BackImageEvent(listImageUrl: listImageUrl)),
              child: const Icon(
                size: 50,
                Icons.arrow_left,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () => imageCounterBloc
                  .add(NextImageEvent(listImageUrl: listImageUrl)),
              child: const Icon(
                size: 50,
                Icons.arrow_right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListImageWidget extends StatelessWidget {
  final List<String> listImageUrl;
  final ImageCounterBloc imageCounterBloc;
  const _ListImageWidget({
    Key? key,
    required this.listImageUrl,
    required this.imageCounterBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCounterBloc, ImageCounterState>(
      bloc: imageCounterBloc,
      builder: (context, state) {
        if (state is ImageIndexState) {
          final String image = listImageUrl[state.index];
          return Center(child: Image(image: NetworkImage(image)));
        }
        if (state is ImageIndexErrorState) {
          state.error;
          return Center(child: Text('Произошла ошибка ${state.error}'));
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
