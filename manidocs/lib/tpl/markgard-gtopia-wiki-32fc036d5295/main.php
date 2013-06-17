<?php
// must be run from within DokuWiki
if (!defined('DOKU_INC')) die();
//if (!include('DOKU_TPL'+'sidebar.php')) die();
// render the content into buffer for later use
    ob_start();
    tpl_content(false);
    $buffer = ob_get_clean();
?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    	<title><?php tpl_pagetitle()?>[<?php echo strip_tags($conf['title'])?>]</title>
    	<!-- Start DOKU tpl_metaheaders -->
    	<?php tpl_metaheaders()?>
    	<!-- End DOKU tpl_metaheaders -->
		<link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" type="image/x-icon" />
		<style type='text/css'>#cart-block-contents { display: none; }</style>
    	<link type="text/css" rel="stylesheet" media="all" href="style.css" />
	    <!--[if IE 7]>
	      <link rel="stylesheet" href="acquia_slate/ie7-fixes.css" type="text/css">
	    <![endif]-->
	    <!--[if lte IE 6]>
	      <link rel="stylesheet" href="acquia_slate/ie6-fixes.css" type="text/css">
	    <![endif]-->
	    <script type="text/javascript" src="gtopia.js"></script>
	</head>

  <body class="front layout-first-main">
  <div id="page">

    <div id="primary-menu" class="links">
      <?php
        //### TODO Add Configuration Option here to USE Namespace Menus or HardCoded Menus
		// #if(config says use namespace){
        // tpl_include_page(<<get namespace from config>>);
		// ELSE Use Hardcoded //
       ?>
      <ul class="links">
        <li><a href="">MENU 1</a></li>
        <li><a href="">MENU 2</a></li>
        <li><div class="li"><a href="">MENU 3</a></div></li>
      </ul>
		<?php //END IFELSE ?>
    </div><!-- /primary_menu -->


    <div id="header-wrapper" class="clearfix">
      <div id="header-first">
        <div id="logo"><a href="<?php echo DOKU_BASE?>" title="Home"><img src="<?php echo DOKU_TPL?>images/logo.png" alt="Home" /></a></div>
        <h1><a href="/" title="Home"><?php echo strip_tags($conf['title'])?></a></h1>
      </div><!-- /header-first -->

      <div id="header-middle">
        <div id="slogan"><?php echo tpl_getConf('subtitle'); ?></div>
      </div><!-- /header-middle -->

      <div id="search-box">
        <?php tpl_searchform()?>
      </div><!-- /search-box -->
    </div><!-- /header-wrapper -->

<!-- Start of Main Image Block -->

<?php 
if(($INFO['id'] == $conf['start'] && tpl_getConf('disableMainImgOnSubpages') == "1") || tpl_getConf('disableMainImgOnSubpages') == "0"): ?>
            <div id="preface-wrapper" class="clearfix">
                  <div id="preface-sidebar">
            	<!-- start block.tpl.pihp -->
			<div class="block-wrapper odd">

        
		        <div id="block-views-about-block_1" class="block block-views">
                    <div class="content">
       	     <div class="view view-about view-id-about view-display-id-block_1 view-dom-id-4">
    
  
  
      <div class="view-content">
        <div class="views-row views-row-1 views-row-odd views-row-first views-row-last">
    
<!-- start node.tpl.php -->
<div id="node-2" class="node odd teaser node-type-page">
  
    <h2 class="title"><a href="/about" title="About">TWITTER</a></h2>
  
	  <div class="meta">
	      </div>
  

	<div class="content">

<?php
// Your twitter username.
$username = tpl_getConf('twitterUsername');

// Suffix - some text you want display after your latest tweet. (Same rules as the prefix.)
$suffix = "";

$feed = "http://search.twitter.com/search.atom?q=from:" . $username . "&rpp=1";

function parse_feed($feed) {
    $stepOne = explode("<content type=\"html\">", $feed);
    $stepTwo = explode("</content>", $stepOne[1]);
    $tweet = $stepTwo[0];
    $tweet = str_replace("&lt;", "<", $tweet);
    $tweet = str_replace("&gt;", ">", $tweet);
    return $tweet;
}

$twitterFeed = file_get_contents($feed);
echo stripslashes($prefix) . parse_feed($twitterFeed) . stripslashes($suffix);
?>
<br/>
<span class="read-more"><a href="http://www.twitter.com/<?php echo $username?>"><strong>&raquo; <?php echo $username; ?></strong></a></span>  
<!-- /PICTURE TEXT -->
</div>
  </div>
