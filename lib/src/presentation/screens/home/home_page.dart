import 'package:auto_route/auto_route.dart';
import 'package:blott_mobile_assesment/src/core/constants/app_spacing.dart';
import 'package:blott_mobile_assesment/src/core/constants/styles.dart';
import 'package:blott_mobile_assesment/src/core/enums/state_enum.dart';
import 'package:blott_mobile_assesment/src/core/extension/extension.dart';
import 'package:blott_mobile_assesment/src/domain/providers/providers.dart';
import 'package:blott_mobile_assesment/src/presentation/screens/home/widget/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewmodelProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(homeViewmodelProvider.notifier).getNews();
      });
      return null;
    }, const []);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 181.height,
              color: const Color(0xFF05021B),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(44),
                  Text(
                    'Hey ${state.firstName}',
                    style: Styles.hXl(
                      color: const Color(0xFFFFFFFF),
                    ).copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 32.fontSize,
                    ),
                  ),
                  verticalSpace(34),
                  if (state.loadingState == LoadingState.loading)
                    const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        ],
                      ),
                    )
                  else if (state.loadingState == LoadingState.error)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.errorMesssage ??
                              'Something went wrong. Please try again later.',
                          style: Styles.rubikText(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  else
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ...state.news.map(
                              (e) {
                                final date =
                                    DateTime.fromMillisecondsSinceEpoch(
                                        ((e.datetime?.toInt() ?? 0) * 1000));
                                return NewsCard(
                                  author: e.source ?? '',
                                  date: DateFormat('dd MMMM yyyy').format(date),
                                  image: e.image ?? '',
                                  description: e.headline ?? '',
                                  url: e.url ?? '',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
