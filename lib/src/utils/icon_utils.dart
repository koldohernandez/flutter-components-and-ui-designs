import 'package:flutter/material.dart';


final Map<String, IconData> _icons = {
  'notifications_none'          : Icons.notifications_none, 
  'accessibility'               : Icons.accessibility,
  'person_outline'              : Icons.person_outline,
  'folder_open'                 : Icons.folder_open,
  'burst_mode'                  : Icons.burst_mode,
  'donut_large'                 : Icons.donut_large,
  'text_fields'                 : Icons.text_fields,
  'image_aspect_ratio'          : Icons.image_aspect_ratio,
  'tune'                        : Icons.tune,
  'list'                        : Icons.list,
  'drawer'                      : Icons.exit_to_app,
  'custom-animated-drawer'      : Icons.assignment,
  'custom-rotation-drawer'      : Icons.rotate_right,
  'custom-bottom-bar'           : Icons.more_horiz,
  'wrap-widget'                 : Icons.border_outer,
  'radio-widget'                : Icons.radio_button_checked,
  'background-gradient'         : Icons.image_aspect_ratio,
  'custom-app-bar'              : Icons.menu
};


Icon getIcon(String name)
{
  return Icon( _icons[name] , color: Colors.blue);
}

