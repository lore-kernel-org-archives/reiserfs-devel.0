From: Oleg Drokin <green@namesys.com>
Subject: Re: How to use external journal?
Date: Mon, 23 Dec 2002 19:19:16 +0300
Message-ID: <20021223191916.B1645@namesys.com>
References: <20021223155704.GC18464@dei.inf.uc3m.es>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021223155704.GC18464@dei.inf.uc3m.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luis Gregorio Muniz Rodriguez <kreator@dei.inf.uc3m.es>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Dec 23, 2002 at 04:57:04PM +0100, Luis Gregorio Muniz Rodriguez wrote:
> I have recently discovered that the journal can be placed on an external
> device (i.e, `mkreiserfs --journal-device <FILE>'), but I haven't found
> any doc about it.

If you do not use 2.5 kernels, you need to apply separate patch to your tree.

> I'm currently using ReiserFS on top of LVM partitions, and I am
> wondering if I can use the same shared journal device for a number of
> small partitions.  

No, you cannot.

> Note that I'm not trying to move all the journals to the same device
> (this should be easy using `--journal-device' and `--journal-offset',
> isn't it?).  Rather, I try to share the same 32Mb journal between small
> filesystems and/or filesystems with infrequent writes (such as </usr>,
> </usr/local>, </var/www>, and so on).
> Is that possible?  And convenient?

This is not possible.
But you can divide these "shared" 32M into four separate parts 
and use these with --journal-offset.

Bye,
    Oleg
