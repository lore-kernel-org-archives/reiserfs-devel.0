From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiserfs_add_entry()
Date: Sun, 28 Mar 2004 00:35:14 -0500
Message-ID: <40666412.7020107@suse.com>
References: <001501c41455$810487f0$4a28a5d1@energy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17537-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <001501c41455$810487f0$4a28a5d1@energy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jenn sirp <sirpj@ecs.csus.edu>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

jenn sirp wrote:
| Hello,
|
| I was hoping this would be a fairly easy question for you guys to
answer. I
| have been altering the code in namei.c, the function: reiserfs_add_entry.
| (version 3.6)Which apparently updates the directory entry.  I have noticed
| that when a file is written. This function is actually called four
times. Is
| this by reiser code or by the kernel?
|
| A .swp is made, then a .swx, then the actual file, and another .swp. I am
| curious as to what is going on here. Are these temporary buffers that are
| related to the journal? -- Or is the kernel controlling this behavior?

Jenn -

reiserfs_add_entry() is called exactly once any time a filename is added
to a directory. It's only called by reiserfs_create, reiserfs_mkdir,
reiserfs_mknod, reiserfs_link, reiserfs_symlink, and reiserfs_rename.
All of these functions are called via the VFS layer to perform the
filesystem-specific portion of the similarly named syscalls, and again,
only once per syscall.

The sequence of filenames you're describing seems like what vim(1), or
perhaps another text editor, does during file saves. This happens
totally in userspace as part of the application. The kernel's only
involvement here is doing what it's told.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
jeffm@suse.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAZmQSLPWxlyuTD7IRAsXMAJ9/gLg9HRMy9oh2+jAlyy7HfAgH9QCffCSB
OahGloK++DPCsL2kVb000q4=
=WcEd
-----END PGP SIGNATURE-----
