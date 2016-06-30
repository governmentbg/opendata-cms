<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the "off-canvas-wrap" div and all content after.
 *
 * @package FoundationPress
 * @since FoundationPress 1.0.0
 */

?>

		</section>
		<div id="footer-container">
			<footer id="footer" class="medium-7 medium-centered columns">
				<p class="footer-text medium-6 medium-centered columns"> Секция "Новини и информация" е част от <a href="http://opendata.government.bg/">Портала за отворени данни на Република България</a>. Задвижва се от <a href="http://wordpress.org">WordPress</a> и е с отворен код, <a href="https://github.com/governmentbg/opendata-cms">достъпен в GitHub</a> и лицензиран под <a href="https://github.com/governmentbg/opendata-cms/blob/master/LICENSE">GPLv3</a>. Ако забележите проблем или имате предложение, <a href="https://github.com/governmentbg/opendata-cms/issues/new">сигнализирайте.</a> </p>
			</footer>
		</div>

		<?php do_action( 'foundationpress_layout_end' ); ?>

<?php if ( get_theme_mod( 'wpt_mobile_menu_layout' ) == 'offcanvas' ) : ?>
		</div><!-- Close off-canvas wrapper inner -->
	</div><!-- Close off-canvas wrapper -->
</div><!-- Close off-canvas content wrapper -->
<?php endif; ?>


<?php wp_footer(); ?>
<?php do_action( 'foundationpress_before_closing_body' ); ?>
</body>
</html>
