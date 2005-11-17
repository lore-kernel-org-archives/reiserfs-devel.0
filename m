From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck --rebuild-tree failure
Date: Thu, 17 Nov 2005 15:01:24 +0300
Message-ID: <200511171501.25220.vitaly@namesys.com>
References: <437B6C0F.8040604@zabuchy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26975-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437B6C0F.8040604@zabuchy.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: iv <iv@zabuchy.net>

On Wednesday 16 November 2005 20:27, iv wrote:
> i'm following an advice to send a bug report about failed reiserfsck
> --rebuild-tree found at http://www.namesys.com/faq.html#rebuild-tree.
> i tried to compile the newest reiserfsprogs-3.6.15-pre1 but it fails

use reiserfsprogs-3.6.19.tar.gz from ftp.namesys.com/pub/reiserfsprogs/
please

> while doing "make": make.log.
> so i run reiserfsck from a package (reiserfsck 3.6.13-pre1 (2003
> www.namesys.com)). it also failed: fsck.log.
> i've got a lot of error massages in kern.log: kern.log.
> obvious, there are badblocks: badblocks.log.

check out www.namesys.com/bad-block-handling.html

> i still can read from damaged partition. when i run `strings /dev/hdc3`
> i get plently of text.
> the question is if there is a way to mount the partition.
> thanks in advance.
> ivan matviyuk.
> 
> 

-- 
Vitaly
