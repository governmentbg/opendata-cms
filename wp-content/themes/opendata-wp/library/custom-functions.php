<?php
//Shorten the excerpt to 20 words. /Default is 55./
function change_excerpt_length( $length ) {
  return 15;
}
add_filter( 'excerpt_length', 'change_excerpt_length', 999 );

//Change excerpt 'more' string. /Default is '[...]'/
function change_excerpt_more( $more ) {
  return '...';
}
add_filter( 'excerpt_more', 'change_excerpt_more' );
