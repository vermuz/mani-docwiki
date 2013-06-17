<?php
/**
 * Metadata for configuration manager plugin
 * Additions for the spacedok template
 * @author Tony Baldwin <tonybaldwin@gmx.com
 *
 * adapted from Minima template by
 * @author    Esther Brunner <wikidesign@gmail.com>
 */
$meta['color']                = array(
  'multichoice',
  '_choices' => array('blue', 'gray')
);
$meta['width']                = array(
  'multichoice',
  '_choices' => array('narrow', 'medium', 'wide')
);
$meta['sidebar_position']     = array(
  'multichoice',
  '_choices' => array('left', 'right')
);
$meta['sidebar_page']         = array('string');
$meta['tabs_page']            = array('string');
$meta['showpageinfo']         = array('onoff');
$meta['showsiteactions']      = array('onoff');
$meta['showuseractions']      = array('onoff');
$meta['spacedok_main_sidebar']  = array('onoff');

//Setup VIM: ex: et ts=2 enc=utf-8 :
