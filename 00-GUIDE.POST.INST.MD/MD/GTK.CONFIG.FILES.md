### GTK CFG FILES


**~/.config/gtkrc-2.0**
additional line:
```
gtk-alternative-button-order = 1
```
other code same as:
**~/.config/gtkrc**
```
# created by KDE Plasma, pt. sie 16 12:46:16 2019
#
# If you do not want Plasma to override your GTK settings, select
# Colors in the System Settings and disable the checkbox
# "Apply colors to non-Qt applications"
#
#
style "default"
{
  bg[NORMAL] = { 0.157, 0.157, 0.157 }
  bg[SELECTED] = { 0.231, 0.314, 0.455 }
  bg[INSENSITIVE] = { 0.157, 0.157, 0.157 }
  bg[ACTIVE] = { 0.137, 0.137, 0.137 }
  bg[PRELIGHT] = { 0.157, 0.157, 0.157 }

  base[NORMAL] = { 0.188, 0.188, 0.188 }
  base[SELECTED] = { 0.231, 0.314, 0.455 }
  base[INSENSITIVE] = { 0.157, 0.157, 0.157 }
  base[ACTIVE] = { 0.231, 0.314, 0.455 }
  base[PRELIGHT] = { 0.231, 0.314, 0.455 }

  text[NORMAL] = { 0.875, 0.875, 0.875 }
  text[SELECTED] = { 1.000, 1.000, 1.000 }
  text[INSENSITIVE] = { 0.137, 0.137, 0.137 }
  text[ACTIVE] = { 1.000, 1.000, 1.000 }
  text[PRELIGHT] = { 1.000, 1.000, 1.000 }

  fg[NORMAL] = { 0.875, 0.875, 0.875 }
  fg[SELECTED] = { 1.000, 1.000, 1.000 }
  fg[INSENSITIVE] = { 0.137, 0.137, 0.137 }
  fg[ACTIVE] = { 0.875, 0.875, 0.875 }
  fg[PRELIGHT] = { 0.875, 0.875, 0.875 }
}

class "*" style "default"

style "ToolTip"
{
  bg[NORMAL] = { 0.157, 0.157, 0.157 }
  base[NORMAL] = { 0.157, 0.157, 0.157 }
  text[NORMAL] = { 0.875, 0.875, 0.875 }
  fg[NORMAL] = { 0.875, 0.875, 0.875 }
}

widget "gtk-tooltip" style "ToolTip"
widget "gtk-tooltips" style "ToolTip"
widget "gtk-tooltip*" style "ToolTip"

style "MenuItem"
{
  bg[PRELIGHT] = { 0.231, 0.314, 0.455 }
  fg[PRELIGHT] = { 1.000, 1.000, 1.000 }
}

class "*MenuItem" style "MenuItem"
```

**~/.config/gtk-2.0/gtkfilechooser.ini**
```
[Filechooser Settings]
LocationMode=path-bar
ShowHidden=false
ShowSizeColumn=true
GeometryX=504
GeometryY=199
GeometryWidth=912
GeometryHeight=675
SortColumn=name
SortOrder=ascending
StartupMode=recent
gtk-recent-files-enabled=false
```

