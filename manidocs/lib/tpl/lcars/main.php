<?php
/**
 * DokuWiki LCARS Template
 *
 * This is the template you need to change for the overall look
 * of DokuWiki.
 *
 * @link   http://dokuwiki.org/templates
 * @author Paweł Knap <me@pawelknap.com>
 */
// must be run from within DokuWiki
if (!defined('DOKU_INC')) die();

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>"
 lang="<?php echo $conf['lang']?>" dir="<?php echo $lang['direction']?>">
<head>
  <meta charset="utf-8" />
  <title>
    <?php tpl_pagetitle()?>
    [<?php echo strip_tags($conf['title'])?>]
  </title>

  <?php tpl_metaheaders()?>

  <link rel="shortcut icon" href="<?php echo tpl_getFavicon() ?>" />
	
  <?php 
  /*old includehook*/ @include(dirname(__FILE__).'/meta.html')
  ?>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
  <script type="text/javascript" src="<?php echo DOKU_TPL;?>js/functions.js"></script>
  <?php if(tpl_getConf('fonts') == 1){?> 
  <script type="text/javascript" src="<?php echo DOKU_TPL;?>js/cufon-yui.js"></script>
  <script type="text/javascript" src="<?php echo DOKU_TPL;?>js/LCARS_400.font.js"></script>
  <script type="text/javascript">
  	Cufon.replace(".logo");
  	Cufon.replace(".pagename");
  	Cufon.replace("span.button");
  	Cufon.replace(".breadcrumbs");
  	Cufon.replace("h1, h2, h3, h4, h5, h6");
  	Cufon.replace("a.action");
  	Cufon.replace("#toc__header");
  </script>
  <?php }?>
</head>

<body>
<div class="dokuwiki">
  <!--<?php html_msgarea()?>-->

  <div class="stylehead">

    <div id="header">
    	<div class="breadcrumbs">
    	<?php if($conf['breadcrumbs']){?>
      			<?php tpl_breadcrumbs()?>
    	<?php }?>
    	<?php if($conf['youarehere']){?>
      			<br/><?php tpl_youarehere() ?>
    	<?php }?>
    	</div>
      <div class="logo">
        <?php tpl_link(wl(),$conf['title'],'name="dokuwiki__top" id="dokuwiki__top" accesskey="h" title="[H]"')?>
      </div>
      <div class="pagename">
        <?php tpl_link(wl($ID,'do=backlink'),tpl_pagetitle($ID,true),'title="'.$lang['btn_backlink'].'"')?>
      </div>
      <div class="clearer"></div>
    </div><!--end header-->

    <div class="bar" id="bar__top">
      <div class="bar-left" id="bar__topleft">
        <?php tpl_searchform()?>
      </div>

      <div class="bar-right" id="bar__topright">
      	<div class="nav_buttons">
        	<?php tpl_actionlink('edit')?>
        	<?php tpl_actionlink('history')?>
        	<?php tpl_actionlink('recent')?>
        </div>
      </div>

      <div class="clearer"></div>
    </div>

  </div>
  <?php tpl_flush()?>

  <div class="page clearfix">
  	<div class="content clearfix">
    <!-- wikipage start -->
    	<?php tpl_content()?>
    <!-- wikipage stop -->
    </div>
  </div>

  <?php tpl_flush()?>
  <div id="footer">	
  <div class="stylefoot clearfix">

    <div class="meta">
      <!--<div class="user">
        <?php tpl_userinfo()?>
      </div>
      <div class="doc">
        <?php tpl_pageinfo()?>
      </div>-->
    </div>


    <div class="bar" id="bar__bottom">
      <div class="bar-left" id="bar__bottomleft">
        <?php tpl_actionlink('edit')?>
        <?php tpl_actionlink('history')?>
        <?php tpl_actionlink('revert')?>
      </div>
      <div class="bar-right" id="bar__bottomright">
        <?php tpl_actionlink('subscribe')?>
        <?php tpl_actionlink('admin')?>
        <?php tpl_actionlink('profile')?>
        <?php tpl_actionlink('login')?>
        <?php tpl_actionlink('index')?>
        <?php tpl_actionlink('top')?>
      </div>
      <div class="clearer"></div>
    </div>

  </div>
  </div><!--end footer-->
  <div id="license">
  	<div id="bar_license"></div>
	<?php tpl_license(false);?>
  </div>
</div>

<div class="no"><?php /* provide DokuWiki housekeeping, required in all templates */ tpl_indexerWebBug()?></div>
</body>
</html>