From: Andreas Otto <aotto1968@onlinehome.de>
Subject: Re: I've done a very bad mistake
Date: Tue, 6 Jul 2004 08:28:56 +0200
Message-ID: <200407060828.56801.aotto1968@onlinehome.de>
Reply-To: aotto1968@t-online.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19521-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

  cp writes to the file and !!overwrite!! everythin at the beginning
  including bootsector, logs, ....

 just more information:

basic step:
 1. /dev/hdb7 was 40G with 20G data and 1.5G overwritten at the beginning
 2. dd_rescue cp the device into the file
 3. I splitt the 40G file into 100M pieces
 4. do strings at the pieces to extract all strings
 5. start to search 'grep' for the data (ascii source code) I was missing
 6. 2 day ago I've done a backup with a tar file
 7. found tar file (was broken) but I was able to extract the ascii data
    ==>> !!! never use gzip Archive !!! <<== if someting get very very wrong
   you can always recover ascii data even if near everything was broken
  => well done :-)
 
advanced step:
1. build superblock on dev/hdb7
2. build transaction log on dev/hdb7
3. fsck.resierfs --rebuild-tree seems to work
4. after mounting dev/hdb7 the fs was empty  :-(
5. but lost+found was filled :-)
    -> got 1 important archive back :-)))
6. but something I dont like ...
   20G data, 1.5G overwritten at the beginning but got only 8.7G back in 
   lost+found. the 8.7G was mainly a couple of big archive files.
  together 122 files from ~10.000 files

=> question to the reiserfs guys 

   Why was the recover rate so bad?


mfg

  aotto

