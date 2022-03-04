



// Fix clicking on sub-menu items. 
// without this, clicking first on a menu_subitem, and then on a menu_item does not remove the 'active'
// class on the sub_menuitem.

$( document ).ready(function() {
  
  $("#sidenav-collapse-main a.nav-link[data-bs-toggle = 'tab']").on("click",
  function(event) {
  
      $("#sidenav-collapse-main a.nav-link[data-bs-toggle = 'tab']").removeClass("active");
      $(this).addClass("active")
      
  });  
  
  // Icons with class 'rotate' can rotate 180deg on clicking
  $(".rotate").click(function(){
    $(this).toggleClass("rotated180"); 
  });
  
});
  
    


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




    
    
    
    
    


