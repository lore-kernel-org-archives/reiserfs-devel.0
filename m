From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 performance
Date: Tue, 09 Aug 2005 20:34:12 -0500
Message-ID: <42F95994.7060705@slaphack.com>
References: <dd7cbn$kbg$1@sea.gmane.org> <42F7A01A.7090209@namesys.com>	 <e692861c05080816136f9d70bc@mail.gmail.com>	 <42F7F6DC.2080706@slaphack.com>	 <e692861c050808175818078a30@mail.gmail.com>	 <42F807D7.9090900@slaphack.com> <e692861c05080819035e028642@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070603090008090004000604"
Return-path: <reiserfs-list-return-25377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c05080819035e028642@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--------------070603090008090004000604
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Gregory Maxwell wrote:
> On 8/8/05, David Masover <ninja@slaphack.com> wrote:
[...]
> My ability to use it is severely hampered only being able to use it on
> boxes running test-kernel of the day.. which are laden with other
> issues unrelated to reiser4 that I don't have time to deal with.

How recent a Reiser4 do you need?  There are some patches against the 
vanilla kernel at

http://namesys.com/pub/reiser4-for-2.6/

But those seem out of date and don't work for me.  But, the patches from 
the mm-kernel have been rock-solid for me.  I'm taking the vanilla 
2.6.12.3 kernel and patching it with the Reiser4 patches from 
2.6.12-mm2.  Unpack this:

http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.12/2.6.12-mm2/2.6.12-mm2-broken-out.tar.bz2

to /usr/src/ and run this:

#!/bin/sh
# hack to bring mm reiser4 back to vanilla
cd /usr/src/linux
for i in `grep reiser4 ../broken-out/series`; do
	patch -p1 < ../broken-out/$i;
done

I've attached one patch of my own that makes it compile properly -- 
apply after you run the script above.

--------------070603090008090004000604
Content-Type: text/plain;
 name="reiser4_fix_refrigerator.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4_fix_refrigerator.patch"

diff -Naur linux-2.6.12.2-reiser4/fs/reiser4/entd.c linux-2.6.12.2-reiser4-fix-refrigerator/fs/reiser4/entd.c
--- linux-2.6.12.2-reiser4/fs/reiser4/entd.c	2005-07-04 19:36:42.910932648 +0000
+++ linux-2.6.12.2-reiser4-fix-refrigerator/fs/reiser4/entd.c	2005-07-04 19:39:05.513253800 +0000
@@ -131,7 +131,7 @@
 		int result = 0;
 
 		if (me->flags & PF_FREEZE)
-			refrigerator();
+			refrigerator(PF_FREEZE);
 
 		spin_lock(&ent->guard);
 
diff -Naur linux-2.6.12.2-reiser4/fs/reiser4/ktxnmgrd.c linux-2.6.12.2-reiser4-fix-refrigerator/fs/reiser4/ktxnmgrd.c
--- linux-2.6.12.2-reiser4/fs/reiser4/ktxnmgrd.c	2005-07-04 19:36:42.898934472 +0000
+++ linux-2.6.12.2-reiser4-fix-refrigerator/fs/reiser4/ktxnmgrd.c	2005-07-04 19:39:19.049196024 +0000
@@ -109,7 +109,7 @@
 		/* software suspend support. */
 		if (me->flags & PF_FREEZE) {
 			spin_unlock(&ctx->guard);
-			refrigerator();
+			refrigerator(PF_FREEZE);
 			spin_lock(&ctx->guard);
 		}
 

--------------070603090008090004000604--
