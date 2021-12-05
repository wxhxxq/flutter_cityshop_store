import 'package:flutter/material.dart';
import 'package:flutter_cityshop_store/model/advert.dart';
import 'package:flutter_cityshop_store/utils/themecolors.dart';
import 'package:flutter_cityshop_store/utils/utils.dart';
import 'package:flutter_cityshop_store/widget/onTop_botton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeBanner extends StatelessWidget {
  final List bannner;
  final bool jump;
  HomeBanner({
    @required this.bannner,
    this.jump = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(465),
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.symmetric( horizontal: ScreenUtil().setWidth(15),vertical: ScreenUtil().setWidth(20)),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            Advert model = bannner[index];
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: (model.bannerImgUrl != null)
                          ? NetworkImage(model?.bannerImgUrl)
                          : ExactAssetImage(Utils.getImgPath('placeholderImg')),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  _titleWidget(model),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                    child: Text(model?.longContent ?? "",
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          color: ThemeColors.titleColor,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15),vertical: ScreenUtil().setWidth(20)),
                    child: Text(
                      computeLongContent(model?.loanLower, model?.loanUpper),
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(60),
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  OnTopBotton(
                    callBack: () {},
                    title: "一键申请",
                    widget: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(40), ),
                      height: ScreenUtil().setWidth(88),
                      decoration: BoxDecoration(
                          color: ThemeColors.homemainColor,
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setWidth(44))),
                      child: Text("一键申请",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(32),
                            color: ThemeColors.appliedColor, //35,17,0
                          )),
                    ),
                  )
                ],
              ),
            );
          },

          itemCount: bannner?.length ?? 0,
          scrollDirection: Axis.horizontal,
          autoplay: false,
          onIndexChanged: (index) {
            //  print('onIndexChanged$index个');
          },
          scale: 0.95, // 两张图片之间的间隔
          onTap: (index) {
            print('点击了第$index个');
          },
          // 展示窗口模式viewportFraction: 0.8,
        ));
  }

  computeLongContent(var minimum, var maximum) {
    String min;
    if (minimum != null && minimum > 10000) {
      min = (minimum / 10000).truncate().toString() + "万";
    } else {
      min = minimum?.toString() ?? "0";
    }
    String max;
    if (maximum != null && maximum > 10000) {
      max = (maximum / 10000).truncate().toString() + "万";
    } else {
      max = maximum?.toString() ?? "0";
    }
    return (min + "~" + max);
  }

  Widget _titleWidget(Advert model) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setHeight(50),
            decoration: BoxDecoration(
                color: ThemeColors.mainBgColor,
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))),
            child: (model?.productUrl != null)
                ? FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: model.productUrl,
                    fit: BoxFit.fill)
                : Container(),
          ),
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(20)),
            child: Text(
              model?.productName ?? "",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(38),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
                color: ThemeColors.homeColor,
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))),
            child: Text(
              model?.longContent ?? "新口子",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(23),
                  color: ThemeColors.subtitlesColor),
            ),
          ),
        ],
      ),
    );
  }
}
