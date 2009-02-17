From: geearf@free.fr
Subject: Re: Reiser4 Fragmentation
Date: Tue, 17 Feb 2009 01:14:32 +0100 (CET)
Message-ID: <1385878997.819661234829671975.JavaMail.root@zimbra4-e1.priv.proxad.net>
References: <493286232.819611234829500161.JavaMail.root@zimbra4-e1.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <493286232.819611234829500161.JavaMail.root@zimbra4-e1.priv.proxad.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>


----- Mail Original -----
"Edward Shishkin" <edward.shishkin@gmail.com> wrote:
>geearf@free.fr wrote:
>Hello.

>measurefs.reiser4 is pretty ancient, and I guess
>that it works incorrectly for compressed files.


>(External) fragmentation resulted in a number of "extents" is
>a sticky thing inherent to all linux file systems, including reiser4.
>Currently there is no tools to reorganize reiser4 without having
>a spare partition. However, it is possible to create something
>simple like xfs_fsr: it would be an appreciable help.

>The "smart reiser4 repacker" based on the flush algorithm was
>supposed to be the paid option, and therefore there are some
>obvious issues of its development.

>Internal fragmentation, resulted in wasteful space utilization
>("holes" in the metadata blocks") would mean a bug in the code.
>This fragmentation can be measured as 1 minus  the fraction
>du (1) / df (1). Note, that du (1) should be applied to the semantic
>root. If you have ccreg40 partition, then check it with
>"fsck.reiser4 --fix" prior using du (1). Also make sure (for example
>with sync (1)) that there is no dirty pages prior using df (1).
>If the internal fragmentation is more then 0.02, while du (1) is
>large enough (> 100 000), then, please, report.

>Thanks,
>Edward.

Well I ended up taring my /, mkfs and untaring it.
So it should not be fragmented in any way anymore.
I will look at the internal fragmentation of my /home, but this is not under ccreg40.

I've also just looked at the xfs_fsr thing and it looks pretty useful.
Can't that be done with a simple script? (sort of like Con's defrag script) or does it need to be related to R4 ?

Thanks Edward,
John
