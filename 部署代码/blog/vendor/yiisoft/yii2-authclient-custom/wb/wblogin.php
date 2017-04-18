<?php
require_once 'config.php';
require_once '../libweibo-master/saetv2.ex.class.php';

$o = new SaeTOAuthV2(WB_KEY, WB_SEC);
$oauth = $o->getAuthorizeURL(CALLBACK_URL);

header("Location:".$oauth);