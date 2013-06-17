a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:54:"Creating a configuration settings form for your module";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:71;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"demo.info";i:1;i:2;i:2;i:71;}i:2;i:71;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:71;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
name = Demo
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:98;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:165;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"demo.module";i:1;i:2;i:2;i:165;}i:2;i:165;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:165;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1811:"
<?php

/*
 * Implements hook_menu().
 */
function demo_menu() {
  $items = array();
  $items['admin/config/people/passwords'] = array(
    'title' => 'Bad Passwords Lists',
    'description' => t('Configure a list of passwords that are not allowed.'),
    'page callback' => 'drupal_get_form',
    'page arguments' => array('demo_passwords_form'),
    'access arguments' => array('administer site configuration'),
    'file' => 'demo_passwords_form.inc',
  ); 
  return $items; 
}


/*
 * Implements hook_form_alter().
 */
function demo_form_alter(&$form, &$form_state, $form_id) {
  #krumo($form_id);
  switch ($form_id) {
    case 'user_profile_form' :
      
      $form['account']['pass']['#description'] = t('To change the current user password, enter the new password in both fields. Please do not use common passwords like "password", "12345", "love".');
      $form['#validate'][] = 'demo_validate_password';

      #krumo($form);

    break;
  }
}


/*
 * Implement hook_form_FORM_ID_alter().
 */
function demo_form_user_register_form_alter(&$form, &$form_state, $form_id) {

  $form['account']['pass']['#description'] = t('To change the current user password, enter the new password in both fields. Please do not use common passwords like "password", "12345", "love".');
  $form['#validate'][] = 'demo_validate_password';
  #krumo($form);
}


/*
 * Custom password validation
 */
function demo_validate_password($form, &$form_state) {
  //$badpasswords = array('password', '12345', 'love');
  $badpasswords = variable_get('demo_badpasswords');
  $badpasswords_array = explode(', ', $badpasswords);
  #krumo($badpasswords_array);

  if (in_array($form_state['values']['pass'],  $badpasswords_array)) {
    form_set_error('pass', t('Please use a more secure password.'));
  }

  #krumo($form_state);
}
";i:1;N;i:2;N;}i:2;i:194;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2014;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:23:"demo_passwords_form.inc";i:1;i:2;i:2;i:2014;}i:2;i:2014;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:2014;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:556:"
<?php

/*
 * Sytems settings form for blacklisting passwords
 */
function demo_passwords_form($form, &$form_state) {

  $form['demo_badpasswords'] = array(
    '#type' => 'textfield',
    '#title' => t('Bad Passwords'),
    '#default_value' => variable_get('demo_badpasswords'),
    '#description' => t('Enter a list of "bad passwords" separated by commas.  If a user tries to enter one of these passwords either on account creation or when editing their account, the form will display an error message.'),
  );

  return(system_settings_form($form));

}
";i:1;N;i:2;N;}i:2;i:2055;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2619;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2619;}}