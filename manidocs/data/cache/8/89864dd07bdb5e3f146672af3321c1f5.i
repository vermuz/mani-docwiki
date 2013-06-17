a:29:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:46:"Using URL arguments in page callback functions";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:63;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:22:"menu_magic.context.inc";i:1;i:2;i:2;i:63;}i:2;i:63;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:63;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3041:"
<?php

function menu_magic_node_context($node) {
  $text = _menu_magicify($node->body['und'][0]['value']);
  $output = array(
    '#type' => 'markup',
    '#markup' => $text,
  );
  return $output;
}

/**
 * Helper function.
 */
function _menu_magicify($text) {
  $substitutions = array (
    ' ' => ' ',
    '!' => "¡",          # ¡
    '"' => "„",          # „
    '#' => '#',
    '$' => '$',
    '%' => '%',
    '&' => "⅋",          # ⅋
    "'" => "͵",           # ͵
    '(' => ')',
    ')' => '(',
    '*' => '*',
    '+' => '+',
    ',' => "‘",          # ‘
    '-' => '-',
    '.' => "˙",          # ˙
    '/' => '/',
    '0' => '0',
    '1' => "⃓",           # ,⃓ can be improved
    '2' => "ჷ",          # ჷ
    '3' => "ε",          # ε
    '4' => "⇁⃓",         # ⇁⃓ can be improved
    '5' => "ᔕ",          # ᔕ or maybe just "S"
    '6' => '9',
    '7' => "_̸",          # _̸
    '8' => '8',
    '9' => '6',
    ':' => ':',
    ';' => "⋅̕",           # ⋅̕ sloppy, should be improved
    '<' => '>',
    '=' => '=',
    '>' => '<',
    '?' => "¿",          # ¿
    '@' => '@',          # can be improved
    'A' => "Ꮜ",          # Ꮜ
    'B' => "ϴ",          # ϴ can be improved
    'C' => "Ɔ",          # Ɔ
    'D' => 'p',          # should be an uppercase D!!
    'E' => "Ǝ",          # Ǝ
    'F' => "Ⅎ",          # Ⅎ
    'G' => "⅁",          # ⅁
    'H' => 'H',
    'I' => 'I',
    'J' => "ſ",          # ſ̲
    'K' => "ʞ",          # ʞ should be an uppercase K!!
    'L' => "⅂",          # ⅂
    'M' => "Ɯ",          # Ɯ or maybe just "W"
    'N' => 'N',
    'O' => 'O',
    'P' => 'd',          # should be uppercase P
    'Q' => "Ծ",          # Ծ can be improved
    'R' => "Ȣ",          # Ȣ can be improved
    'S' => 'S',
    'T' => "⊥",          # ⊥
    'U' => "ᑎ",          # ᑎ
    'V' => "Λ",          # Λ
    'W' => 'M',
    'X' => 'X',
    'Y' => "⅄",          # ⅄
    'Z' => 'Z',
    '[' => ']',
    '\\' => '\\',
    ']' => '[',
    '^' => "‿",          # ‿
    '_' => "‾",          # ‾
    '`' => " ̖",          #  ̖
    'a' => "ɐ",          # ɐ
    'b' => 'q',
    'c' => "ɔ",          # ɔ
    'd' => 'p',
    'e' => "ǝ",          # ǝ
    'f' => "ɟ",          # ɟ
    'g' => "ɓ",          # ɓ
    'h' => "ɥ",          # ɥ
    'i' => "ı̣",          # ı̣
    'j' => "ſ",         # ſ̣
    'k' => "ʞ",          # ʞ
    'l' => "Ʈ",          # Ʈ can be improved
    'm' => "ɯ",          # ɯ
    'n' => 'u',
    'o' => 'o',
    'p' => 'd',
    'q' => 'b',
    'r' => "ɹ",          # ɹ
    's' => 's',
    't' => "ʇ",          # ʇ
    'u' => 'n',
    'v' => "ʌ",          # ʌ
    'w' => "ʍ",          # ʍ
    'x' => 'x',
    'y' => "ʎ",          # ʎ
    'z' => 'z',
    '{' => '}',
    '|' => '|',
    '}' => '{',
    '~' => "∼",          # ∼
  );
  $find = array_keys($substitutions);
  $replace = array_values($substitutions);

  return str_replace($find, $replace, $text);
}
";i:1;N;i:2;N;}i:2;i:103;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3153;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:14:"menu_magic.css";i:1;i:2;i:2;i:3153;}i:2;i:3153;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3153;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:56:"
div.menu-magic-image img {
  border: 4px solid #F00;
}
";i:1;N;i:2;N;}i:2;i:3185;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3250;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"menu_magic.extra.inc";i:1;i:2;i:2;i:3250;}i:2;i:3250;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3250;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:235:"
<?php

