From: Ookhoi <ookhoi@humilis.net>
Subject: no reiserfs quota in 2.4 yet? 2.4.21-pre4-ac4 says different
Date: Mon, 17 Feb 2003 18:39:58 +0100
Message-ID: <20030217183957.O1284@humilis>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: alan@lxorguk.ukuu.org.uk

Hi Reiserfs team,

Today I put a new kernel on a server which has reiserfs and needs quota.
I searched for the quota patches (found them in the mail archive) and
saw that they are very old:

ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20

3 december 2002. They don't apply to a current kernel. 

I decided to use 2.4.20 with -pre4 and -ac4 patch. 

01-quota-v2-2.4.20.diff has this:
 Quota support
 CONFIG_QUOTA
   If you say Y here, you will be able to set per user limits for disk
-  usage (also called disk quotas). Currently, it works only for the
-  ext2 file system. You need additional software in order to use quota
-  support; for details, read the Quota mini-HOWTO, available from
+  usage (also called disk quotas). Currently, it works for the
+  ext2, ext3, and reiserfs file system. You need additional software
+  in order to use quota support (you can download sources from
+  <http://www.sf.net/projects/linuxquota/>). For further details, read
+  the Quota mini-HOWTO, available from
   <http://www.tldp.org/docs.html#howto>. Probably the quota
   support is only useful for multi user systems. If unsure, say N.


-ac 4 has this:
 Quota support
 CONFIG_QUOTA
   If you say Y here, you will be able to set per user limits for disk
-  usage (also called disk quotas). Currently, it works only for the
-  ext2 file system. You need additional software in order to use quota
-  support; for details, read the Quota mini-HOWTO, available from
+  usage (also called disk quotas). Currently, it works for the
+  ext2, ext3, and reiserfs file system. You need additional software
+  in order to use quota support (you can download sources from
+  <http://www.sf.net/projects/linuxquota/>). For further details, read
+  the Quota mini-HOWTO, available from
   <http://www.tldp.org/docs.html#howto>. Probably the quota
   support is only useful for multi user systems. If unsure, say N.

Because none of the outdated patches apply to -pre4-ac4, and because of
the above in -ac4, I thought that a 2.4.21-pre4-ac4 kernel would have
quota.

This, unfortunately, seems not the case.

I have this line in fstab:
/dev/md1  /        reiserfs noatime,usrquota,grpquota      0  0

and get this error message:
reiserfs_getopt: unknown option "usrquota"

My quota tools are fresh, 3.08.

Did I do something wrong? The setup worked with patched 2.4.19-rc1, but
that one became old and we needed a few more modules. So for now I
assume I'm bitten by no-quota-in-current-2.4-yet.

If I'm right on that; Is there a reason quota is not in 2.4 yet? It has
been stable (for me), and it exists for quite some time now. Did only
half of the patches make it to Alan? The CONFIG_QUOTA is misleading.

Btw, the faq on namesys.com says:
 Is quota-support built-in in the vanilla 2.4 kernels for ReiserFS?

No, quota support for linux kernels from 2.4 branch are bundled
separately and can be obtained from this location. The reason these
patches are not included into 2.4 kernel branch is because they
implement new quota format and need new quota code too, which is too big
of a change for 2.4 series of kernels. Various Linux distributions
vendors (ie SuSE) do ship reiserfs-quota enabled kernels, though.

The "from this location" link points to
ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/quota-2.4 which
contains patches one year old.


May I ask, what is the future of quota in reiserfs for the 2.4 kernel?
Should I wait for new patches? Try to apply them by hand, or did too
much change? Will quota be integrated in the 2.4 kernel soonish?

Thanks for your time!
