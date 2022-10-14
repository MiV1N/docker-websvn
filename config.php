<?php
$repository = getenv('repository');
$username = getenv('username');
$pwd = getenv('pwd');
$config->addRepository('Main', $repository, null, $username, $pwd);
$config->addTemplatePath($locwebsvnreal.'/templates/calm/');
$config->addTemplatePath($locwebsvnreal.'/templates/BlueGrey/');
$config->addTemplatePath($locwebsvnreal.'/templates/Elegant/');
$config->addInlineMimeType('text/plain');
$config->setMinDownloadLevel(2);
$config->allowDownload();
$config->useGeshi();
set_time_limit(0);
$config->expandTabsBy(8);
$config->setSVNCommandPath('/usr/local/bin/websvn');
