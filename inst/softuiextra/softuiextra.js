


// Simpler alternative to updateTabItems
selectMenuItem = function(data){

  getTabName = function(anchor) {
    return anchor.attr('data-target') || anchor.text();
  }
  
  let anchors = $("#sidenav-collapse-main")
        .find("li:not(.treeview)")
        .children("a");
        
  let value = data.selected;
  
  anchors.each(function() {
      let this_name = getTabName($(this));
      if (this_name === value) {
        this.click();
      } 
  });
  
};

Shiny.addCustomMessageHandler("selectMenuItem", selectMenuItem);



// Simpler alternative to updateTabsetPanel
selectTabItem = function(data){

  getTabName = function(anchor) {
    return anchor.attr('data-value') || anchor.text();
  }
  
  let anchors = $("#" + data.id)
        .find("li.nav-item")
        .children("a.nav-link"); 
        
  let value = data.selected;
  
  anchors.each(function() {
      let this_name = getTabName($(this));
      if (this_name === value) {
        this.click();
      } 
  });
  
};

Shiny.addCustomMessageHandler("selectTabItem", selectTabItem);
