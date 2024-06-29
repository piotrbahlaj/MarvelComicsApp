import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_comics_app/core/text_styles.dart';
import 'package:marvel_comics_app/core/theme.dart';
import 'package:marvel_comics_app/features/comic_details/presentation/cubit/expandable_tile_cubit.dart';

class ExpandableTile extends StatelessWidget {
  const ExpandableTile({
    Key? key,
    required this.title,
    required this.creators,
    required this.description,
  }) : super(key: key);

  final String title;
  final String creators;
  final String description;

  @override
  Widget build(BuildContext context) {
    final double minHeight = MediaQuery.of(context).size.height * 0.2;
    final double maxHeight = MediaQuery.of(context).size.height * 0.6;
    final cubit = context.read<ExpandableTileCubit>();
    cubit.reset();

    return BlocBuilder<ExpandableTileCubit, bool>(
      builder: (context, isExpanded) {
        return GestureDetector(
          onTap: () => cubit.toggleExpansion(),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isExpanded ? maxHeight : minHeight,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: MarvelColors.expandableContainer,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Text(
                        title,
                        style: TextStyles.comicDetailsTitle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        creators,
                        style: TextStyles.comicDetailsCreator,
                      ),
                    ),
                    if (isExpanded)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FutureBuilder(
                          future:
                              Future.delayed(const Duration(milliseconds: 250)),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox.shrink();
                            } else {
                              return Text(
                                description,
                                maxLines: 17,
                                style: TextStyles.comicDetailsDescription,
                              );
                            }
                          },
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isExpanded
                            ? MarvelColors.expandableContainer
                            : MarvelColors.expandableContainer2,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.008,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
