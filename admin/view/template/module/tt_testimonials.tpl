<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-tt-testimonials-status" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
                <h1><?php echo $heading_title; ?></h1>
                <div class="alert alert-danger"><i class="fa fa-exclamation-triangle"></i> Модулът е временно недостъпен!</div>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
            <?php if ($success) { ?>
            <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                <div class="panel-body">

                    <form action="<?php echo $action2; ?>" method="post" enctype="multipart/form-data" id="form-tt-testimonials-status" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="tt_testimonials_status" id="input-status" class="form-control">
                                    <?php if ($tt_testimonials_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </form>

                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tt-testimonials" class="form-horizontal">
                        <table id="images" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <td class="text-left"><?php echo $entry_advice; ?></td>
                                    <td class="text-left"><?php echo $entry_advice_by; ?></td>
                                    <td class="text-left"><?php echo $entry_sort_order; ?></td>
                                    <td class="text-left"><?php echo $entry_status; ?></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $image_row = 1; ?>
                                <?php foreach ($testimonials as $testimonial) : ?>
                                <tr id="image-row"></tr>
                                <td class="text-left" style="width: 45%;">
                                    <?php foreach ($languages as $language) { ?>
                                    <input type="hidden" name="tt_testimonial[<?php echo $image_row; ?>][testimonial_id]" value="<?php echo $image_row ?>">
                                    <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                                        <input type="text" name="tt_testimonial[<?php echo $image_row; ?>][language_id][<?php echo $language['language_id']; ?>][advice]" value="<?php echo $testimonial['language_id'][$language['language_id']]['testimonial_advice'] ?>" placeholder="<?php echo $entry_advice; ?>" class="form-control" />
                                    </div>
                                    <?php } ?>
                                </td>

                                <td class="text-left" style="width: 30%;">
                                    <?php foreach ($languages as $language_id => $language) { ?>
                                    <input type="text" name="tt_testimonial[<?php echo $image_row; ?>][language_id][<?php echo $language['language_id']; ?>][by]" value="<?php echo $testimonial['language_id'][$language['language_id']]['testimonial_by'] ?>" placeholder="<?php echo $entry_advice_by; ?>" class="form-control" />
                                    <?php } ?>
                                </td>
                                <td class="text-left" style="width: 10%;">
                                    <input type="text" name="tt_testimonial[<?php echo $image_row; ?>][sort_order]" value="<?php echo $testimonial['sort'] ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
                                </td>
                                <td class="text-left" style="width: 10%;">
                                    <input type="text" name="tt_testimonial[<?php echo $image_row; ?>][status]" value="<?php echo $testimonial['status'] ?>" placeholder="<?php echo $entry_status; ?>" class="form-control" />
                                </td>
                                <td class="text-right" style="width: 5%;">
                                    <button type="button" data-id="<?php echo $testimonial['testimonial_id'] ?>" data-confirm="Сигурен ли сте?" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger delete-testimonial"><i class="fa fa-minus-circle"></i></button>
                                </td>
                                <?php $image_row++; ?>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4"></td>
                                    <td class="text-right" style="width: 10%;">
                                        <button type="button" onclick="addTestimonial();" data-toggle="tooltip" title="<?php echo $button_testimonial_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                                    </td>
                                </tr> 
                            </tfoot>
                        </table>
                        <div class="pull-right">
                            <button type="submit" form="form-tt-testimonials" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><?php echo $button_save; ?> <i class="fa fa-save"></i></button>
                        </div>
                    </form>


                </div>
            </div>
        </div>

        <script type="text/javascript"><!--
            var image_row = <?php echo $image_row; ?>;

            function addTestimonial() {
                html  = '<tr id="image-row' + image_row + '">';
                html += '  <td class="text-left">';
                html += '  <?php foreach ($languages as $language) { ?>';
                html += '   <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>';
                html += '     <input type="hidden" name="tt_testimonial[' + image_row + '][testimonial_id]" value="' + image_row + '" class="form-control" />';
                html += '     <input type="text" name="tt_testimonial[' + image_row + '][language_id][<?php echo $language['language_id']; ?>][advice]" value="" placeholder="<?php echo $entry_advice; ?>" class="form-control" />';
                html += '   </div>';
                html += '   <?php } ?>';
                html += '   </td>';
                html += '   <td class="text-left" style="width: 30%;">';
                html += '   <?php foreach ($languages as $language) { ?>';
                html += '     <input type="text" name="tt_testimonial[' + image_row + '][language_id][<?php echo $language['language_id']; ?>][by]" value="" placeholder="<?php echo $entry_advice_by; ?>" class="form-control" />';
                html += '   <?php } ?>';
                html += '  </td>';  
                html += '  <td class="text-left" style="width: 10%;"><input type="text" name="tt_testimonial[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
                html += '  <td class="text-left" style="width: 10%;"><input type="text" name="tt_testimonial[' + image_row + '][status]" value="1" placeholder="<?php echo $entry_status; ?>" class="form-control" /></td>';
                html += '  <td class="text-right" style="width: 5%;"><button type="button" data-confirm="Сигурен ли сте?" data-id="<?php echo $testimonial['testimonial_id'] ?>" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger delete-testimonial"><i class="fa fa-minus-circle"></i></button></td>';
                html += '</tr>';

                $('#images tbody').append(html);

                image_row++;
            }

            $('.delete-testimonial').click(function(e) {

                e.preventDefault();

                var confirmed = confirm($(this).attr('data-confirm'));

                if (confirmed) {

                    var id = $(this).data('id');
                    $.ajax({
                        type: "GET",
                        url: 'index.php?route=module/tt_testimonials/delete',
                        data: {
                            testimonial_id: id,
                            token: '<?php echo $token; ?>'
                        },
                        dataType: 'html',
                        success: function(response) {
                            location.reload();
                        }

                    });

                }
            });

/*function deleteTestimonial(testimonial_id) {

}*/
//-->
</script>

</div>
<?php echo $footer; ?>