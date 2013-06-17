<?php
/**
 * Drupal Garland Blue Theme for DokuWiki
 * All credits for the design go to Drupal.
 *
 * @link   http://www.dokuwiki.org/template:drupal_garland_blue
 * @link   http://mirko.windhoff.net/drupal-garland-for-dokuwiki
 * @author Andreas Gohr <andi@splitbrain.org>
 * @author mirko.windhoff.net
 */

// must be run from within DokuWiki
if (!defined('DOKU_INC')) die();

require_once(dirname(__FILE__).'/tpl_functions.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>"
 lang="<?php echo $conf['lang']?>" dir="<?php echo $lang['direction']?>">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title><?php tpl_pagetitle()?> | <?php echo strip_tags($conf['title'])?></title>
 <?php tpl_metaheaders()?>
 <link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" />
 <?php /*old includehook*/ @include(dirname(__FILE__).'/meta.html')?>
</head>

<body>
<?php /*old includehook*/ @include(dirname(__FILE__).'/topheader.html')?>
 <div class="dokuwiki">
  <?php html_msgarea()?>
  <div class="stylehead">
   <div class="header">
    <!--<div class="logo">
     <?php tpl_link(wl(),'<img src="'.DOKU_TPL.'images/logo.png" alt="'.$conf['title'].'"/>','name="dokuwiki__top"')?>
    </div>-->
    <div class="top_menu">
    <?php echo p_sidebar_xhtml('top_navigation')?>
    </div>
    <div class="logotitle">
     <?php tpl_link(wl(),$conf['title'],'name="dokuwiki__top" id="dokuwiki__top" accesskey="h" title="[ALT+H]"')?>
    </div>
    <?php
# $translation = &plugin_load('syntax','translation');
# echo $translation->_showTranslations();
?>
<?php #    <div class="pagename">[[<php tpl_link(wl($ID,'do=backlink'),tpl_pagetitle($ID,true))>]]</div>?>
    <div class="clearer"></div>
    <br />
     <div class="bar-left" id="bar__topleft"><?php 
#      tpl_button('edit'); 
#      tpl_button('history');
/*      if($conf['breadcrumbs']) {
        echo '<div class="breadcrumbs">';
        tpl_breadcrumbs();
        echo '</div>';
      }
*/?>
      </div>
   </div>
   <?php /*old includehook*/ @include(dirname(__FILE__).'/header.html')?>
  </div>
<?php flush()?>
  <?php /*old includehook*/ @include(dirname(__FILE__).'/pageheader.html')?>
  <table class="layout" cellspacing="0" cellpadding="0">
   <tr valign="top">
    <td class="layout_left">
     <?php tpl_sidebar("left"); ?>
    </td>
<?php flush()?>
    <td class="layout_center">
     <div class="squeeze">
      <div class="right-corner">
       <div class="left-corner">
      <div class="bar-left" id="bar_topleft"><?php
      if($conf['youarehere']) {
        echo '<div class="breadcrumbs">';
        tpl_youarehere2();
        echo '</div>';
      } ?>
      </div>
      <div class="bar-right" id="bar__topright"><?php 
     if( auth_quickaclcheck( $Sb ) >= AUTH_EDIT ) {
       tpl_button('edit');
       tpl_button('history');
       tpl_button('index'); 
       tpl_button('admin');
       tpl_button('profile');
     }
     tpl_button('login');
     tpl_button('recent');
     tpl_searchform();
      ?></div>
        <div class="page">
        <!-- wikipage start -->
        <?php tpl_content()?>
        <!-- wikipage stop -->
        </div>
       </div>
      </div>
     </div>
    </td>
<?php flush()?>
   <td class="layout_right"><?php tpl_sidebar('right') ?></td>
   </tr>
  </table>
  <div class="clearer">&nbsp;</div>
<?php flush()?>
  <div class="stylefoot">
   <div class="meta">
    <div class="doc"><?php tpl_pageinfo()?></div>
    <div class="user"><?php tpl_userinfo()?></div>
   </div>
   <div class="bar" id="bar__bottom">
    <div class="bar-left" id="bar__bottomleft"><?php tpl_button('edit')?><?php tpl_button('history')?></div>
    <div class="bar-left" id="bar__bottomcenter">
     <?php $tgt = ($conf['target']['extern']) ? 'target="'.$conf['target']['extern'].'"' : ''; ?>
     <a <?php echo $tgt?> href="<?php echo DOKU_BASE; ?>feed.php" title="Recent changes RSS feed"><img src="<?php echo DOKU_TPL; ?>images/button-rss.png" width="80" height="15" alt="Recent changes RSS feed" /></a>
     <a <?php echo $tgt?> href="http://creativecommons.org/licenses/by-nc-sa/2.0/" rel="license" title="Creative Commons License"><img src="<?php echo DOKU_TPL; ?>images/button-cc.gif" width="80" height="15" alt="Creative Commons License" /></a>
     <a <?php echo $tgt?> href="http://validator.w3.org/check/referer" title="Valid XHTML 1.0"><img src="<?php echo DOKU_TPL; ?>images/button-xhtml.png" width="80" height="15" alt="Valid XHTML 1.0" /></a>
     <a <?php echo $tgt?> href="http://jigsaw.w3.org/css-validator/check/referer" title="Valid CSS"><img src="<?php echo DOKU_TPL; ?>images/button-css.png" width="80" height="15" alt="Valid CSS" /></a>
     <a <?php echo $tgt?> href="http://wiki.splitbrain.org/wiki:dokuwiki" title="Driven by DokuWiki"><img src="<?php echo DOKU_TPL; ?>images/button-dw.png" width="80" height="15" alt="Driven by DokuWiki" /></a>
    </div>
    <div class="bar-right" id="bar__bottomright"><?php 
     tpl_button('subscribe');
     tpl_button('admin');
     tpl_button('profile');
     tpl_button('login');
     ?></div>
    <div class="clearer"></div>
   </div>
   <?php /*old includehook*/ @include(dirname(__FILE__).'/pagefooter.html')?>
  </div>
 </div>
 <?php /* Remove this invisible link if it bothers you. */ ?>
 <a style="display:none;" href="http://mirko.windhoff.net/drupal-garland-for-dokuwiki">Drupal Garland Theme for Dokuwiki</a>
 <?php /*old includehook*/ @include(dirname(__FILE__).'/footer.html')?>
 <div class="no"><?php /* provide DokuWiki housekeeping, required in all templates */ tpl_indexerWebBug()?></div>
</body>
</html>
