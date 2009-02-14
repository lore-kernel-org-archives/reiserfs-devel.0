From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Fragmentation
Date: Sat, 14 Feb 2009 16:15:13 +0300
Message-ID: <4996C3E1.9070304@gmail.com>
References: <854512329.462431234401420041.JavaMail.root@zimbra4-e1.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <854512329.462431234401420041.JavaMail.root@zimbra4-e1.priv.proxad.net>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: geearf@free.fr
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

geearf@free.fr wrote:
> Hello people,
>   
Hello.
> after running into big disk IO I investigated a bit and found that my / is a bit fragmented (the tree is at about 9% from measurefs).
>   

measurefs.reiser4 is pretty ancient, and I guess
that it works incorrectly for compressed files.

> Can that affect a ccreg40 filesystem badly? Anything else relative to R4 that I can look into?
>   

(External) fragmentation resulted in a number of "extents" is
a sticky thing inherent to all linux file systems, including reiser4.
Currently there is no tools to reorganize reiser4 without having
a spare partition. However, it is possible to create something
simple like xfs_fsr: it would be an appreciable help.

The "smart reiser4 repacker" based on the flush algorithm was
supposed to be the paid option, and therefore there are some
obvious issues of its development.

Internal fragmentation, resulted in wasteful space utilization
("holes" in the metadata blocks") would mean a bug in the code.
This fragmentation can be measured as 1 minus  the fraction
du (1) / df (1). Note, that du (1) should be applied to the semantic
root. If you have ccreg40 partition, then check it with
"fsck.reiser4 --fix" prior using du (1). Also make sure (for example
with sync (1)) that there is no dirty pages prior using df (1).
If the internal fragmentation is more then 0.02, while du (1) is
large enough (> 100 000), then, please, report.

Thanks,
Edward.
