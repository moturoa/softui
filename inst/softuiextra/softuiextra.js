


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
