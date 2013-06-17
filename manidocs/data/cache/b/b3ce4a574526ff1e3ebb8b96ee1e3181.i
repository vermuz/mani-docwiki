a:13:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"Altering the page array";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:40;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"menu_mangler.info";i:1;i:2;i:2;i:40;}i:2;i:40;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:40;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:117:"
name = Menu Mangler
description = Example of implementing hook_page_alter().
core = 7.x
dependencies[] = menu_magic
";i:1;N;i:2;N;}i:2;i:75;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:201;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"menu_mangler.module";i:1;i:2;i:2;i:201;}i:2;i:201;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:201;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:215:"
<?php
/**
 * Implements hook_page_alter().
 */
function menu_mangler_page_alter(&$page) {
  if (arg(0) == 'magic') {
    dsm($page);
    $page['content']['system_main']['renderable_element']['#type'] = 'ol';
  }
}
";i:1;N;i:2;N;}i:2;i:238;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:461;}i:12;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:461;}}