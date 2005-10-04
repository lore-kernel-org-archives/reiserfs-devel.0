From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Problems compiling 2.6.13.2 + reiser4 patch
Date: Tue, 04 Oct 2005 19:13:56 +0400
Message-ID: <43429C34.6000404@namesys.com>
References: <434004D9.4030501@free.fr> <4341741D.90700@free.fr> <434178F6.7090500@namesys.com> <4341830B.8050504@free.fr> <43421706.4050904@namesys.com> <43422333.6030304@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26394-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43422333.6030304@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jp <jp.guillemin@free.fr>, ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello

It looks like we have fixed one more reiser4 problem in 2.6.13. I can not say
for sure that it fixes "scheduling while atomic" problem because I could not yet
reproduce it. Please try it.


The full set of patches is
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/reiser4-for-2.6.13-2.broken-out.tar.gz.

Single patch is not ready yet, it will be made tomorrow after more testing.

You can upgrade
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/reiser4-for-2.6.13-1.patch.gz

by appling these:
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/broken-out/reiser4-sb_sync_inodes-cleanup.patch
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/broken-out/reiser4-fix-spinlock-compiling.patch
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.13/broken-out/reiser4-add-put_inode.patch
