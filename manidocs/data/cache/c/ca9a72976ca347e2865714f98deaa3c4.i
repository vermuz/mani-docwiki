a:17:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:13:"Email Example";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:30;}i:4;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"email_example.info";i:1;i:2;i:2;i:30;}i:2;i:30;}i:5;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:30;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:162:"
   1 name = E-mail Example
   2 description = Demonstrate Drupal's e-mail APIs.
   3 package = Example modules
   4 core = 7.x
   5 files[] = email_example.test
";i:1;N;i:2;N;}i:2;i:66;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:237;}i:8;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:20:"email_example.module";i:1;i:2;i:2;i:237;}i:2;i:237;}i:9;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:237;}i:10;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:8639:"
   1 <?php
   2 /**
   3  * @file
   4  * Example of how to use Drupal's mail API.
   5  */
   6 
   7 /**
   8  * @defgroup email_example Example: Email
   9  * @ingroup examples
  10  * @{
  11  * Example of how to use Drupal's mail API.
  12  *
  13  * This example module provides two different examples of the Drupal email API:
  14  *  - Defines a simple contact form and shows how to use drupal_mail()
  15  *    to send an e-mail (defined in hook_mail()) when the form is submitted.
  16  *  - Shows how modules can alter emails defined by other Drupal modules or
  17  *    Core using hook_mail_alter by attaching a custom signature before
  18  *    they are sent.
  19  */
  20 
  21 /**
  22  * Implement hook_mail().
  23  *
  24  * This hook defines a list of possible e-mail templates that this module can
  25  * send. Each e-mail is given a unique identifier, or 'key'.
  26  *
  27  * $message comes in with some standard properties already set: 'to' address,
  28  * 'from' address, and a set of default 'headers' from drupal_mail(). The goal
  29  * of hook_mail() is to set the message's 'subject' and 'body' properties, as
  30  * well as make any adjustments to the headers that are necessary.
  31  *
  32  * The $params argument is an array which can hold any additional data required
  33  * to build the mail subject and body; for example, user-entered form data, or
  34  * some context information as to where the mail request came from.
  35  *
  36  * Note that hook_mail() is not actually a hook. It is only called for a single
  37  * module, the module named in the first argument of drupal_mail(). So it's
  38  * a callback of a type, but not a hook.
  39  */
  40 function email_example_mail($key, &$message, $params) {
  41   global $user;
  42 
  43   // Each message is associated with a language, which may or may not be the
  44   // current user's selected language, depending on the type of e-mail being
  45   // sent. This $options array is used later in the t() calls for subject
  46   // and body to ensure the proper translation takes effect.
  47   $options = array(
  48     'langcode' => $message['language']->language,
  49   );
  50 
  51   switch ($key) {
  52     // Send a simple message from the contact form.
  53     case 'contact_message':
  54       $message['subject'] = t('E-mail sent from @site-name', array('@site-name' => variable_get('site_name', 'Drupal')), $options);
  55       // Note that the message body is an array, not a string.
  56       $message['body'][] = t('@name sent you the following message:', array('@name' => $user->name), $options);
  57       // Because this is just user-entered text, we do not need to translate it.
  58 
  59       // Since user-entered text may have unintentional HTML entities in it like
  60       // '<' or '>', we need to make sure these entities are properly escaped,
  61       // as the body will later be transformed from HTML to text, meaning
  62       // that a normal use of '<' will result in truncation of the message.
  63       $message['body'][] = check_plain($params['message']);
  64       break;
  65   }
  66 }
  67 
  68 /**
  69  * Sends an e-mail.
  70  *
  71  * @param $form_values
  72  *   An array of values from the contact form fields that were submitted.
  73  *   There are just two relevant items: $form_values['email'] and
  74  *   $form_values['message'].
  75  */
  76 function email_example_mail_send($form_values) {
  77   // All system mails need to specify the module and template key (mirrored from
  78   // hook_mail()) that the message they want to send comes from.
  79   $module = 'email_example';
  80   $key = 'contact_message';
  81 
  82   // Specify 'to' and 'from' addresses.
  83   $to = $form_values['email'];
  84   $from = variable_get('site_mail', 'admin@example.com');
  85 
  86   // "params" loads in additional context for email content completion in
  87   // hook_mail(). In this case, we want to pass in the values the user entered
  88   // into the form, which include the message body in $form_values['message'].
  89   $params = $form_values;
  90 
  91   // The language of the e-mail. This will one of three values:
  92   // * user_preferred_language(): Used for sending mail to a particular website
  93   //   user, so that the mail appears in their preferred language.
  94   // * global $language: Used when sending a mail back to the user currently
  95   //   viewing the site. This will send it in the language they're currently
  96   //   using.
  97   // * language_default(): Used when sending mail to a pre-existing, 'neutral'
  98   //   address, such as the system e-mail address, or when you're unsure of the
  99   //   language preferences of the intended recipient.
 100   //
 101   // Since in our case, we are sending a message to a random e-mail address that
 102   // is not necessarily tied to a user account, we will use the site's default
 103   // language.
 104   $language = language_default();
 105 
 106   // Whether or not to automatically send the mail when drupal_mail() is
 107   // called. This defaults to TRUE, and is normally what you want unless you
 108   // need to do additional processing before drupal_mail_send() is called.
 109   $send = TRUE;
 110   // Send the mail, and check for success. Note that this does not guarantee
 111   // message delivery; only that there were no PHP-related issues encountered
 112   // while sending.
 113   $result = drupal_mail($module, $key, $to, $language, $params, $from, $send);
 114   if ($result['result'] == TRUE) {
 115     drupal_set_message(t('Your message has been sent.'));
 116   }
 117   else {
 118     drupal_set_message(t('There was a problem sending your message and it was not sent.'), 'error');
 119   }
 120 
 121 }
 122 
 123 /**
 124  * Implement hook_mail_alter().
 125  *
 126  * This function is not required to send an email using Drupal's mail system.
 127  *
 128  * Hook_mail_alter() provides an interface to alter any aspect of email sent by
 129  * Drupal. You can use this hook to add a common site footer to all outgoing
 130  * email, add extra header fields, and/or modify the email in anyway. HTML-izing
 131  * the outgoing email is one possibility.
 132  */
 133 function email_example_mail_alter(&$message) {
 134   // For the purpose of this example, modify all the outgoing messages and
 135   // attach a site signature. The signature will be translated to the language
 136   // in which message was built.
 137   $options = array(
 138     'langcode' => $message['language']->language,
 139   );
 140 
 141   $signature = t("\n--\nMail altered by email_example module.", array(), $options);
 142   if (is_array($message['body'])) {
 143     $message['body'][] = $signature;
 144   }
 145   else {  // Some modules use the body as a string, erroneously.
 146     $message['body'] .= $signature;
 147   }
 148 }
 149 
 150 ///// Supporting functions ////
 151 
 152 /**
 153  * Implement hook_menu().
 154  *
 155  * Set up a page with an e-mail contact form on it.
 156  */
 157 function email_example_menu() {
 158   $items['example/email_example'] = array(
 159     'title' => 'E-mail Example: contact form',
 160     'page callback' => 'drupal_get_form',
 161     'page arguments' => array('email_example_form'),
 162     'access arguments' => array('access content'),
 163   );
 164 
 165   return $items;
 166 }
 167 
 168 /**
 169  * The contact form.
 170  */
 171 function email_example_form() {
 172   $form['intro'] = array(
 173     '#markup' => t('Use this form to send a message to an e-mail address. No spamming!'),
 174   );
 175   $form['email'] = array(
 176     '#type' => 'textfield',
 177     '#title' => t('E-mail address'),
 178     '#required' => TRUE,
 179   );
 180   $form['message'] = array(
 181     '#type' => 'textarea',
 182     '#title' => t('Message'),
 183     '#required' => TRUE,
 184   );
 185   $form['submit'] = array(
 186     '#type' => 'submit',
 187     '#value' => t('Submit'),
 188   );
 189 
 190   return $form;
 191 }
 192 
 193 /**
 194  * Form validation logic for the contact form.
 195  */
 196 function email_example_form_validate($form, &$form_state) {
 197   if (!valid_email_address($form_state['values']['email'])) {
 198     form_set_error('email', t('That e-mail address is not valid.'));
 199   }
 200 }
 201 
 202 /**
 203  * Form submission logic for the contact form.
 204  */
 205 function email_example_form_submit($form, &$form_state) {
 206   email_example_mail_send($form_state['values']);
 207 }
 208 /**
 209  * @} End of "defgroup email_example".
 210  */
