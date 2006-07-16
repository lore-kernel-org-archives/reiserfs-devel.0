From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Sun, 16 Jul 2006 18:17:56 -0400
Message-ID: <44BABB14.6070906@suse.com>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <6xQea-6ZX-13@gated-at.bofh.it> <E1G1QFx-0001IO-K6@be1.lrz> <44B7D97B.20708@suse.com> <44B9E6D5.2040704@namesys.com> <44BA61A2.5090404@suse.com> <44BA8214.7040005@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29018-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44BA8214.7040005@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: 7eggert@gmx.de, Eric Dumazet <dada1@cosmosbay.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> This sounds like it should be fixed in the driver, not in reiserfs.  It
> sounds like the driver is violating Posix naming, and should be fixed to
> conform to it.  Have the driver create an fs mountpoint, and then have
> the driver handle the number.  I really don't get why reiserfs has any
> role in this problem.  Regarding "a separate name space that doesn't
> follow the same rules
> as the standard file system name space.", linux does not need those to
> be created, but what I don't understand is exactly in what respect the
> driver namespace does not conform.  It has components separated by
> slashes.  Is this related to the difference between BSD's namei and
> Linux's?  BSD is the one getting it right.....

Hans, we're all in agreement that we'd prefer drivers not use names with
slashes in them, and it would be nice to correct drivers currently using
them. The problem is that when you change the name of a device, that's a
userspace visible change. Scripts that currently expect, say,
/proc/partitions to contain cciss/<number> will break between kernel
versions. Sysfs wants to use the device name as a pathname component,
and as such translates the / to a !, the same as this patch proposes.

Reiserfs gets involved because it expects that name to be usable as a
file system pathname component when it is not intended to be one without
 translating slashes into another character. The difference is that
block device names are allowed to have slashes in them, while normal
file system names are not. The fact is that device driver names, when in
/dev can use separate components, like /dev/cciss/0, but when used in
the manner reiserfs wants them to be used, they can't. Also, I'm not
talking about name spaces like struct namespace, I mean that the group
of names that block device drivers use have different constraints than
the group of names that are allowable as file names.

The fact is that this change is required for users deploying devices
that use slashes in their names to see the proc data for a reiserfs file
system. You can point the finger all you want at the block drivers in
the mean time, but it's still a reiserfs problem.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEursULPWxlyuTD7IRAuaoAJ4w9PiYbgSpFzhQraJklOTkSGin7gCfW5I7
bJblQKd/y40fnckG75UhJ8k=
=hLoM
-----END PGP SIGNATURE-----
