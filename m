From: "Mike Young" <myoung@wildernessvoice.com>
Subject: RE: ACL Support
Date: Thu, 1 Apr 2004 12:43:23 -0800
Message-ID: <200404012043.MAA12517@amber.he.net>
References: <406C67E7.5050403@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17654-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <406C67E7.5050403@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jeff Mahoney' <jeffm@suse.com>
Cc: reiserfs-list@namesys.com

Wow Jeff!  That's a great explanation and very helpful too.  Can you =
answer
a couple more questions for me on the v3.x reiserfs?  I'm trying to
understand the limits right now.  For example, how big of a volume can I
support?  How large of a file?  And how many files?

I actually have a problem in that I've got files that are 2TB in size--
nothing bigger, though. =20

Thanks,

Mike

-----Original Message-----
From: Jeff Mahoney [mailto:jeffm@suse.com]=20
Sent: Thursday, April 01, 2004 11:05 AM
To: Mike Young
Cc: reiserfs-list@namesys.com
Subject: Re: ACL Support

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike Young wrote:
| Hi All,
|
|
|
| I=19ve been trying to find out information on ACL support in Reiserfs, =
but
| haven=19t had much luck finding anything but a few exchanges here and
| there.  There are numerous capabilities within Reiserfs, which I=19d =
like
| to take advantage of, but this issue of ACL support is only growing.
| The problem actually consists of trying to store ACLs in a Windows
| environment.  The number of ACEs can be quite sufficient that it can
| require multiple inodes to store everything.  As an example, XFS has a
| maximum inode size of 2K, which is normally fairly sufficient.  =
However,
| if I wish to support all of the Windows ACL set, then 2K is inadequate
| and 4K would actually be better.  Again, I can use multiple inodes, =
but
| this has a significant affect on performance.  The bottom line is that =
I
| love Linux as a server and believe I should be able to seamlessly
| support a Windows client.  I just don=19t want to be as slow as a =
Windows
| server.
|
|
|
| With that in mind, can someone give me a quick synopsis of how ACLs =
are
| handled in Reiserfs v3 and v4?  Also, if there is a url to the
| information I=19d appreciate a pointer to it.  Admittedly, I haven=19t =
read
| the man pages.  So, if it=19s all there, please forgive me.

ReiserFS v3 ACLs are implemented as an external patchset, though we've
been trying for some time to convince Hans to accept them. I'm not sure
what you mean by "handled," so I guess I'll just give a rundown of how
the backend works.

ACLs are handled by implementing extended attributes for ReiserFS, and
having the system.posix_acl_access and system.posix_acl_default xattrs
handled specially, and are interpreted by the kernel as part of the
permissions process.

In order to implement extended attributes in a manner that doesn't alter
disk format, my patches add a .reiserfs_priv directory to the root of
the filesystems. xattrs are stored in
.reiserfs/xattrs/<objectid>.<generation number>/<xattr name>. This
directory is hidden from userspace completely when xattrs are enabled,
even as root. When not using my patches, the directory is exposed as a
normal directory and the system administrator is welcome to shoot
himself in the foot. Each file contains a magic, a checksum of the data,
~ and the xattr data itself. When quotas are enabled, extended =
attributes
are included in the quota usage.

Both access and default ACLs are loaded on demand. This means that for
an access ACL to be loaded, reiserfs_permission requires that
information. If the user owns the file or is root, the ACL won't be
loaded from disk. Once loaded, the entire ACL set for that inode is
cached for the life of the inode. For the default ACL to be loaded, a
file or directory must be created under a directory with a default ACL.
Like access ACLs, once loaded, the default ACL is cached for the life of
the inode.

As far as using them goes, the interface is the standard set of
xattr/acl tools you'd use for any other Linux filesystem that supports =
them.

Since the xattr implementation uses regular files as the backend, the
number of ACLs per inode is limited only by the maximum size of an
xattr, which is currently limited at the VFS layer to 64k. With 64k to
work with, the on-disk format supports approximately 8k ACLs.

For v2.6, your best bet is to use the patches that are merged against
Chris Mason's data logging patch set. You can get those at Chris's FTP
site[1].

For v2.4, if you're not using a SuSE kernel (which has them already),
you can get the patches from my FTP site[2].

I'm not familiar with the v4 ACL/xattr implementation, so I can't =
comment.

- -Jeff

[1] =
ftp://ftp.suse.com/pub/people/mason/patches/data-logging/experimental/
[2] ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea/v2.4/

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAbGfnLPWxlyuTD7IRAqovAKCAKpFn93wBVB/Rj9cRg57fXSx7FgCgmRcD
bjKtPjRIwLtxA7naRR/OkMw=3D
=3DDhvk
-----END PGP SIGNATURE-----



