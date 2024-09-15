import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

typedef DefaultItemBuilder<T> = Widget Function(BuildContext context, T entry, int index);
typedef DefaultErrorHandler = String Function(dynamic error);

class DefaultPagedListView<T> extends StatelessWidget {
  final PagingController<int, T> loadController;
  final DefaultItemBuilder<T> itemBuilder;
  final DefaultErrorHandler? errorHandler;
  final ScrollController? scrollController;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final bool showRipple;
  final EdgeInsets padding;
  final bool pullToRefresh;
  final String? noItemMessage;

  const DefaultPagedListView({
    super.key,
    required this.loadController,
    required this.itemBuilder,
    this.scrollController,
    this.errorHandler,
    this.physics,
    this.shrinkWrap = false,
    this.showRipple = false,
    this.pullToRefresh = false,
    this.padding = EdgeInsets.zero,
    this.noItemMessage,
  });

  @override
  Widget build(BuildContext context) {
    final list = PagedListView<int, T>(
      pagingController: loadController,
      scrollController: scrollController,
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      builderDelegate: PagedChildBuilderDelegate<T>(
        noItemsFoundIndicatorBuilder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              noItemMessage ?? "موردی وجود ندارد",
            ),
          ],
        ),
        firstPageProgressIndicatorBuilder: (context) => ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 150),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        ),
        newPageProgressIndicatorBuilder: (context) => ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 150),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
        ),
        firstPageErrorIndicatorBuilder: (context) => ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 150),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(loadController.error ?? 'متاسفانه مشکلی به وجود آمده لطفا مجدد تلاش کنید'),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => loadController.retryLastFailedRequest(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "تلاش مجدد",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        newPageErrorIndicatorBuilder: (context) => ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 150),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(loadController.error ?? 'متاسفانه مشکلی به وجود آمده لطفا مجدد تلاش کنید'),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => loadController.retryLastFailedRequest(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "تلاش مجدد",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        itemBuilder: itemBuilder,
      ),
    );
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: showRipple),
      child: pullToRefresh
          ? RefreshIndicator(
              onRefresh: () => Future.sync(loadController.refresh),
              child: list,
            )
          : list,
    );
  }
}
