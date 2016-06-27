<?php
/*
Template Name: Front
*/
get_header(); ?>

<div id="page-homepage" class="homepage-container" role="main">

	<section class="frontpage-posts grid-container">
		<?php
			$posts = new WP_Query( array(
				'post_type' => 'post',
				'posts_per_page' => '20',
				'paged' => true
			));
		?>

		<ul class="frontpage-grid masonry-grid small-up-1 medium-up-3">
			<?php
			if( $posts->have_posts() ) {
				while( $posts->have_posts() ) {
					$posts->the_post();
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
	</section>

	<?php get_sidebar( 'home-widgets' ); ?>

</div>

<?php get_footer();
