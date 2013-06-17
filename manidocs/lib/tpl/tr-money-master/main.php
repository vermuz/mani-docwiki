<?php

// must be run from within DokuWiki
if (!defined('DOKU_INC')) die();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>
    <?php tpl_pagetitle()?>
    [<?php echo strip_tags($conf['title'])?>]
  </title>

  <?php tpl_metaheaders()?>

  <link rel="shortcut icon" href="<?php echo DOKU_TPL?>images/favicon.ico" />

  <?php /*old includehook*/ @include(dirname(__FILE__).'/meta.html')?>
</head> 
 
<body> 
<div id="bgcontain"><div id="bgcontain-all"> 
<!-- header START --> 
 
<div class="header"> 
	<div class="logo"> 
 		<div class="txt"> 
			<h6><?php tpl_link(wl(),$conf['title'],'name="dokuwiki__top" id="dokuwiki__top" accesskey="h" title="[H]"')?></h6>
		</div>
	</div> 
	<div class="search"> 
	<?php tpl_searchform()?>&nbsp;
	</div> 
</div> 
<!-- header END --> 
 
<div class="dokuwiki">


    <div class="bar" id="bar__top">
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

 
<!-- container START --> 
<div class="container"> 
<!--Start Side Central (SC)--> 
<div class="SC SCL"> 
 
<!--Start Side Left--> 
<div class="SL"> 
<!--Start Post--> 
<div class="post"> 
  <div class="p-con"> 


<?php /*old includehook*/ @include(dirname(__FILE__).'/topheader.html')?>
  <?php html_msgarea()?>


  <div class="stylehead">

    <?php /*old includehook*/ @include(dirname(__FILE__).'/header.html')?>

    <?php if($conf['breadcrumbs']){?>
    <div class="breadcrumbs">
      <?php tpl_breadcrumbs()?>
      <?php //tpl_youarehere() //(some people prefer this)?>
    </div>
    <?php }?>

    <?php if($conf['youarehere']){?>
    <div class="breadcrumbs">
      <?php tpl_youarehere() ?>
    </div>
    <?php }?>

  </div>
  <?php tpl_flush()?>

  <?php /*old includehook*/ @include(dirname(__FILE__).'/pageheader.html')?>


  <div class="page">
    <!-- wikipage start -->
    <?php tpl_content()?>
    <!-- wikipage stop -->
  </div>


  <div class="clearer">&nbsp;</div>

  <?php tpl_flush()?>



</div>
<div class="no"><?php /* provide DokuWiki housekeeping, required in all templates */ tpl_indexerWebBug()?></div>

</div> 
  </div> 
<!--End Post--> 
<!--Start Side Right--> 
<div class="SR"> 


<div class="widget widget_archive">
<h2>Link categories 1</h2>
<ul> 
<li > <a href="" class="wikilink1" >link 1</a> 
</li> 
<li > <a href="" class="wikilink1" >link 1</a>                                                 
</li>
<li > <a href="" class="wikilink1" >link 1</a>                                                 
</li>
<li > <a href="" class="wikilink1" >link 1</a>                                                 
</li>
</ul> 
</div>


<div class="widget widget_archive">
<h2>Link categories 2</h2>
<ul>
<li > <a href="" class="wikilink1" >link 1</a>                                                 
</li>
<li > <a href="" class="wikilink1" >link 1</a>
</li>
<li > <a href="" class="wikilink1" >link 1</a>
</li>
<li > <a href="" class="wikilink1" >link 1</a>
</li>
</ul>
</div>


</div> 
<!--End Side Right--> 
 
</div> 
<!--End Side Central (SC)--> 
 
</div> 
<!-- container END --> 
 
 
<!--Start Footer--> 
<div class="footer"> 
<hr style="display:block;" /> 
<?php tpl_license(false);?>

<center><p>tr-money is created by: <a href="http://www.mohdshakir.net/" title="Mohd Shakir Zakaria">Mohd Shakir Zakaria</a> for <a href="http://wiki.oseems.com" title="osWiki">osWiki</a> 
based on MoneyBlog Wordpress theme by <a href="http://designdisease.com/">Design Disease</a></p> 
</center>
</div> 
<!--End Footer--> 
 
</div></div> 

</body> 
</html> 
