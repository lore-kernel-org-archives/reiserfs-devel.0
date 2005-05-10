From: Nicholas DeClario <funsac@gmail.com>
Subject: .reiserfs_priv directory removal
Date: Tue, 10 May 2005 11:55:23 -0400
Message-ID: <5b85fc6705051008555bce937@mail.gmail.com>
Reply-To: Nicholas DeClario <funsac@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

This is probably an odd question.  I am running a 2.6.5 kernel using
reiserfs version 3.6.13.  I have two reiserfs filesystems.  I need to
mount these filesystems under a 2.4.22 kernel with reiserfs version
3.6.2. Then another system mounts them in 2.6.5 and then they are
brought back to the original 2.4.22.  The reiserfs filesystems were
originally created under 2.4.22 using the 3.6.2 tools.

When mounted under the original 2.4.22 system a directory appears in
the root of the filesystem '.reiserfs_priv'.  From doing some research
I understand that this directory is for storing xarg and acl
information for the partition.

My problem is it appears that reiserfs 3.6.2 under kernel 2.4.22 does
not require this hidden directory structure.  What I would like to be
able to do is delete this entire structure while still booted in my
2.6.5 based system so that when the filesystems are later mounted in
2.4.22 the directory structure no longer exists.  I won't need to use
those filesystems anymore under 2.6.5 after deleting those
directories.  Pretty much I want to delete them and then unmount the
partitions.  I can't seem to find a way to do this using user space
tools.  I tried different mount options as well with no success.  Any
suggestions would be greatly appreciated.

Thanks,
Nick
