From: Peter Herklotz <linux@pch-edv.com>
Subject: reiserfsck
Date: Thu, 22 Aug 2002 16:16:42 +0200
Message-ID: <1651424343.20020822161642@pch-edv.com>
Reply-To: Linux PCH EDV <linux@pch-edv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11294-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

how would I know which version of fs 3.5 I use(d)? The filesystem on
that partition was created using SuSE Linux 7.3.
If I made a wrong choice of the superblock version using "reiserfsck
--rebuild-sb" can I correct it afterwards?
At the moment "reiserfsck --rebuild-tree" does not find ANY data on
the partition. It is telling me
'Could not find hash in use. Using "r5"
"r5" hash is selected'

and then doesn't find anything.
  
I am quite clueless what to try now.

Thanks
Peter

