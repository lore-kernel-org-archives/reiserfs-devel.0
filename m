From: "Allen H. Ibara" <aibara@thibs.menloschool.org>
Subject: Re: attrib +A doesn't work
Date: Sat, 7 Sep 2002 17:35:26 -0700
Message-ID: <20020908003526.GA19852@thibs.menloschool.org>
References: <20020905034320.GA11951@yzero> <15735.10894.167461.158961@laputa.namesys.com> <20020905140132.A19752@namesys.com>
Reply-To: "Allen H. Ibara" <aibara@ucsd.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11398-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020905140132.A19752@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

> mount -o attrs in fact.

I'm not sure if this is the right place to report this...

The 'attrs' mount option is broken with kernels 2.4.20-pre2 through -pre5 (the
latest as of this email).

See "license cleanup" patch found here:

ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.19.pending/01-license_cleanup.diff

It contains a re-work of reiserfs_parse_options() in super.c that removes
the 'attrs' option. Perhaps a merge error or simple omission.

Trivial fix:

diff -ur linux-2.4.19-orig/fs/reiserfs/super.c linux-2.4.19/fs/reiserfs/super.c
--- linux-2.4.19-orig/fs/reiserfs/super.c	Sat Sep  7 17:29:12 2002
+++ linux-2.4.19/fs/reiserfs/super.c	Sat Sep  7 13:44:27 2002
@@ -560,6 +560,7 @@
     char * pos;
     opt_desc_t opts[] = {
 		{"tails", 't', tails, -1},
+		{"attrs", 0, 0, REISERFS_ATTRS},
 		{"notail", 0, 0, -1}, /* Compatibility stuff, so that -o notail for old setups still work */
 		{"conv", 0, 0, REISERFS_CONVERT}, 
 		{"nolog", 0, 0, -1},

--Allen Ibara
