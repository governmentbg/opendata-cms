<?php
/**
 * Allow users to enter a custom URL for the link on the header logo.
 * @package FoundationPress
 * @since FoundationPress 1.0.0
 */

if ( ! function_exists( 'od_customize_header' ) ) :
function od_customize_header( $wp_customize ) {

	// Create custom panels
	$wp_customize->add_panel( 'header_settings', array(
	  'priority' => 500,
	  'title' => __( 'Header settings', 'foundationpress' ),
		'description' => 'ja'
	) );

	// Create custom field for mobile navigation layout
	$wp_customize->add_section( 'custom_logo_link' , array(
		'title'	=> __('Custom logo link','foundationpress'),
		'panel' => 'header_settings',
		'priority' => 1000,
	));

	$wp_customize->add_setting( 'logo_link_url', array(
		'default' => home_url(),
		'sanitize_callback' => 'esc_url_raw'
	));

	$wp_customize->add_control(
		new WP_Customize_Control(
			$wp_customize,
			'logo_link',
			array(
				'type' => 'url',
				'section' => 'custom_logo_link',
				'settings' => 'logo_link_url'
			)
		)
	);

}
add_action( 'customize_register', 'od_customize_header' );

endif;
