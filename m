From: rwhron@earthlink.net
Subject: Re: BUGed to death
Date: Tue, 15 Apr 2003 10:30:24 -0400
Message-ID: <20030415143024.GA10117@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

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

