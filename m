From: Dan Nilsson <zyrax@home.se>
Subject: Reoccuring corruption problem
Date: Thu, 19 Aug 2004 20:46:26 +0200
Message-ID: <200408192046.27223.zyrax@home.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20409-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi!

I've been trying to cure a reoccuring file corruption problem
i have on my Gentoo box running Linux 2.6.8.1-mm1 (upgraded
from 2.6.7; made no difference).

I get corrupted directory entries behaving like this:

bash-2.05b# rm -rf dev-perl/
rm: cannot remove directory Dev-perl/': Directory not empty
bash-2.05b# cd dev-perl/ =20
bash-2.05b# ls
Curses-uI
bash-2.05b# ls -al
ls: Curses-uI: No such file or directory
total 0
drwxr-xr-x    3 root     root           80 Aug 19 20:32 .
drwxrwxrwt    8 root     root          304 Aug 19 20:32 ..

Interesting to note is that "Curses-uI" is a corrupted file name,
it usually happens to the same set of files in my /usr/portage.
Typical corruptions i get:

"ruby-progressbar" becomes "ruby-pr?gressbar"
"ruby-zlib"        becomes "ruby-zlyb"

If i reboot and use a rescue CD to run reiserfsck --rebuild-tree
the corrupted directories are deleted. However, if i delete my
/usr/portage and try to restore it with "emerge sync", the same
set of files (usually) will corrupt in exactly the same way.

This is how i can reproduce the problem:

1. Reboot to rescue CD.
2. Run reiserfsck --rebuild-tree until it reports no errors
3. Reboot computer (no CD) =20
4. Remove /usr/portage
5. emerge sync (it will fetch /usr/portage)

emerge will fail and i will be left with some corrupted directories
in the portage trees, usually the ruby-directories.

If i want to be really sure to get more corruption i just try to unpack
a kernel source tarball. It will in the same way create some corrupted
files (and usually same files every time)

=46rom my 2.6.7 configuration:

CONFIG_REISERFS_FS=3Dy
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=3Dy
CONFIG_REISERFS_FS_XATTR=3Dy
CONFIG_REISERFS_FS_POSIX_ACL=3Dy
CONFIG_REISERFS_FS_SECURITY=3Dy

Running 2.6.8.1-mm1 now with SECURITY turned off and some other settings
activated. I do not have the configuration file right here. A friend built
me that kenrel since i cannot build a kernel, unpacking the source produces
corrupted files.

I have run badblocks and memtest and they have come up with nothing.

A very strange problem, I have not read about anything similiar and I
have no clue about what might be causing it.

I made a test program creating 100000 directory entries, which i ran.=20
No problem deleting those directories. Argh.

Any ideas?

Thanks,
Dan Nilsson