function menu_magic_extra($wildcard) {
  $content = array(
    '#type' => 'markup',
    '#markup' => '<p>'. t('The wildcard contains the value "%wildcard".', array('%wildcard' => $wildcard)) . '</p>',
  );
  return $content;
}
";i:1;N;i:2;N;}i:2;i:3288;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3532;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"menu_magic.info";i:1;i:2;i:2;i:3532;}i:2;i:3532;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3532;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:78:"
name = Menu Magic
description = Demonstrate the use of hook_menu.
core = 7.x
";i:1;N;i:2;N;}i:2;i:3565;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3652;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"menu_magic.module";i:1;i:2;i:2;i:3652;}i:2;i:3652;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3652;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:2695:"
<?php

/**
 * Implements hook_menu().
 */
function menu_magic_menu() {
  $items = array();

  $items['magic'] = array(
    'title' => 'A little magic',
    'page callback' => 'menu_magic_basic',
    'access arguments' => array('access content'),
  );

  $items['magic/%'] = array(
    'title' => 'Even more magical',
    'page callback' => 'menu_magic_extra',
    'page arguments' => array(1),
    'access arguments' => array('access content'),
    'file' => 'menu_magic.extra.inc',
  );

  $items['user/%/magic'] = array(
    'title' => 'Magic',
    'description' => 'Magical magic for users',
    'page callback' => 'menu_magic_user_tab',
    'page arguments' => array(1),
    'access callback' => 'user_access',
    'access arguments' => array('administer users'),
    'file' => 'menu_magic.user.inc',
    'type' => MENU_LOCAL_TASK,
  );

  // node_load(%)
  $items['node/%node/magic'] = array(
    'title' => 'Magic',
    'description' => 'Do amazing and magical things',
    'page callback' => 'menu_magic_node_context',
    'page arguments' => array(1),
    'access arguments' => array('access content'),
    'file' => 'menu_magic.context.inc',
    'type' => MENU_LOCAL_TASK,
    'context' => MENU_CONTEXT_PAGE | MENU_CONTEXT_INLINE,
  );

  return $items;
}

function menu_magic_basic() {
  $content = array();

  // This is a very, very simple page element. It will appear on the page,
  // but other modules can't customize it and themes can't override its markup.
  $content['raw_markup'] = array(
    '#type' => 'markup',
    '#markup' => 'Truly, this is magical!',
    '#prefix' => '<p>',
    '#suffix' => '</p>',
  );

  $variables = array(
    'path' => 'http://placekitten.com/440/400',
    'alt' => t('This is a magical kitten'),
    'title' => t('This is the title'),
  );
  $content['themed_data'] = array(
    '#type' => 'markup',
    '#markup' => theme('image', $variables),
    '#prefix' => '<div class="menu-magic-image">',
    '#suffix' => '</div>',
    '#attached' => array(
      'css' => array(
        drupal_get_path('module', 'menu_magic') . '/menu_magic.css',
      ),
    ),
  );

  $content['renderable_element'] = array(
    '#theme' => 'item_list',
    '#title' => t('How do we know it\'s magic?'),
    '#items' => array(
      t("Is it made of wood?"),
      t("Does it sink in water?"),
      t("Does it weigh the same as a duck?"),
      t('The current time is %time.', array('%time' => date('r'))),
    ),
    '#cache' => array(
      'keys' => array('menu_magic', 'renderable_element'), // menu_magic:renderable_element
      'bin' => 'cache',
      'expire' => time() + 30,
      'granularity' => DRUPAL_CACHE_PER_PAGE,
    ),
  );

  return $content;
}
";i:1;N;i:2;N;}i:2;i:3687;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6391;}i:24;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"menu_magic.user.inc";i:1;i:2;i:2;i:6391;}i:2;i:6391;}i:25;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:6391;}i:26;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:367:"
<?php

/**
 * Page callback for the 'user/%/magic tab.
 */
function menu_magic_user_tab($wildcard) {
  if (is_numeric($wildcard) && ($account = user_load($wildcard))) {
    return array(
      '#type'   => 'markup',
      '#markup' => t("%username is totally awesome.", array('%username' => $account->name)),
    );
  }
  else {
    return drupal_not_found();
  }
}
";i:1;N;i:2;N;}i:2;i:6428;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:6803;}i:28;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:6803;}}