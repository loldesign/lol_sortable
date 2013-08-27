(function($)
{
  $.fn.LOLSortable = function(params)
  {
    params = $.extend( {
                        id_obj_attr:     'data-id', 
                        url:             '/sortable'
                       }, params);

    this.each(function() {
      new Plugin(this, params);
    });

    return this;
  };
})(jQuery);

function Plugin(element, options) {
    var that        = this;
    this.el         = element;
    this.$el        = $(element);
    this.options    = options;

    // Initialize the plugin instance
    this.init();
}

//
// Plugin prototype
//
Plugin.prototype = {

    init: function() {
      var self = this;

      this.$el.sortable();

      this.$el.on( "sortupdate", function(){
        self._update_priority();
      } );

    },

    destroy: function() {
    },

    _update_priority: function(event, ui){
      var self = this;

      var ids = this.$el.sortable('toArray', {'attribute': this.options.id_obj_attr});

      $.ajax({
        url: self.options.url,
        type: 'POST',
        dataType: 'json',
        data: {ids: ids, resource: self.$el.attr('data-resource')},
        success: function(data, textStatus, xhr) {
          
        }
      });
    }
}

jQuery(document).ready(function($) {
  var $isSortable = $('.is-sortable');
  if($isSortable[0]){
    $isSortable.LOLSortable();
  }
});