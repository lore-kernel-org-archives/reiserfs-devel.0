From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 22:10:59 +0400
Message-ID: <200308062210.59788.vitaly@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806172834.GA15024@namesys.com> <20030806194942.A32577@bitwizard.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806194942.A32577@bitwizard.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, Oleg Drokin <green@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

> If I think about it for 5 seconds I can find a solution. When mkfs-ing
> a new partition, make up a random FS-ID. Store that ID in every block
> that rebuild-tree needs to find.
>
> If you use 32 bits out of every 4k block (0.1%) for this and if we
> happen to have 4 different reiserfs images on our disk, then we'll
> have a one in a billion chance of messing up our filesystem by running
> --rebuild tree.

it is done for v4, but disk format change was not accepted for v3.

-- 
Thanks,
Vitaly Fertman
