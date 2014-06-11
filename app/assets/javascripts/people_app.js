window.PeopleApp = {


  initialize: function (path) {
  $.getJSON(path, this.renderInitialPage);
},

  renderInitialPage :function (response) {
    $.each(response._embedded.people, function () {
      var $html = $(JST['templates/person_show'](this));
      $html.data('person', this);
      $("[data-container=people]").append($html);
    });
  }

};