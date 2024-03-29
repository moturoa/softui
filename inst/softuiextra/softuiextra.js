




$( document ).ready(function() {
  
  // Fix clicking on sub-menu items. 
  // without this, clicking first on a menu_subitem, and then on a menu_item does not remove the 'active'
  // class on the sub_menuitem.
  $("#sidenav-collapse-main a.nav-link[data-bs-toggle = 'tab']").on("click",
  function(event) {
  
      $("#sidenav-collapse-main a.nav-link[data-bs-toggle = 'tab']").removeClass("active");
      $(this).addClass("active")
      
  });  
  
  //var $tablinks = $(
  //  ".sidebar-menu a[data-toggle='tab']," + ".sidebar-menu li.has-treeview > a"
  //);


  //$tablinks.on("click",
  
    //function(event) {
    //  $tablinks.not($(this)).removeClass("active");
      
    //  $(this).addClass("active");
      
    //}
  //);
  
  
  // Idle timer: number of seconds since the app is 'untouched' (no clicks)
  // Sent to an input ID, used in the idle timer in softui.
  // https://stackoverflow.com/questions/667555/how-to-detect-idle-time-in-javascript-elegantly
  var idleTime = 0;
  function timerIncrement() {
    idleTime = idleTime + 1;
  
    Shiny.setInputValue("idle_timeout-app_idle_time", idleTime);
  
  }

  var idleInterval = setInterval(timerIncrement, 1000); // millisec

  //Zero the idle timer on mouse movement.
  $(this).mousemove(function (e) {
    idleTime = 0;
  });
  $(this).keypress(function (e) {
    idleTime = 0;
  });
    

  // Minimize sidebar menu_item
  // code from  softui.js, but copied here because it does not work outside a document.ready function.

  var sidenavToggler = document.getElementsByClassName('sidenav-toggler')[0];
  var sidenavShow = document.getElementsByClassName('g-sidenav-show')[0];
  var toggleNavbarMinimize = document.getElementById('navbarMinimize');

  if (sidenavShow) {
    sidenavToggler.onclick = function() {

      if (!sidenavShow.classList.contains('g-sidenav-hidden')) {
        sidenavShow.classList.remove('g-sidenav-pinned');
        sidenavShow.classList.add('g-sidenav-hidden');
        if (toggleNavbarMinimize) {
          toggleNavbarMinimize.click();
          toggleNavbarMinimize.setAttribute("checked", "true");
        }
      } else {
        sidenavShow.classList.remove('g-sidenav-hidden');
        sidenavShow.classList.add('g-sidenav-pinned');
        if (toggleNavbarMinimize) {
          toggleNavbarMinimize.click();
          toggleNavbarMinimize.removeAttribute("checked");
        }
      }
    };
  }
  
});
  
    
// First time the app is 'idle', not busy. This is used to time how long it takes for the app to load
$(document).one('shiny:idle', function(){
  Shiny.setInputValue("softui_app_is_idle", Math.random());
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




    
// Set body background color class
setBodyGreyLevel = function(data) {
  
  var $el = $('body');
  var classList = $el.attr('class').split(' ');
  
  $.each(classList, function(id, item) {
      if (item.indexOf('bg-gray-') == 0){
        $el.removeClass(item);
      }
  });
  
  $el.addClass("bg-gray-"+data.level);
};
    
    
Shiny.addCustomMessageHandler("setBodyGreyLevel", setBodyGreyLevel);



// Collapse a box
collapseBox = function(data){
  
  let el = $('#collapse-'+data.id);

  // box is already collapsed; do not collapse it again!
  if(el.find('.rotated180').length == 0){
    el[0].click();
  }
  
};

expandBox = function(data){
  
  let el = $('#collapse-'+data.id);

  // box is already collapsed; do not collapse it again!
  if(el.find('.rotated180').length !== 0){
    el[0].click();
  }
  
};

toggleBox = function(data){
  
  let el = $('#collapse-'+data.id);

  el[0].click();

};

Shiny.addCustomMessageHandler("collapseBox", collapseBox);
Shiny.addCustomMessageHandler("expandBox", expandBox);
Shiny.addCustomMessageHandler("toggleBox", toggleBox);






