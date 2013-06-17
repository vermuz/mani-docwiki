<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
/**
 * DokuWiki LCARS Template
 * 
 * @link   http://dokuwiki.org/templates
 * @author Paweł Knap <me@pawelknap.com>
 */
?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $conf['lang']?>" lang="<?php echo $conf['lang']?>" dir="ltr">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <?php echo hsc($lang['mediaselect'])?>
    [<?php echo strip_tags($conf['title'])?>]
  </title>
  <?php tpl_metaheaders()?>
  <link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" />
  <link rel="stylesheet" href="<?php echo DOKU_TPL?>detail.css"/>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
  <script type="text/javascript" src="<?php echo DOKU_TPL;?>js/functions.js"></script>
  <?php if(tpl_getConf('fonts') == 1){?> 
  <script type="text/javascript" src="<?php echo DOKU_TPL;?>js/cufon-yui.js"></script>
  <script type="text/javascript" src="<?php echo DOKU_TPL;?>js/LCARS_400.font.js"></script>
  <script type="text/javascript">
  	Cufon.replace("h1, h2, h3, h4, h5, h6");
  </script>
  <?php }?>
</head>

<body>
<div id="media__manager" class="dokuwiki">
    <div id="media__left">
        <?php html_msgarea()?>
        <h1><span><?php echo hsc($lang['mediaselect'])?></span></h1>

        <div id="media__opts"></div>

        <?php tpl_mediaTree() ?>
    </div><!-- end media__left-->

    <div id="media__right">
        <?php tpl_mediaContent() ?>
    </div><!-- end media__right-->
</div><!-- end media__manager-->
</body>
</html>
