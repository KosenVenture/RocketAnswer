var fileUploadErrors = {
  maxFileSize: 'ファイルサイズが大きすぎます。',
  minFileSize: 'ファイルサイズが小さすぎます。',
  acceptFileTypes: 'ファイル形式をサポートしていません。',
  maxNumberOfFiles: 'これ以上同時にアップロードできません。',
  uploadedBytes: 'Uploaded bytes exceed file size',
  emptyResult: 'Empty file upload result'
};

editComment = function (elem) {
  $('.panel-body').each(function(){
    var content = window.atob($(this).data('content'))
    $(this).html(content);
  });

  $panelBody = $(elem).closest('.panel-default').children('.panel-body');
  var content = window.atob($panelBody.data('content-raw'))
  $panelBody.html($('<textarea class="form-control" rows=10>').addClass('form-control').val(content));

  $panelBody.append(
    $('<button>').addClass('btn btn-default btn-xs').text('更新')
      .click(function(){
        $.ajax({
          url: '/answers/' + answer_id + '/comments/' + $panelBody.data('comment-id') + '.json',
          data: {
            comment: { content: $panelBody.children('textarea').val() },
            authenticity_token: Rails.csrfToken(),
          },
          type: 'PUT'
        }).done(function(comment) {
          $panelBody.html(comment.content);
        })
      }));
};

$(function () {

    // サムネイル一覧を並び替え可能に
    $('.thumbs ol').sortable({
      distance: 100, //100px以上動かすと動く
      stop: function() { // 並べ替えが確定したとき
        // リストの並び順をhiddenフィールドに格納
        $('.thumbs ol li').each(function() {
          var index = $('.thumbs ol li').index(this);
          $(this).children('input').val(index);
        });
        // submit
        $('form.edit_answer').submit();
      }
    });

    // ファイルアップロードフォーム
    $('#new_answer_file').fileupload({
        dataType: 'json',
        autoUpload: false,
        done: function (e, data) { // 完了時
          // プログレスバーを100%に
          $(data.context).find('.progress-bar').animate({'width': '100%'});

          // ボタンを隠して完了メッセージを表示
          $(data.context).find('.start').html('<span class="label label-success"><i class="fa fa-check"></i>アップロード完了</span>');
          $(data.context).find('.cancel > button').hide();
        },
        progressall: function(e, data) { // 全体の進捗
          // 進捗度を計算し、プログレスバーに反映
          progress = parseInt(data.loaded / data.total * 100, 10);
          $('#progressall').animate({'width': progress + '%'});
        },
        progress: function (e, data) { // 個別の進捗
          // 進捗度を計算し、プログレスバーに反映
          progress = parseInt(data.loaded / data.total * 100, 10);
          $(data.context).find('.progress-bar').animate({'width': progress + '%'});
        }
    });
});
