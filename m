From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 v. 0.51 problem
Date: Thu, 26 Feb 2004 00:55:03 +0300
Message-ID: <200402260038.22663.vitaly@namesys.com>
References: <200402251903.44612.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16942-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402251903.44612.henning-04@die.informatik.uni-siegen.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>, reiserfs-list@namesys.com

On Wednesday 25 February 2004 22:03, Henning Westerholt wrote:
> Hello all,
>
> i try the latest snapshot of the reiser4 code with 2.6.3 on my system. I
> create a new reiser4 partition with mkfs version 0.51.
>
> After one hour the compilation of xfree on this fs aborts with a linker
> error. I try to fix the filesystem with fsck, it complains about a fatal
> corruption and suggested the option "build-fs".
>
> Fsck with --build-fs aborts with the following error for me:
>
> ***** AddMissing Pass: inserting unconnected nodes into the tree.
> vpf-676: Assertion (place->node->p.node != NULL) at tree.c:2635 in function
> reiser4_tree_split() failed.
> Aborted

would you run
	debugfs.reiser4 -P /dev/xxx | bzip2 -c > xxx.bz2
and send it to me for the local debugging?

> I attached the output from the fsck --check and fsck --build-fs run. I is
> safe to continue use this filesystem?

wait please, it is not recovered yet.

-- 
Thanks,
Vitaly Fertman


