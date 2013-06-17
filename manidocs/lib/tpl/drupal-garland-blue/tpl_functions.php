<?php
/**
 * functions for drupal-garland-for-dokuwiki theme
 * License: GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * $Id$
 * 
 * @author: Michael Klier <chi@chimeric.de>
 * @author: Xan <DXpublica@telefonica.net>
 * @author: mirko.windhoff.net
 */

/**
 * fetches the sidebar-pages and displays the sidebar
 */
function tpl_sidebar($side='left') {
    global $ID, $REV, $INFO, $lang;
    
    $svID  = $ID;
    $svREV = $REV;

    $page_sidebar_name = $ID.'_'.tpl_getConf('sidebar_pagename').'_'.$side;
    $namespace_sidebar_name = $INFO['namespace'].'_'.tpl_getConf('sidebar_pagename').'_'.$side;
    $default_sidebar_name = tpl_getConf('default_'.$side.'sidebar_name');

    if (file_exists(wikiFN($page_sidebar_name)))
        echo '<div class="'.$side.'bar">'.p_sidebar_xhtml($page_sidebar_name).'</div>';
    elseif (file_exists(wikiFN($namespace_sidebar_name)))
        echo '<div class="'.$side.'bar">'.p_sidebar_xhtml($namespace_sidebar_name).'</div>';
    elseif (file_exists(wikiFN($default_sidebar_name)))
        echo '<div class="'.$side.'bar">'.p_sidebar_xhtml($default_sidebar_name).'</div>';
    else
        echo '&nbsp;';

    $ID = $svID;
    $REV = $svREV;

}

/**
 * removes the TOC of the sidebar-pages and shows an edit-button if user has enough rights
 */
function p_sidebar_xhtml($Sb) {
    $data = p_wiki_xhtml($Sb,'',false);
    if(auth_quickaclcheck($Sb) >= AUTH_EDIT) {
        $data .= '<div class="secedit">'.html_btn('secedit',$Sb,'',array('do'=>'edit','rev'=>'','post')).'</div>';
    }
    return preg_replace('/<div class="toc">.*?(<\/div>\n<\/div>)/s', '', $data);
}

/**
 * prints a you are here string, without description
 */
function tpl_youarehere2($sep=' &raquo; '){
  global $conf;
  global $ID;

  // check if enabled
  if(!$conf['youarehere']) return false;

  $parts = explode(':', $ID);
  $count = count($parts);

  if($GLOBALS['ACT'] == 'search')
  {
    $parts = array($conf['start']);
    $count = 1;
  }

  // always print the startpage
  $title = useHeading('navigation') ? p_get_first_heading($conf['start']) : $conf['start'];
  if(!$title) $title = $conf['start'];
  tpl_link(wl($conf['start']),hsc($title),'title="'.$conf['start'].'"');

  // print intermediate namespace links
  $part = '';
  for($i=0; $i<$count - 1; $i++){
    $part .= $parts[$i].':';
    $page = $part;
    resolve_pageid('',$page,$exists);
    if ($page == $conf['start']) continue; // Skip startpage

    // output
    echo $sep;
    if($exists){
      $title = useHeading('navigation') ? p_get_first_heading($page) : $parts[$i];
      tpl_link(wl($page),hsc($title),'title="'.$page.'"');
    }else{
      tpl_link(wl($page),$parts[$i],'title="'.$page.'" class="wikilink2" rel="nofollow"');
    }
  }

  // print current page, skipping start page, skipping for namespace index
  if(isset($page) && $page==$part.$parts[$i]) return;
  $page = $part.$parts[$i];
  if($page == $conf['start']) return;
  echo $sep;
  if(page_exists($page)){
    $title = useHeading('navigation') ? p_get_first_heading($page) : $parts[$i];
    tpl_link(wl($page),hsc($title),'title="'.$page.'"');
  }else{
    tpl_link(wl($page),$parts[$i],'title="'.$page.'" class="wikilink2" rel="nofollow"');
  }
  return true;
}

?>
