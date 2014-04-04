$(function() {

  // 志望大学欄の入力補完
  function wish_univ_selectize(index) {
    var xhr;
    var select_univ, $select_univ;
    var select_dep, $select_dep;

    // 学科欄の読み込み
    function loadDepartments(univ_id) {
      if(!univ_id.length) return;
      select_dep.disable();
      select_dep.clearOptions();
      select_dep.load(function(callback) {
        xhr && xhr.abort();
        xhr = $.ajax({
          url: '/universities/' + univ_id + '/departments.json',
          success: function(results) {
            select_dep.enable();
            callback(results);
          },
          error: function () {
            callback();
          }
        });
      });
    }

    $select_univ = $('#user_wish_universities_attributes_' + index + '_university_id').selectize({
      onChange: loadDepartments
    });

    $select_dep = $('#user_wish_universities_attributes_' + index + '_department_id').selectize({
      valueField: 'id',
      labelField: 'name',
      searchField: ['name']
    });

    select_univ = $select_univ[0].selectize;
    select_dep = $select_dep[0].selectize;

    if(select_univ.getValue().length) {
      //if(select_dep.getValue().length)
      //loadDepartments(select_univ.getValue());
    } else {
      select_dep.disable();
    }
  }

  wish_univ_selectize(0);
  wish_univ_selectize(1);
  wish_univ_selectize(2);
});