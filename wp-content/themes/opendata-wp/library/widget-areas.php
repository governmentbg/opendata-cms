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
	  'before_widget' => '<article id="%1$s" class="widget %2$s"><div class="widget-inner notitle">', //Opening widget-inner, so we don't break the DOM if there is no title.
	  'after_widget' => '</div></article>', //Close widget-inner and then the whole thing.
	  'before_title' => '</div><h6 class="widget-title">', //If there is a title, close widget-inner so we can open it again, leaving the title out.
	  'after_title' => '</h6><div class="widget-inner">', //Open widget-inner after the title.
	));

	register_sidebar(array(
	  'id' => 'footer-widgets',
	  'name' => __( 'Footer widgets', 'foundationpress' ),
	  'description' => __( 'Drag widgets to this footer container', 'foundationpress' ),
	  'before_widget' => '<article id="%1$s" class="large-4 columns widget %2$s"><div class="widget-inner notitle">', //Opening widget-inner, so we don't break the DOM if there is no title.
	  'after_widget' => '</div></article>', //Close widget-inner and then the whole thing.
	  'before_title' => '</div><h6 class="widget-title">', //If there is a title, close widget-inner so we can open it again, leaving the title out.
	  'after_title' => '</h6><div class="widget-inner">', //Open widget-inner after the title.
	));

	register_sidebar(array(
	  'id' => 'home-widgets',
	  'name' => __( 'Home widgets', 'foundationpress' ),
	  'description' => __( 'Widgets in this area will show up on the front page.', 'foundationpress' ),
	  'before_widget' => '<article id="%1$s" class="widget %2$s"><div class="widget-inner notitle">', //Opening widget-inner, so we don't break the DOM if there is no title.
	  'after_widget' => '</div></article>', //Close widget-inner and then the whole thing.
	  'before_title' => '</div><h6 class="widget-title">', //If there is a title, close widget-inner so we can open it again, leaving the title out.
	  'after_title' => '</h6><div class="widget-inner">', //Open widget-inner after the title.
	));
}

add_action( 'widgets_init', 'foundationpress_sidebar_widgets' );
endif;
