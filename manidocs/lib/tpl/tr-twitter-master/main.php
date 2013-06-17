<?php

// must be run from within DokuWiki
if (!defined('DOKU_INC')) die();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>"
 lang="<?php echo $conf['lang']?>" dir="<?php echo $lang['direction']?>">
<head>


  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <?php tpl_pagetitle()?>
  </title>

  <?php tpl_metaheaders()?>

  <link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" />

  <?php /*old includehook*/ @include(dirname(__FILE__).'/meta.html')?>
</head>

<body>

	<?php
		//Check page type
		$pagetype = 'article';
		if ($INFO['namespace'] == "") { $pagetype = 'frontpage'; }
		else if ( strpos($INFO['id'], ":start") OR strpos($INFO['id'], ":categories") ) { $pagetype = 'category'; }
		if ( $ACT !== "show" ) { $pagetype = 'special'; }
		if ( $ACT === "edit" ) { $pagetype = 'edit'; }
	?>

	<?php include(dirname(__FILE__).'/widgets.php') ?>



	<?php /*old includehook*/ @include(dirname(__FILE__).'/topheader.html')?>
	
	<div class="dokuwiki">
	  <div id="header">
	    <div class="inner">
	      <div class="bar_left">
		<div id="sitename">
		  <?php tpl_link(wl(),$conf['title'],'name="dokuwiki__top" id="dokuwiki__top" accesskey="h" title="[H]"')?>
		</div>
	      </div>
	      <div class="bar_right" style="padding-top:7px">
		<?php tpl_searchform()?>&nbsp;
	      </div>
	      <div class="clearer"></div>
	      <?php html_msgarea()?>
	    </div>
	  </div>
	
	</div>
	<div id="location" class="inner">
	<?php tpl_youarehere() ?>
	</div>
	<div id="content" class="inner">
	    <div id="maincol" class="dokuwiki">
	      <div class="page">
	
		<h1 id="title" ><?php tpl_pagetitle()?></h1>
		<?php
		  if ($pagetype == 'article') {
		  }
		?>
		<!-- wikipage start -->
		<?php tpl_content(false)?>
		<!-- wikipage stop -->
	
		<?php tpl_flush()?>
	
	      <?php
		if ($pagetype == 'article') {
		}
	      ?>
	<div class="bar" id="bar__top" style="margin-top:20px;">
      <div class="bar-left" id="bar__topleft">
        <?php tpl_button('edit')?>
        <?php tpl_button('history')?>
        <?php tpl_button('revert')?>
      </div>
      <div class="bar-right" id="bar__topright">
        <?php tpl_button('recent')?>
        <?php tpl_button('subscribe')?>
        <?php tpl_button('admin')?>
        <?php tpl_button('profile')?>
        <?php tpl_button('login')?>
        <?php tpl_button('index')?>

      </div>
      <div class="clearer"></div>
    </div>
	      </div>
	/home/shakir/Workspace/Apache
	    </div>
	    <div id="leftcol">
	      <?php
		if ($pagetype == 'article') {
		  widget_article_info($INFO);
		  widget_links();
		}
	
		if ($pagetype == 'category') {
			widget_links();
		}
	
		if ($pagetype == 'frontpage') {
			widget_links();
		}
	
		if ($pagetype == 'edit') {
			widget_links();
		}
	
		tpl_flush();
	      ?>
	    </div>
	    <div class="clearer"></div>
	</div>
	<div id="copyright" style="text-align:center;">
		<p>Except where otherwise noted, content on this wiki is licensed under the following license:<a href="http://creativecommons.org/licenses/by-nc-sa/3.0/" rel="nofollow">CC Attribution-Noncommercial-Share Alike 3.0 Unported</a>    
		<p>Another piece of <a href="http://www.mohdshakir.net" rel="nofollow">Mohd Shakir Zakaria</a> for <a href="http://docs.oseems.com" rel="nofollow">osDocs</a></p>
	</div>
	  
	
	
	<?php
		//Your javascript codes go here (google analytics, etc2) 
		include(dirname(__FILE__).'/js.html') 
	?>
	
	<div class="no"><?php /* provide DokuWiki housekeeping, required in all templates */ tpl_indexerWebBug()?></div>
</body>
</html>
