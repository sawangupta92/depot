var updateRating = function() {
  this.previous_value
  this.rating_id = ''
}

updateRating.prototype.set_request_type = function(element) {
  var _this = this
  if (_this.previous_value == 0){
    _this.rating_id = ''
    _this.request_type = 'POST'
  } else{
    if ($(element).val() == 0){
      _this.rating_id = $(element).attr('id')
      _this.request_type = 'DELETE'
    } else {
      _this.rating_id = $(element).attr('id')
      _this.request_type = 'PUT'
    }
  }
}

updateRating.prototype.get_value = function(element) {
  var rating_value = {
    rating: $(element).val()
  }
  var _this = this;
  this.set_request_type(element)
    $.ajax({
    type: _this.request_type,
    url: $(element).closest('form').attr('action') + '/ratings/' + this.rating_id,
    data: rating_value,
    dataType: 'json',
    complete: function (data) {
      _this.ajax_data = data.responseJSON;
      $('div[data-rating=' + _this.ajax_data.id + ']').html(_this.ajax_data.rating)
    }
  });
}

updateRating.prototype.bind_events = function() {
  var _this = this;
  $('.product_rating').on('click', function() {
    _this.previous_value = $(this).val()
  }).on('change', function() {
    _this.get_value(this)
  })
}

$.ready = function() {
  var obj = new updateRating
  obj.bind_events()
}
