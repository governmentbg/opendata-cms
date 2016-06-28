<?php
/*
Template Name: Front
*/
get_header(); ?>

<div id="page-homepage" class="homepage-container" role="main">

	<section class="frontpage-posts grid-container">
		<?php
			$paged = get_query_var( 'page' ) ? get_query_var( 'page' ) : 1;
			$wp_query = new WP_Query( array(
				'post_type' => 'post',
				'posts_per_page' => '20',
				'paged' => $paged
			));
		?>

		<ul class="frontpage-grid masonry-grid small-up-1 medium-up-3">
			<?php
			if( $wp_query->have_posts() ) {
				while( $wp_query->have_posts() ) {
					$wp_query->the_post();
					?>
						<li class="grid-item column">
							<div class="grid-inner">
								<?php the_post_thumbnail( 'medium', array( 'class' => 'grid-item-image')) ?>
								<h3 class="grid-item-title"><?php the_title(); ?></h3>
								<p class="grid-item-excerpt"><?php echo get_the_excerpt(); ?></p>
								<span class="grid-item-meta"><?php echo get_the_date(); ?></span>
							</div>
							<a href="<?php echo get_the_permalink(); ?>" class="grid-item-permalink"></a>
						</li>
					<?php
				}
			}
			?>
		</ul>
		
		<?php /* Display navigation to next/previous pages when applicable */ ?>
		<?php if ( function_exists( 'foundationpress_pagination' ) ) { foundationpress_pagination(); } else if ( is_paged() ) { ?>
			<nav id="post-nav">
				<div class="post-previous"><?php next_posts_link( __( '&larr; Older posts', 'foundationpress' ) ); ?></div>
				<div class="post-next"><?php previous_posts_link( __( 'Newer posts &rarr;', 'foundationpress' ) ); ?></div>
			</nav>
		<?php } ?>
	</section>


	<?php get_sidebar( 'home' ); ?>

</div>

<?php get_footer();
