<?php function widget_article_info($INFO) { ?>
  <div id="widget">
    <h6>Article Info</h6>
    <li><b>Created:</b> <?php echo date('l jS  F Y H:i:s', $INFO['meta']['date']['created']); ?></li>
    <li><b>Edited:</b> <?php echo date('l jS  F Y H:i:s', $INFO['meta']['date']['modified']); ?></li>
    <li><b>Edit summary:</b> <?php echo $INFO['sum']; ?></li>
  </div>
<?php } ?>

<?php function widget_links() { ?>
  <div id="widget">
	<h6>Links</h6>
	<ul> 
		<li> <a href="" class="wikilink1" >link 1</a> </li> 
		<li> <a href="" class="wikilink1" >link 2</a> </li>
		<li> <a href="" class="wikilink1" >link 3</a> </li>
		<li> <a href="" class="wikilink1" >link 4</a> </li>
	</ul> 
  </div>
<?php } ?>

<?php function box_share() { ?>
  <div id="box">
    <h6>Share this article</h6>
    <br />
    <div class="addthis">
      <!-- AddThis Button BEGIN -->
      <div class="addthis_toolbox addthis_default_style">
	<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
	<a class="addthis_button_tweet"></a>
	<a class="addthis_counter addthis_pill_style"></a>
      </div>
      <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=mohdshakir"></script>
      <!-- AddThis Button END -->
    </div>

  </div>
<?php } ?>

