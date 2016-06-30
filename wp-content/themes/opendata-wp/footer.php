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
						<p class="powered-by">Задвижван от </p>
						<a href="http://wordpress.org"><img src="<?php echo get_stylesheet_directory_uri(). '/assets/images/wordpress-logo-textonly.png' ?>" class="wp-logo" /></a>
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
