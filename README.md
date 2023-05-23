
![](https://badgen.net/badge/shintolabs/development/orange)
# softui


R package with "softui" design. A wrapper around CSS/HTML/JS from (Creative Tim)[https://www.creative-tim.com/product/soft-ui-dashboard] 


## Installation

```
remotes::install_github("moturoa/shintoshiny")
remotes::install_github("moturoa/softui")
```

## Contents

The main contribution of the package is a framework for a dashboard page much like `shinydashboard`, but with SsoftUI design, based on Bootstrap 5.1.

See `?dashboard_page` for a simple example to get started.

- Dashboard template
- Click system : utils for making links that open another page, or open a page with `softui::go_to_page`
- Application utilities : logout menu, app info menu, loading screen, disconnect message (imported from `shintoshiny`)
- Application NEWS popup, utilities to read and filter NEWS.md file
- Enhanced `box` function (a "card" in Bootstrap) : simple collapse/expand functions, layout options, `sub_box` for boxes for placement inside `box`es, flexible tab boxes and tabset panels (`tab_box`, `tabset_panel`)
- Dutch version interface to `DT::datatable` (`datatafel`) and `reactable::reactable` (`reactafel`).
- Wrappers around common inputs with enterprise settings, `select_input`, `virtual_select_input`, `modal`
- SoftUI elements: `value_box`, `value_icon_list`, `timeline_from_data`, `icon_action_button`, `badge`, etc.



## Known issues

Some R packages with shiny widgets (such as `shinyWidgets`, `shinyBS`) may not play nice with Bootstrap 5.1. For example, `shinyWidgets::pickerInput` gave (gives?) problems, and so does `shinyWidgets::dropdownButton`.


## Contact

Remko Duursma
