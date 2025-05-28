var iconRadioBinding = new Shiny.InputBinding();

$.extend(iconRadioBinding, {
  find: function(scope) {
    return $(scope).find('.icon-radio-input');
  },
  
  initialize: function(el) {
    var defaultValue = $(el).data('default'); // gets the value from data-default

    if (defaultValue !== undefined && defaultValue !== null && defaultValue !== "") {
      var $match = $(el).find('.icon-radio-option').filter(function() {
        return $(this).data('value') === defaultValue;
      });
      if ($match.length > 0) {
        $match.addClass('selected');
      }
    }
  },
  
  getValue: function(el) {
    var selected = $(el).find('.icon-radio-option.selected');
    return selected.data('value');
  },
  
  setValue: function(el, value) {
    $(el).find('.icon-radio-option').removeClass('selected');
    $(el).find('.icon-radio-option').filter(function() {
      return $(this).data('value') === value;
    }).addClass('selected');
  },
  
  subscribe: function(el, callback) {
    $(el).on('click.iconRadio', '.icon-radio-option', function() {
      $(el).find('.icon-radio-option').removeClass('selected');
      $(this).addClass('selected');
      callback();
    });
  },
  
  unsubscribe: function(el) {
    $(el).off('.iconRadio');
  }
  
});

Shiny.inputBindings.register(iconRadioBinding);