";i:1;N;i:2;N;}i:2;i:275;}i:11;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:8923;}i:12;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:18:"email_example.test";i:1;i:2;i:2;i:8923;}i:2;i:8923;}i:13;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:8923;}i:14;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:3353:"
   1 <?php
   2 /**
   3  * @file
   4  * Simpletest case for email_example module.
   5  *
   6  * Verify example module functionality.
   7  */
   8 
   9 /**
  10  * Functionality tests for email example module.
  11  */
  12 class EmailExampleTestCase extends DrupalWebTestCase {
  13 
  14   public static function getInfo() {
  15     return array(
  16       'name' => 'Email example',
  17       'description' => 'Verify the email submission using the contact form.',
  18       'group' => 'Examples',
  19     );
  20   }
  21 
  22   function setUp() {
  23     // Enable the email_example module.
  24     parent::setUp('email_example');
  25   }
  26 
  27   /**
  28    * Verify the functionality of the example module.
  29    */
  30   function testContactForm() {
  31     // Create and login user.
  32     $account = $this->drupalCreateUser();
  33     $this->drupalLogin($account);
  34 
  35     // Set default language for t() translations
  36     $t_options = array(
  37       'langcode' => language_default()->language,
  38     );
  39 
  40     // First try to send to an invalid email address.
  41     $email_options = array(
  42       'email'   => $this->randomName(),
  43       'message' => $this->randomName(128),
  44     );
  45     $result = $this->drupalPost('example/email_example', $email_options, t('Submit'));
  46 
  47     // Verify that email address is invalid and email was not sent.
  48     $this->assertText(t('That e-mail address is not valid.'), 'Options were validated and form submitted.');
  49     $this->assertTrue(!count($this->drupalGetMails()), 'No email was sent.');
  50 
  51     // Now try with a valid email address.
  52     $email_options['email'] = $this->randomName() . '@' . $this->randomName() . '.drupal';
  53     $result = $this->drupalPost('example/email_example', $email_options, t('Submit'));
  54 
  55     // Verify that email address is valid and email was sent.
  56  //   $this->assertText(t('Your message has been sent.'), 'Options were validated and form submitted.');
  57     $this->assertTrue(count($this->drupalGetMails()), 'An email has been sent.');
  58 
  59     // Validate sent email.
  60     $email  = $this->drupalGetMails();
  61     // Grab the first entry.
  62     $email = $email[0];
  63 
  64     // Verify email recipient.
  65     $this->assertEqual(
  66       $email['to'],
  67       $email_options['email'],
  68       'Email recipient successfully verified.'
  69     );
  70 
  71     // Verify email subject.
  72     $this->assertEqual(
  73       $email['subject'],
  74       t('E-mail sent from @site-name', array('@site-name' => variable_get('site_name', 'Drupal')), $t_options),
  75       'Email subject successfully verified.'
  76     );
  77 
  78     // Verify email body.
  79     $this->assertTrue(
  80       strstr(
  81         $email['body'],
  82         t('@name sent you the following message:', array('@name' => $account->name), $t_options)
  83       ),
  84       'Email body successfully verified.'
  85     );
  86 
  87     // Verify that signature is attached.
  88     $this->assertTrue(
  89       strstr(
  90         $email['body'],
  91         t("--\nMail altered by email_example module.", array(), $t_options)
  92       ),
  93       'Email signature successfully verified.'
  94     );
  95   }
  96 }
";i:1;N;i:2;N;}i:2;i:8959;}i:15;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:12320;}i:16;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:12320;}}