From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuilding tree of root fs
Date: Thu, 17 Oct 2002 14:46:33 +0400
Message-ID: <200210171446.33711.vitaly@namesys.com>
References: <20021017102645.1c56dedb.bram@sara.nl> <200210171445.22707.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210171445.22707.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bram Stolk <bram@sara.nl>
Cc: reiserfs-list@namesys.com

On Thursday 17 October 2002 12:26, Bram Stolk wrote:
> Hello,
>
> My reiserfs filesystem is damaged.
> When I run reiserfsck, it reports that '--rebuild-tree' is required.
>
> However, if I add the --rebuild-tree, reiserfsck refuses to continue
> because the fs cannot be mounted.
>
> Unfortunately, the fs is my root fs, so it cannot be unmounted.
>
> How can I solve this?
> This is on a notebook, which has a USB floppy, so maybe that can
> be used somehow? Are there floppy disks with reiserfsck tools
> available?

strip -s fsck/reiserfsck and put it to floppy, boot from CDROM.

In the case of problems you will probably need to build it
statically:
  make LDFLAGS=-static
  strip again

-- 

Thanks,
Vitaly Fertman
