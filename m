From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Bug in scandir d_type
Date: Tue, 07 Dec 2004 12:54:11 -0500
Message-ID: <41B5EE43.7060408@suse.com>
References: <28699.80.203.27.6.1102439279.squirrel@80.203.27.6>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <28699.80.203.27.6.1102439279.squirrel@80.203.27.6>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: egilam@student.matnat.uio.no
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

egilam@student.matnat.uio.no wrote:
| Hello.
|
| I am working with a program that uses scandir, using d_type to check if a
| file has certain properties. It seems like that when used on reiserfs 3.6
| (I haven't tried any other version), the d_type field is always 0 (zero).
| When the program is moved onto an ext2 partition, it works. The example
| program in "man scandir" works also the same way (just replace d_name with
| d_type when printing out).
|
| Kernel:  2.6.8.1 with reiserfs compiled in.

The d_type feature appears to be optional. ext[23] only supports it
because the feature was tacked on later, it's protected by an
incompatible feature bit. Most other Linux filesystems only bother
returning something other than DT_UNKNOWN for . and .., which is kind of
silly.

In order to get the type information from the file/directory, it either
needs to be stored with the directory entry (disk format change
required), or readdir needs to load _every_ inode referenced by the
directory which would be an immense performance hit for such a small
corner case. ReiserFS has been in the mainline kernel for years now, and
your message is the first complaint I've seen about this feature missing.

If you truly need the type information, a more portable solution would
be to stat() each filename returned. You can generate the d_type value
as follows:

d_type = (statdata.st_mode >> 12) & 15;

So, apologies, but RESOLVED WONTFIX.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBte5DLPWxlyuTD7IRAuHjAJ44yLwCdgPh6uJBBJePesVMYPosawCglGih
XLLOgRou06bUaqW8omJBBRI=
=mJdy
-----END PGP SIGNATURE-----
