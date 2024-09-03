import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CustomPagingController<ValueType> extends PagingController<int, ValueType> {
  final int pageCount;

  CustomPagingController({
    required PageRequestListener<int> onPageRequest,
    super.firstPageKey = 1,
    super.invisibleItemsThreshold,
    required this.pageCount,
  }) {
    addPageRequestListener(onPageRequest);
  }

  void addPage(List<ValueType> items) {
    if (items.length < pageCount) {
      appendLastPage(items);
    } else {
      appendPage(items, nextPageKey! + 1);
    }
  }

  void insert(ValueType item, {int index = 0}) {
    itemList?.insert(index, item);
    notifyListeners();
  }

  void removeItem(bool Function(ValueType item) test) {
    itemList = itemList?..removeWhere(test);
    notifyListeners();
  }

  void replaceItem(bool Function(ValueType item) oldItem, ValueType newItem) {
    final index = itemList?.indexWhere(oldItem);
    if (index != null) {
      itemList = itemList?..removeAt(index);
      itemList?.insert(index, newItem);
      notifyListeners();
    }
  }

  void reset([dynamic key]) {
    value = P<int, ValueType>(
      nextPageKey: firstPageKey,
      error: null,
      itemList: null,
      key: key ?? '',
    );
  }
}

class P<PageKeyType, ItemType> extends PagingState<PageKeyType, ItemType> with EquatableMixin {
  final dynamic key;

  const P({
    super.nextPageKey,
    super.error,
    super.itemList,
    this.key,
  });

  @override
  List<Object?> get props => [
        nextPageKey,
        Future.error,
        itemList,
        key,
      ];
}
