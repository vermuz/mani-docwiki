a:25:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:39:"Organizing collections of form elements";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:56;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"form_fun.cake.inc";i:1;i:2;i:2;i:56;}i:2;i:56;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:56;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1147:"
<?php

function form_fun_cake_page() {
  return drupal_get_form('form_fun_cake');
}

function form_fun_cake(&$form_state) {
  $form = array();

  $form['choice'] = array(
    '#type' => 'select',
    '#title' => t('Cake or pie?'),
    '#description' => t('Would you like cake or pie?'),
    '#options' => array(
      'cake' => t('Cake please'),
      'pie' => t('Pie I guess'),
    ),
    '#default_value' => 'cake',
    '#required' => TRUE,
  );

  $form['buttons']['submit'] = array(
    '#type' => 'submit',
    '#value' => t('Submit'),
  );
  $form['buttons']['unsure'] = array(
    '#type' => 'submit',
    '#value' => t('Equivocate'),
    '#submit' => array('form_fun_cake_unsure'),
    '#validate' => array(),
  );

  return $form;
}

function form_fun_cake_validate(&$form, &$form_state) {
  if ($form_state['values']['choice'] == 'cake') {
    form_set_error('choice', t('We are out of cake.'));
  }
}

function form_fun_cake_submit(&$form, &$form_state) {
  dsm($form_state['values']);
  $form_state['redirect'] = '';
}

function form_fun_cake_unsure(&$form, &$form_state) {
  drupal_set_message(t('Make up your mind.'), 'warning');
}
";i:1;N;i:2;N;}i:2;i:91;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1247;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"form_fun.info";i:1;i:2;i:2;i:1247;}i:2;i:1247;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1247;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:122:"
name = FormAPI Fun
description = Crazy, crazy form tricks.
core = 7.x
package = Lullabot Examples
dependencies[] = devel
";i:1;N;i:2;N;}i:2;i:1278;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1409;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:15:"form_fun.module";i:1;i:2;i:2;i:1409;}i:2;i:1409;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1409;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:835:"
<?php

function form_fun_menu() {
  $items = array();
  $items['form_fun/cake'] = array(
    'title' => 'Cake or Pie?',
    'page callback' => 'form_fun_cake_page',
    'access arguments' => array('access content'),
    'file' => 'form_fun.cake.inc',
    'weight' => 1,
  );

  $items['form_fun/tree'] = array(
    'title' => "I'm lost!",
    'page callback' => 'drupal_get_form',
    'page arguments' => array('form_fun_tree'),
    'access arguments' => array('access content'),
    'file' => 'form_fun.tree.inc',
    'weight' => 3,
  );

  $items['form_fun/states'] = array(
    'title' => "Partners!",
    'page callback' => 'drupal_get_form',
    'page arguments' => array('form_fun_states_form'),
    'access arguments' => array('access content'),
    'file' => 'form_fun.states.inc',
    'weight' => 4,
  );

  return $items;
}
";i:1;N;i:2;N;}i:2;i:1442;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2286;}i:16;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:19:"form_fun.states.inc";i:1;i:2;i:2;i:2286;}i:2;i:2286;}i:17;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2286;}i:18;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1102:"
<?php

function form_fun_states_form(&$form) {
  $form = array();

  $form['name'] = array(
    '#type' => 'textfield',
    '#title' => t('My name'),
  );

  // Demonstrate the use of the new #states FAPI property. When a user clicks
  // the status checkbox display an additional set of fields.
  $form['status'] = array(
    '#type' => 'checkbox',
    '#title' => t('I have a partner in crime'),
  );

  // The 'Container' element type is handy for controlling multiple elements'
  // states at once.
  $form['partner'] = array(
    '#type' => 'container',
    '#states' => array(
      'visible' => array(
        ':input[name="status"]' => array('checked' => TRUE),
      ),
    ),
  );
  
  $form['partner']['name'] = array(
    '#type' => 'textfield',
    '#title' => t('My partner\'s name'),
  );

  $form['partner']['modus_operandi'] = array(
    '#type' => 'select',
    '#title' => t('My partner\'s M.O.'),
    '#options' => array(
      1 => t('Lock picking'),
      2 => t('Barbed repartee'),
      3 => t('Super-villainy'),
      4 => t('Novelty modules'),
    ),
  );

  return $form;
}
";i:1;N;i:2;N;}i:2;i:2323;}i:19;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:3434;}i:20;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:17:"form_fun.tree.inc";i:1;i:2;i:2;i:3434;}i:2;i:3434;}i:21;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:3434;}i:22;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:857:"
<?php

function form_fun_tree(&$form_state) {
  $form = array();

  $form['#tree'] = TRUE;

  $form['home'] = array(
    '#type' => 'fieldset',
    '#title' => t('Home address'),
  );
  $form['home']['street'] = array(
    '#type' => 'textfield',
    '#title' => t('Street Address'),
  );
  $form['home']['city'] = array(
    '#type' => 'textfield',
    '#title' => t('City'),
  );

  $form['work'] = array(
    '#type' => 'fieldset',
    '#title' => t('Work address'),
  );
  $form['work']['street'] = array(
    '#type' => 'textfield',
    '#title' => t('Street Address'),
  );
  $form['work']['city'] = array(
    '#type' => 'textfield',
    '#title' => t('City'),
  );

  $form['submit'] = array(
    '#type' => 'submit',
    '#value' => t('Submit'),
  );

  return $form;
}

function form_fun_tree_submit(&$form, &$form_state) {
  dsm($form_state);
}
";i:1;N;i:2;N;}i:2;i:3469;}i:23;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:4334;}i:24;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:4334;}}