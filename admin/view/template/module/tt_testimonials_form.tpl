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
          <input type="hidden" name="tt_testimonial[<?php echo $image_row; ?>][testimonial_id]" value="<?php echo $image_row; ?>">
          <input type="text" name="tt_testimonial[<?php echo $image_row; ?>][advice]" value="<?php echo $testimonial['testimonial_advice'] ?>" placeholder="<?php echo $entry_advice; ?>" class="form-control" />
        </td>
        <td class="text-left" style="width: 30%;">
          <input type="text" name="tt_testimonial[<?php echo $image_row; ?>][by]" value="<?php echo $testimonial['testimonial_by'] ?>" placeholder="<?php echo $entry_advice_by; ?>" class="form-control" />
        </td>
        <td class="text-left" style="width: 10%;">
          <input type="text" name="tt_testimonial[<?php echo $image_row; ?>][sort_order]" value="<?php echo $testimonial['sort'] ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" />
        </td>
        <td class="text-left" style="width: 10%;">
          <input type="text" name="tt_testimonial[<?php echo $image_row; ?>][status]" value="<?php echo $testimonial['status'] ?>" placeholder="<?php echo $entry_status; ?>" class="form-control" />
        </td>
        <td class="text-right" style="width: 5%;">
          <button type="button" data-id="<?php echo $testimonial['testimonial_id'] ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger delete-testimonial"><i class="fa fa-minus-circle"></i></button>
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