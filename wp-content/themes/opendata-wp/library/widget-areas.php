<?php
/**
 * Register widget areas
 *
 * @package FoundationPress
 * @since FoundationPress 1.0.0
 */

if ( ! function_exists( 'foundationpress_sidebar_widgets' ) ) :
function foundationpress_sidebar_widgets() {
	register_sidebar(array(
	  'id' => 'sidebar-widgets',
	  'name' => __( 'Sidebar widgets', 'foundationpress' ),
	  'description' => __( 'Drag widgets to this sidebar container.', 'foundationpress' ),
	  'before_widget' => '<article id="%1$s" class="widget %2$s">',
	  'after_widget' => '</div></article>',
	  'before_title' => '<h6 class="widget-title">',
	  'after_title' => '</h6><div class="widget-inner">',
	));

	register_sidebar(array(
	  'id' => 'footer-widgets',
	  'name' => __( 'Footer widgets', 'foundationpress' ),
	  'description' => __( 'Drag widgets to this footer container', 'foundationpress' ),
	  'before_widget' => '<article id="%1$s" class="large-4 columns widget %2$s">',
	  'after_widget' => '</div></article>',
	  'before_title' => '<h6 class="widget-title">',
	  'after_title' => '</h6><div class="widget-inner">',
	));

	register_sidebar(array(
	  'id' => 'home-widgets',
	  'name' => __( 'Home widgets', 'foundationpress' ),
	  'description' => __( 'Widgets in this area will show up on the front page.', 'foundationpress' ),
	  'before_widget' => '<article id="%1$s" class="large-4 columns widget %2$s">',
	  'after_widget' => '</div></article>',
	  'before_title' => '<h6 class="widget-title">',
	  'after_title' => '</h6><div class="widget-inner">',
	));
}

add_action( 'widgets_init', 'foundationpress_sidebar_widgets' );
endif;
