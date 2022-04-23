import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import 'package:flutter_cityshop_store/pages/mine/comoment/mine_banner.dart';
import 'package:flutter_cityshop_store/pages/mine/comoment/mine_head_ground.dart';
import 'package:flutter_cityshop_store/provide/user_provider.dart';
import 'package:flutter_cityshop_store/router/navigator_utils.dart';
import 'package:flutter_cityshop_store/utils/themecolors.dart';
import 'package:flutter_cityshop_store/widget/alert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MinePages extends StatefulWidget {
  MinePages({Key key}) : super(key: key);

  @override
  _MinePagesState createState() => _MinePagesState();
}

class _MinePagesState extends State<MinePages> {
  @override
  Widget build(BuildContext context) {
    bool isReal = Provider.of<UserProvider>(context).isReal;
    bool isVIP = Provider.of<UserProvider>(context).isVIP;
    return Scaffold(
      backgroundColor: ThemeColors.mainBgColor,
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          MineHeadGround(
            callBack: () {
              if (isReal) {
                if (isVIP) {
                  NavigatorUtils.gotoAssociatorPages(context);
                } else {
                  print("点击跳转vip购买---");
                  NavigatorUtils.gotoVipPages(context);
                }
              } else {
                Alert.showDialogSheet(context: context);
              }
            },
            onPressed: () {
              NavigatorUtils.gotoUserSystem(context);
            },
          ),
          // MineServe(onPressed: (result) {
          //   switch (result) {
          //     case 4:
          //       {
          //         NavigatorUtils.gotoUserSystem(context);
          //       }
          //       break;
          //     default:
          //   }
          // }),
          SizedBox(
            height: ScreenUtil().setWidth(40),
          ),
          MineBanner(),
        ]),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
