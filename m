From: Adrian Bunk <bunk@fs.tum.de>
Subject: [2.6 patch] remove four superfluous BUG's in ReiserFS
Date: Thu, 17 Jul 2003 00:57:22 +0200
Message-ID: <20030716225722.GA1407@fs.tum.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org, Randy Hron <rwhron@earthlink.net>, trivial@rustcorp.com.au

The trivial patch below by Randy Hron still applies agains 2.6.0-test1.

Please apply
Adrian


----- Forwarded message from rwhron@earthlink.net -----

Date:	Tue, 15 Apr 2003 10:30:24 -0400
From: rwhron@earthlink.net
To: linux-kernel@vger.kernel.org,
    reiserfs-list@namesys.com
Subject: Re: BUGed to death

The patch below eliminates 4 BUG() calls that clearly 
cannot happen based on the context.

--- linux-2.5.67-mm2/fs/reiserfs/hashes.c.orig	2003-04-15 10:11:44.000000000 -0400
+++ linux-2.5.67-mm2/fs/reiserfs/hashes.c	2003-04-15 10:13:43.000000000 -0400
@@ -90,10 +90,6 @@
 
 	if (len >= 12)
 	{
-	    	//assert(len < 16);
-		if (len >= 16)
-		    BUG();
-
 		a = (u32)msg[ 0]      |
 		    (u32)msg[ 1] << 8 |
 		    (u32)msg[ 2] << 16|
@@ -116,9 +112,6 @@
 	}
 	else if (len >= 8)
 	{
-	    	//assert(len < 12);
-		if (len >= 12)
-		    BUG();
 		a = (u32)msg[ 0]      |
 		    (u32)msg[ 1] << 8 |
 		    (u32)msg[ 2] << 16|
@@ -137,9 +130,6 @@
 	}
 	else if (len >= 4)
 	{
-	    	//assert(len < 8);
-		if (len >= 8)
-		    BUG();
 		a = (u32)msg[ 0]      |
 		    (u32)msg[ 1] << 8 |
 		    (u32)msg[ 2] << 16|
@@ -154,9 +144,6 @@
 	}
 	else
 	{
-	    	//assert(len < 4);
-		if (len >= 4)
-		    BUG();
 		a = b = c = d = pad;
 		for(i = 0; i < len; i++)
 		{
-- 
Randy Hron
http://home.earthlink.net/~rwhron/kernel/bigbox.html

-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

----- End forwarded message -----

