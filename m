From: Christophe Greisberger <greisberger@zenon-media.com>
Subject: Re: Segfault mounting a reiserfs 3.6 partition
Date: Sat, 21 Oct 2006 12:39:42 +0200
Message-ID: <200610211240.01902.greisberger@zenon-media.com>
References: <200610190903.43896.greisberger@zenon-media.com> <200610201031.11208.greisberger@zenon-media.com> <200610202113.25695.zam@namesys.com>
Reply-To: greisberger@zenon-media.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200610202113.25695.zam@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> likely it was the transaction id overflow bug (fixed in 2.6.17) , the fs
> itself is not broken.
>
> it should work with 2.6.17+, it even may work with the older kernels
> after mount r/w and clean unmount.
Yes, the Live CD indeed has 2.6.17.

Christophe.