**~/.config/gtk-3.0/colors.css**
```
@define-color borders_breeze #4a4a4a;
@define-color content_view_bg_breeze #242424;
@define-color error_color_backdrop_breeze #da4453;
@define-color error_color_breeze #da4453;
@define-color error_color_insensitive_backdrop_breeze #5f2d32;
@define-color error_color_insensitive_breeze #5f2d32;
@define-color insensitive_base_color_breeze #222222;
@define-color insensitive_base_fg_color_breeze #616161;
@define-color insensitive_bg_color_breeze #171717;
@define-color insensitive_borders_breeze #272727;
@define-color insensitive_fg_color_breeze #595959;
@define-color insensitive_selected_bg_color_breeze #171717;
@define-color insensitive_selected_fg_color_breeze #595959;
@define-color insensitive_unfocused_bg_color_breeze #171717;
@define-color insensitive_unfocused_fg_color_breeze #595959;
@define-color insensitive_unfocused_selected_bg_color_breeze #171717;
@define-color insensitive_unfocused_selected_fg_color_breeze #595959;
@define-color link_color_breeze #1a73e8;
@define-color link_visited_color_breeze #ad65af;
@define-color success_color_backdrop_breeze #01a299;
@define-color success_color_breeze #01a299;
@define-color success_color_insensitive_backdrop_breeze #174c49;
@define-color success_color_insensitive_breeze #174c49;
@define-color theme_base_color_breeze #242424;
@define-color theme_bg_color_breeze #181818;
@define-color theme_button_background_backdrop_breeze #343434;
@define-color theme_button_background_backdrop_insensitive_breeze #323232;
@define-color theme_button_background_insensitive_breeze #323232;
@define-color theme_button_background_normal_breeze #343434;
@define-color theme_button_decoration_focus_backdrop_breeze #8ab4f8;
@define-color theme_button_decoration_focus_backdrop_insensitive_breeze #4e5c73;
@define-color theme_button_decoration_focus_breeze #8ab4f8;
@define-color theme_button_decoration_focus_insensitive_breeze #4e5c73;
@define-color theme_button_decoration_hover_backdrop_breeze #495363;
@define-color theme_button_decoration_hover_backdrop_insensitive_breeze #393c41;
@define-color theme_button_decoration_hover_breeze #495363;
@define-color theme_button_decoration_hover_insensitive_breeze #393c41;
@define-color theme_button_foreground_active_backdrop_breeze #dfdfdf;
@define-color theme_button_foreground_active_backdrop_insensitive_breeze #595959;
@define-color theme_button_foreground_active_breeze #ffffff;
@define-color theme_button_foreground_active_insensitive_breeze #595959;
@define-color theme_button_foreground_backdrop_breeze #ffffff;
@define-color theme_button_foreground_backdrop_insensitive_breeze #757575;
@define-color theme_button_foreground_insensitive_breeze #757575;
@define-color theme_button_foreground_normal_breeze #ffffff;
@define-color theme_fg_color_breeze #dfdfdf;
@define-color theme_hovering_selected_bg_color_breeze #495363;
@define-color theme_selected_bg_color_breeze #8ab4f8;
@define-color theme_selected_fg_color_breeze #ffffff;
@define-color theme_text_color_breeze #dfdfdf;
@define-color theme_titlebar_background_backdrop_breeze #242424;
@define-color theme_titlebar_background_breeze #2d2d2d;
@define-color theme_titlebar_background_light_breeze #181818;
@define-color theme_titlebar_foreground_backdrop_breeze #8b8b8b;
@define-color theme_titlebar_foreground_breeze #dfdfdf;
@define-color theme_titlebar_foreground_insensitive_backdrop_breeze #8b8b8b;
@define-color theme_titlebar_foreground_insensitive_breeze #8b8b8b;
@define-color theme_unfocused_base_color_breeze #242424;
@define-color theme_unfocused_bg_color_breeze #181818;
@define-color theme_unfocused_fg_color_breeze #dfdfdf;
@define-color theme_unfocused_selected_bg_color_alt_breeze #303d52;
@define-color theme_unfocused_selected_bg_color_breeze #303d52;
@define-color theme_unfocused_selected_fg_color_breeze #dfdfdf;
@define-color theme_unfocused_text_color_breeze #dfdfdf;
@define-color theme_unfocused_view_bg_color_breeze #222222;
@define-color theme_unfocused_view_text_color_breeze #616161;
@define-color theme_view_active_decoration_color_breeze #495363;
@define-color theme_view_hover_decoration_color_breeze #495363;
@define-color tooltip_background_breeze #616161;
@define-color tooltip_border_breeze #818181;
@define-color tooltip_text_breeze #dfdfdf;
@define-color unfocused_borders_breeze #4a4a4a;
@define-color unfocused_insensitive_borders_breeze #272727;
@define-color warning_color_backdrop_breeze #ff6d00;
@define-color warning_color_breeze #ff6d00;
@define-color warning_color_insensitive_backdrop_breeze #6b3b16;
@define-color warning_color_insensitive_breeze #6b3b16;
```

**~/.config/gtk-3.0/gtk.css**
```
.window-frame {
  box-shadow: none;
  margin: 0;
}
@import 'colors.css';
@import 'window_decorations.css';
```

**~/.config/gtk-3.0/settings.ini**
``` 
[Settings]
gtk-application-prefer-dark-theme=true
gtk-button-images=true
gtk-cursor-theme-name=volantes_cursors
gtk-cursor-theme-size=32
gtk-decoration-layout=icon:minimize,maximize,close
gtk-enable-animations=true
gtk-fallback-icon-theme=Adwaita
gtk-font-name=Segoe UI,  9
gtk-icon-theme-name=Papirus-Dark
gtk-menu-images=true
gtk-modules=colorreload-gtk-module
gtk-primary-button-warps-slider=false
gtk-recent-files-enabled=false
gtk-theme-name=Materia-dark
gtk-toolbar-style=3
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
```