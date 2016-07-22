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
		<div class="header-wrapper row">
			<div class="header-top row small-12 column">
				<ul class="top-wrapper small-12 column row">
					<a href="<?php echo esc_url( get_theme_mod( 'logo_link_url' ) ); ?>" class="home-link medium-3 column"><img class="header-logo" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/images/logo.png" /></a>
					<h2 class="site-title medium-9 column"><span>Портал за отворени данни </span> <br /> на Република България</h2>
				</ul>
			</div>

			<div class="title-bar">
				<button class="menu-icon" type="button" data-toggle="mobile-menu"></button>
			</div>

			<form role="search" method="get" id="header-searchform" action="http://opendata.government.bg/" class="mobile-search">
				<div class="input-group">
					<input class="input-group-field" value="" name="q" id="q" placeholder="<?php _e( 'Search' ); ?>" type="text">
					<button type="submit" class="header-search-button">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</div>
			</form>

			<nav id="site-navigation" class="top-bar" role="navigation">

				<div class="header-bottom row small-12 column">
					<form role="search" method="get" id="header-searchform" action="http://opendata.government.bg/">
						<div class="input-group">
							<input class="input-group-field" value="" name="q" id="q" placeholder="<?php _e( 'Search' ); ?>" type="text">
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

			</nav>
		</div>
	</header>

	<section class="container">
		<div class="breadcrumbs-wrap row">
			<?php foundationpress_breadcrumb(); ?>
		</div>
		<?php do_action( 'foundationpress_after_header' );
