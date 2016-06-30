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
			<footer id="footer">
				<div class="footer-inner medium-8 medium-centered columns row">
					<div class="small-12 medium-6 columns footer-left">
						<?php footer_menu(); ?>
						<!-- <ul class="footer-menu">
							<li>
								<a href="#"> За портала </a>
							</li>
							<li>
								<a href="#"> API </a>
							</li>
							<li>
								<a href="#"> Порталът е изготвен от Общество.бг </a>
							</li>
						</ul> -->
					</div>
					<div class="small-12 medium-6 columns footer-right">
						<div class="credit-github credit-block">
							<p class="github-text credit-text">Сайтът е с отворен код и е лицензиран под <a href="https://github.com/governmentbg/opendata-cms/blob/master/LICENSE">GPLv3</a> лиценз. </p>
							<p class="github-text credit-text">Кодът е достъпен в </p>
							<a href="https://github.com/governmentbg/opendata-cms"><img src="<?php echo get_stylesheet_directory_uri(). '/assets/images/github-logo.png' ?>" class="github-logo footer-logo" /></a>
						</div>
						<div class="credit-wordpress credit-block">
							<p class="powered-by credit-text">Задвижван от </p>
							<a href="http://wordpress.org"><img src="<?php echo get_stylesheet_directory_uri(). '/assets/images/wordpress-logo-textonly.png' ?>" class="wp-logo footer-logo" /></a>
						</div>
					</div>
				</div>
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
