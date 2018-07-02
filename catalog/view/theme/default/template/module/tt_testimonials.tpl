<?php if (count($tt_testimonials)) { ?>
<div class="testimonials-wrapper">

    <div class="rise-group">
        <div class="rise-left">
            <div class="rise-left-1" data-top="0.3"></div>
            <div class="rise-left-2" data-top="0.3"></div>
            <div class="rise-left-3" data-top="0.2"></div>
            <div class="rise-left-4" data-top="0.2"></div>
        </div>
        <div class="rise-right">
            <div class="rise-right-1" data-top="0.5"></div>
            <div class="rise-right-2" data-top="0.2"></div>
        </div>
    </div>

    <div class="container">
        <div class="testimonial-heading"><?php echo $heading_title; ?></div>
        <div class="information-block">
            <div class="information-outline">
                <i class="fa fa-question" aria-hidden="true"></i>
            </div>
        </div>
    </div>

    <div id="testimonials-carousel" class="owl-carousel" style="opacity: 1;">
        <?php foreach ($tt_testimonials as $tt_testimonial) : ?>
        <div class="item">
            <div class="container">
                <div class="testimonial-info">
                    <div class="testimonial-advice"><?php echo $tt_testimonial['testimonial_advice']?></div>
                    <?php if ($tt_testimonial['testimonial_by']) : ?>
                    <div class="testimonial-by"><?php echo $tt_testimonial['testimonial_by']?></div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
</div>
<script type="text/javascript"><!--
    $('#testimonials-carousel').owlCarousel({
        items: 6,
        autoPlay: 8000,
        singleItem: true,
        navigation: true,
        //navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
        navigationText: ['', ''],
        pagination: true,
        transitionStyle : "fade"
    });
--></script>
<?php } ?>