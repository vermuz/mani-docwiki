a:13:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:37:"Altering forms with hook_form_alter()";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:55;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:9:"demo.info";i:1;i:2;i:2;i:55;}i:2;i:55;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:55;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
name = Demo
description = Just a Demo module.
core = 7.x
";i:1;N;i:2;N;}i:2;i:82;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:150;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:11:"demo.module";i:1;i:2;i:2;i:150;}i:2;i:150;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:150;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:1131:"
<?php

/*
 * Implements hook_form_alter().
 */
function demo_form_alter(&$form, &$form_state, $form_id) {
  #krumo($form_id);
  switch ($form_id) {
    case 'user_profile_form' :
      
      $form['account']['pass']['#description'] = t('To change the current user password, enter the new password in both fields. Please do not use common passwords like "password", "12345", "love".');
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
  $badpasswords = array('password', '12345', 'love');
  if (in_array($form_state['values']['pass'],  $badpasswords)) {
    form_set_error('pass', t('Please use a more secure password.'));
  }
  #krumo($form_state);
}
";i:1;N;i:2;N;}i:2;i:179;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1318;}i:12;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:1318;}}