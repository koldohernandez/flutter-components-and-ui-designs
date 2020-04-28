
import 'package:flutter/material.dart';

import 'package:components/src/pages/home_page.dart';

import 'package:components/src/pages/basic_widgets/inputs_page.dart';
import 'package:components/src/pages/basic_widgets/slider_page.dart';
import 'package:components/src/pages/basic_widgets/list_page.dart';
import 'package:components/src/pages/basic_widgets/alert_page.dart';

import 'package:components/src/pages/user_profile/basic_profile_page.dart';

import 'package:components/src/pages/disenio/basic_card_page.dart';

import 'package:components/src/pages/animations/animation_page.dart';

import 'package:components/src/pages/drawers/basic_drawer_page.dart';
import 'package:components/src/pages/drawers/basic_drawer_navigateTo_page1.dart';
import 'package:components/src/pages/drawers/basic_drawer_navigateTo_page2.dart';
import 'package:components/src/pages/drawers/custom_animated_drawer.dart';
import 'package:components/src/pages/drawers/custom_3d_rotation_drawer.dart';

import 'package:components/src/pages/custom_bottom_bar/custom_bottom_bar.dart';

import 'package:components/src/pages/advanced_widgets/wrap_widget.dart';

import 'package:components/src/pages/basic_widgets/radio_widget.dart';

import 'package:components/src/pages/disenio/background_gradient.dart';

import 'package:components/src/pages/app_bar/custom_app_bar.dart';


Map<String, WidgetBuilder> getAppRoutes() {

  return <String, WidgetBuilder> {
    '/'                         : (BuildContext context) => HomePage(title: 'Components Demo App'),
    'alert'                     : (BuildContext context) => AlertPage(title: 'Alert Page'),
    'profile'                   : (BuildContext context) => ProfilePage(title: 'Profile & Avatar Page'),
    'card'                      : (BuildContext context) => BasicCardPage(title: 'Card Page'),
    'animations'                : (BuildContext context) => AnimationPage(title: 'Animation Pages'),
    'inputs'                    : (BuildContext context) => InputsPage(title: 'Input text examples'),
    'sliders'                   : (BuildContext context) => SliderPage(title: 'Sliders example page'),
    'list'                      : (BuildContext context) => ListPage(title: 'ListView builder & Scroll'),
    'drawer'                    : (BuildContext context) => BasicDrawer(title: 'Drawer Page'),
    'drawer-1'                  : (BuildContext context) => BasicDrawerPage1(title: 'Drawer Page detail one'),
    'drawer-2'                  : (BuildContext context) => BasicDrawerPage2(title: 'Drawer Page detail two'),
    'custom-animated-drawer'    : (BuildContext context) => CustomAnimatedDrawer(title: 'Custom Animated Drawer Page'),
    'custom-rotation-drawer'    : (BuildContext context) => CustomRotationDrawer(title: 'Custom Rotation Drawer Page'),
    'custom-bottom-bar'         : (BuildContext context) => CustomBottonBar(),
    'wrap-widget'               : (BuildContext context) => WrapWidgetDemo(),
    'radio-widget'              : (BuildContext context) => RadioWidgetDemo(),
    'background-gradient'       : (BuildContext context) => BackgroundGradient(),
    'custom-app-bar'            : (BuildContext context) => CustomAppBar(title: 'Custom App Bar'),   
  };

}