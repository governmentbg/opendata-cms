<?php
/**
 * The template for displaying the header
 *
 * Displays all of the head element and everything up until the "container" div.
 *
 * @package FoundationPress
 * @since FoundationPress 1.0.0
 */

?>
<!doctype html>
<html class="no-js" <?php language_attributes(); ?> >
	<head>
		<meta charset="<?php bloginfo( 'charset' ); ?>" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<?php wp_head(); ?>
	</head>
	<body <?php body_class(); ?>>
	<?php do_action( 'foundationpress_after_body' ); ?>

	<?php if ( get_theme_mod( 'wpt_mobile_menu_layout' ) == 'offcanvas' ) : ?>
	<div class="off-canvas-wrapper">
		<div class="off-canvas-wrapper-inner" data-off-canvas-wrapper>
		<?php get_template_part( 'template-parts/mobile-off-canvas' ); ?>
	<?php endif; ?>

	<?php do_action( 'foundationpress_layout_start' ); ?>

	<header id="masthead" class="site-header od-header" role="banner">

		<div class="title-bar" data-responsive-toggle="site-navigation">
			<button class="menu-icon" type="button" data-toggle="mobile-menu"></button>
			<div class="title-bar-title">
				<a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a>
			</div>
		</div>

		<nav id="site-navigation" class="top-bar" role="navigation">

		<div class="header-wrapper row">

			<div class="header-top row">
				<ul class="top-wrapper large-6 columns">
					<img class="header-logo" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/images/logo.png" />
					<h2 class="site-title"><strong>Портал за отворени данни </strong> на Република България</h2>
				</ul>
			</div>


			<div class="header-bottom row">
				<form role="search" method="get" id="searchform" action="http://info.opendata.dev/">
					<div class="input-group">
						<input class="input-group-field" value="" name="s" id="s" placeholder="Search" type="text">
						<button type="submit" class="header-search-button">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</div>
				</form>

				<?php foundationpress_top_bar_r(); ?>

				<?php if ( ! get_theme_mod( 'wpt_mobile_menu_layout' ) || get_theme_mod( 'wpt_mobile_menu_layout' ) == 'topbar' ) : ?>
					<?php get_template_part( 'template-parts/mobile-top-bar' ); ?>
				<?php endif; ?>
			</div>

		</div>

		</nav>
	</header>

	<section class="container">
		<?php do_action( 'foundationpress_after_header' );
