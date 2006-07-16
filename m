From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Sun, 16 Jul 2006 00:12:21 -0700
Message-ID: <44B9E6D5.2040704@namesys.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <6xQea-6ZX-13@gated-at.bofh.it> <E1G1QFx-0001IO-K6@be1.lrz> <44B7D97B.20708@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44B7D97B.20708@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

So the Plan 9 and Unix way would be to let the driver parse the number
part of the name after the last slash.  What I don't understand is why
reiserfs is getting involved here, rather than recognizing the driver as
an extension of the namespace, seeing the driver as a mountpoint, and
just passing number to the driver.  There must be something I don't
grasp here, can you help me?

Hans

Jeff Mahoney wrote:

> Bodo Eggert wrote:
>
> >Eric Dumazet <dada1@cosmosbay.com> wrote:
>
> >>On Wednesday 12 July 2006 18:42, Jeff Mahoney wrote:
>
> >>> On systems with block devices containing slashes (virtual dasd, cciss,
> >>> etc), reiserfs will fail to initialize /proc/fs/reiserfs/<dev> due to
> >>> it being interpreted as a subdirectory. The generic block device code
> >>> changes the / to ! for use in the sysfs tree. This patch uses that
> >>> convention.
> >>>
> >>> Tested by making dm devices use dm/<number> rather than dm-<number>
> >>
> >>Your patch handles at most one slash. But the description mentions
> 'slashes'
> >>(ie several slashes)
>
> >Besides that, there is no reason to prevent the user from using many
> slashes.
> >OTOH, I'd prefer propper quoting, but having each driver do this would be
> >insane.
>
>
> The strings aren't user-supplied, they're kernel-internal names of block
> devices, supplied by the driver. At present there is no possibility of
> more than one slash in the name, and I doubt we'll see any new devices
> with one slash in them, never mind more than one.
>
> -Jeff
>
> --
> Jeff Mahoney
> SUSE Labs

