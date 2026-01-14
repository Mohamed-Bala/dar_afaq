import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class NewsArticleList extends StatelessWidget {
  const NewsArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.newsAndArticles.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ],
          ),
          verticalSpace(10),
          buildArticleItem(
            context,
            title:
                '3 أعضاء في المجلس البلدي يقترحون: ترخيص سراديب للمؤسسات الحكومية بمناطق السكن الخاص',

            articleUrl:
                'https://www.alqabas.com/article/5957092-3-%D8%A3%D8%B9%D8%B6%D8%A7%D8%A1-%D9%81%D9%8A-%D8%A7%D9%84%D9%85%D8%AC%D9%84%D8%B3-%D8%A7%D9%84%D8%A8%D9%84%D8%AF%D9%8A-%D9%8A%D9%82%D8%AA%D8%B1%D8%AD%D9%88%D9%86-%D8%AA%D8%B1%D8%AE%D9%8A%D8%B5-%D8%B3%D8%B1%D8%A7%D8%AF%D9%8A%D8%A8-%D9%84%D9%84%D9%85%D8%A4%D8%B3%D8%B3%D8%A7%D8%AA-%D8%A7%D9%84%D8%AD%D9%83%D9%88%D9%85%D9%8A%D8%A9-%D8%A8%D9%85%D9%86%D8%A7%D8%B7%D9%82-%D8%A7%D9%84%D8%B3%D9%83%D9%86-%D8%A7%D9%84%D8%AE%D8%A7%D8%B5/', // رابط المقال
          ),
          buildArticleItem(
            context,
            title: 'قوقل تطلق اطار عمل لصناعة تطبيقات الموبايل',
            articleUrl: 'https://flutter.dev',
          ),
          buildArticleItem(
            context,
            title:
                'د. شهد الشمالي.. أول عربية وكويتية تشارك في وضع دليل علاجي عالمي',

            articleUrl:
                'https://www.alqabas.com/article/5956612-%D8%AF-%D8%B4%D9%87%D8%AF-%D8%A7%D9%84%D8%B4%D9%85%D8%A7%D9%84%D9%8A-%D8%A3%D9%88%D9%84-%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9-%D9%88%D9%83%D9%88%D9%8A%D8%AA%D9%8A%D8%A9-%D8%AA%D8%B4%D8%A7%D8%B1%D9%83-%D9%81%D9%8A-%D9%88%D8%B6%D8%B9-%D8%AF%D9%84%D9%8A%D9%84-%D8%B9%D9%84%D8%A7%D8%AC%D9%8A-%D8%B9%D8%A7%D9%84%D9%85%D9%8A/', // رابط المقال
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}

class ArticleWebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const ArticleWebViewScreen(
      {super.key, required this.url, required this.title});

  @override
  State<ArticleWebViewScreen> createState() => _ArticleWebViewScreenState();
}

class _ArticleWebViewScreenState extends State<ArticleWebViewScreen> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) => setState(() => isLoading = true),
          onPageFinished: (url) => setState(() => isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (isLoading) const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

Widget buildArticleItem(BuildContext context,
    {required String title, required String articleUrl}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleWebViewScreen(
            url: articleUrl,
            title: title,
          ),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 10.w),
          // المحتوى
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: ColorManager.primary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(15),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