<!-- /#node-2 -->  </div>
    </div>
</div>           </div>
        </div>
</div>
<!-- /end block.tpl.php -->          </div>
                      </div><!-- /preface-wrapper -->
<?php endif; ?>
            <div id="main-wrapper" class="clearfix">  
                <div id="sidebar-first">

<!-- start block.tpl.php -->
<div class="block-wrapper even">
  <div class="rounded-block">
    <div class="rounded-block-top-left"></div>
    <div class="rounded-block-top-right"></div>
    <div class="rounded-outside">
      <div class="rounded-inside">
        <p class="rounded-topspace"></p>
        <div id="block-views-catalog-block_1" class="block block-views">
          <h2 class="title block-title"><span class="first-word">Categories</span></h2>
          <div class="content">
            <div class="view view-catalog view-id-catalog view-display-id-block_1 view-dom-id-3">
              <div class="view-content">
                <!-- CONTENT HERE -->
<?php //tpl_sitemap(); ?>
              </div>
            </div>
          </div>
        </div>
        <p class="rounded-bottomspace"></p>
      </div><!-- /rounded-inside -->
    </div>
    <div class="rounded-block-bottom-left"></div>
    <div class="rounded-block-bottom-right"></div>
  </div><!-- /rounded-block -->
</div>
<!-- /end block.tpl.php -->

<!-- start Table of Contents -->
<div class="block-wrapper">
  <div class="rounded-block">
    <div class="rounded-block-top-left"></div>
    <div class="rounded-block-top-right"></div>
    <div class="rounded-outside">
      <div class="rounded-inside">
        <p class="rounded-topspace"></p>
          <div class="block block-uc_cart">
            <h2 class="title block-title"><span class="cart-block-title-bar"><span class="first-word">Table</span> of Contents</span></h2>
            <div class="content">
              <?php tpl_toc()?>
            </div>
          </div>
          <p class="rounded-bottomspace"></p>
        </div><!-- /rounded-inside -->
      </div>
    <div class="rounded-block-bottom-left"></div>
    <div class="rounded-block-bottom-right"></div>
  </div><!-- /rounded-block -->
</div>
<!-- /end Table of Contents -->

</div><!-- /sidebar-first -->
<div id="content-wrapper">
  <div id="content">
    <div id="content-inner" class="clear">

    <!-- wikipage start -->
    <?php echo $buffer; ?>
    <!-- wikipage stop -->
 </div>
</div><!-- /content -->
        </div><!-- /content-wrapper -->
  
              </div><!-- /main-wrapper -->
                      <div class="item-list">
  <ul class="pager">
          <li class="pager-item"><?php tpl_actionlink('edit') ?></li>
          <li class="pager-item"><?php tpl_actionlink('history') ?></li>
          <li class="pager-item"><?php tpl_actionlink('recent') ?></li>
          <li class="pager-item"><?php tpl_actionlink('login') ?></li> 
          <li class="pager-item"><?php tpl_actionlink('profile') ?></li>
	      <li class="pager-item"><?php tpl_actionlink('index') ?></li>
	      <li class="pager-item"><?php tpl_actionlink('admin') ?></li>
	      <li class="pager-item"><?php tpl_actionlink('top') ?></li>
	      <li class="pager-item"><?php tpl_actionlink('back') ?></li>
	      <li class="pager-item"><?php tpl_actionlink('backlink') ?></li>
	      <li class="pager-item"><?php tpl_actionlink('subscribe') ?></li>
        </ul>
      </div>
    </div><!-- /page -->

    <div id="footer" class="clearfix">
      <div id="footer-wrapper">
        <div id="footer-message"><!--&copy; 2010 Caldwell Pics-->TODO FOOTER MESSAGE</div>
        <div id="closure">
          <div id="store-footer">Supported by Ubercart, an <a href="http://www.ubercart.org/">open source e-commerce suite</a>.</div>
          <div id="legal-notice">Theme provided under GPL license from <a href="http://www.topnotchthemes.com">Drupal themes</a> <br/>Modified by Mark Gardner of <a href="http://www.gtopia.org">Gtopia</a></div>
        </div><!-- /closure -->
      </div><!-- /footer-wrapper -->
    </div><!-- /footer -->       
<div class="no"><?php /* provide DokuWiki housekeeping, required in all templates */ tpl_indexerWebBug()?></div>
  </body>
</html>
