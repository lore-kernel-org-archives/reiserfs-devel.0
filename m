From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reiser4 oops on cat ./..plugin/..readdir
Date: Fri, 27 Feb 2004 20:33:55 +0300
Message-ID: <16447.32643.586667.184027@laputa.namesys.com>
References: <1077845680.6801.4.camel@localhost.localdomain>
	<16447.10782.595624.815422@laputa.namesys.com>
	<1077901194.6423.2.camel@localhost.localdomain>
	<16447.31451.279097.181894@laputa.namesys.com>
	<1077902424.7100.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1077902424.7100.2.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Jonathan Briggs writes:

[...]

 > 
 > I see the difference now.  Try just doing ls ./..plugin/.  No output. 
 > But cd ./..plugin; ls does produce a list just like yours.  Strange!  Is
 > this a bug?

Yes. In ls(1). :)

Try this patch (untested):
----------------------------------------------------------------------
===== plugin/pseudo/pseudo.c 1.42 vs edited =====
--- 1.42/plugin/pseudo/pseudo.c	Fri Feb 27 15:17:37 2004
+++ edited/plugin/pseudo/pseudo.c	Fri Feb 27 20:28:45 2004
@@ -1220,7 +1220,7 @@
 			 },
 			 .try         = try_by_label,
 			 .lookup      = lookup_pagecache,
-			 .lookup_mode = S_IFREG | S_IRUGO | S_IXUGO,
+			 .lookup_mode = S_IFDIR | S_IRUGO | S_IXUGO,
 			 .read_type   = PSEUDO_READ_SINGLE,
 			 .read        = {
 				 .single_show = show_pagecache
@@ -1326,7 +1326,7 @@
 			 },
 			 .try         = NULL,
 			 .lookup      = lookup_plugin_field,
-			 .lookup_mode = S_IFREG | S_IRUGO | S_IXUGO,
+			 .lookup_mode = S_IFDIR | S_IRUGO | S_IXUGO,
 			 .read_type   = PSEUDO_READ_SINGLE,
 			 .read        = {
 				 .single_show = show_plugin
@@ -1345,7 +1345,7 @@
 			 },
 			 .try         = try_by_label,
 			 .lookup      = lookup_plugins,
-			 .lookup_mode = S_IFREG | S_IRUGO | S_IXUGO,
+			 .lookup_mode = S_IFDIR | S_IRUGO | S_IXUGO,
 			 .read_type   = PSEUDO_READ_NONE,
 			 .write_type  = PSEUDO_WRITE_NONE,
 			 .readdir     = readdir_plugins
----------------------------------------------------------------------

 > -- 
 > Jonathan Briggs
 > jbriggs@esoft.com

Nikita.
