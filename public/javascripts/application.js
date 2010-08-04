$(function() {
  // tag list auto complete
  if (typeof tags != 'undefined') {
    $('#post_tag_list, #question_tag_list, #answer_tag_list').autocomplete(tags, {
      multiple: true,
      matchContains: true,
      autoFill: true
    });
  }
  // remove the beginning spaces in <pre><code> </code></pre>
  $.each($('pre code'), function(i, element) {
    var output = [];
    $.each($(element).text().split('\n'), function(i, line) {
      output.push(line.replace(/^ {12}/, ''));
    });
    $(element).text(output.join('\n'));
    $(element).addClass('prettyprint');
  });
  // pretty print the wikistyle pre code
  prettyPrint();

  $('.collapse').click(function() {
    $(this).parents('h3').next().hide();
    $(this).hide();
    $(this).next().show().css('display', 'inline-block');
    return false;
  });
  $('.expand').click(function() {
    $(this).parents('h3').next().show();
    $(this).hide();
    $(this).prev().show();
    return false;
  });
  
  $('.leave-comment').click(function() {
    var $form = $(this).parent().next();
    if ($form.hasClass('hide')) {
      $form.removeClass('hide');
    } else {
      $form.addClass('hide');
    }
    return false;
  });
});
