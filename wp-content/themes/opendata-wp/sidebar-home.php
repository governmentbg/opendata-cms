<?php
/**
 * The sidebar containing the frontpage widget area
 *
 */

?>
<aside class="sidebar">
	<?php do_action( 'foundationpress_before_sidebar' ); ?>
	<?php dynamic_sidebar( 'home-widgets' ); ?>
	<?php do_action( 'foundationpress_after_sidebar' ); ?>
</aside>
