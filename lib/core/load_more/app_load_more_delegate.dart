import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class AppLoadMoreDelegate extends LoadMoreDelegate {
  const AppLoadMoreDelegate([this.indicatorColor]);

  final Color? indicatorColor;

  @override
  double widgetHeight(LoadMoreStatus status) {
    if (status == LoadMoreStatus.loading) {
      return 72;
    }
    return 12;
  }

  @override
  Widget buildChild(LoadMoreStatus status,
      {LoadMoreTextBuilder builder = DefaultLoadMoreTextBuilder.english}) {
    if (status == LoadMoreStatus.loading) {
      return Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: indicatorColor,
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
