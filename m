From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: .reiserfs_priv directory removal
Date: Tue, 10 May 2005 12:20:24 -0400
Message-ID: <4280DF48.9060800@suse.com>
References: <5b85fc6705051008555bce937@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5b85fc6705051008555bce937@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicholas DeClario <funsac@gmail.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nicholas DeClario wrote:
> This is probably an odd question.  I am running a 2.6.5 kernel using
> reiserfs version 3.6.13.  I have two reiserfs filesystems.  I need to
> mount these filesystems under a 2.4.22 kernel with reiserfs version
> 3.6.2. Then another system mounts them in 2.6.5 and then they are
> brought back to the original 2.4.22.  The reiserfs filesystems were
> originally created under 2.4.22 using the 3.6.2 tools.
> 
> When mounted under the original 2.4.22 system a directory appears in
> the root of the filesystem '.reiserfs_priv'.  From doing some research
> I understand that this directory is for storing xarg and acl
> information for the partition.
> 
> My problem is it appears that reiserfs 3.6.2 under kernel 2.4.22 does
> not require this hidden directory structure.  What I would like to be
> able to do is delete this entire structure while still booted in my
> 2.6.5 based system so that when the filesystems are later mounted in
> 2.4.22 the directory structure no longer exists.  I won't need to use
> those filesystems anymore under 2.6.5 after deleting those
> directories.  Pretty much I want to delete them and then unmount the
> partitions.  I can't seem to find a way to do this using user space
> tools.  I tried different mount options as well with no success.  Any
> suggestions would be greatly appreciated.

The only way to remove this directory under a 2.6 kernel is to rebuild
the kernel without extended attributes enabled. The .reiserfs_priv
directory is special and hidden. The problem you're running into is
similar to mounting an ext3 filesystem as ext2 using a kernel from
before ext3 was written. It doesn't know how to use it, and so it just
doesn't hide the directory.

The 2.6 kernels, when it's possible that the directory will be used (ie:
xattrs enabled, read-write), creates the directory if it doesn't exist.
So, as soon as you mount the filesystem on another 2.6 system, the
directory will be recreated unless you've disabled xattrs at compile time.

What's the problem with simply removing the directory once you've
mounted the filesystem under your 2.4 kernel?

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFCgN9ILPWxlyuTD7IRAuT+AJ4vi8Q8Z+bx80A4AXoBpo5wa7zzjQCbBYb2
jVZbGVsMgcZmcwvZ/WVWcVY=
=DfF3
-----END PGP SIGNATURE-----
