From: Matt Stegman <matts@ksu.edu>
Subject: Re: bug report: attributes ( chattr +a ) not respected by reiserfs
 3.6, but this isn't listed in man mkreiserfs
Date: Wed, 16 Jul 2003 16:29:38 -0500 (CDT)
Message-ID: <200307162129.h6GLTcR3027410@elijah.imse.ksu.edu>
References: <200307161057.03293.marvin@synapse.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307161057.03293.marvin@synapse.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: marvin@synapse.net, Oleg Drokin <green@namesys.com>

Hello,

I get the same behaviour, but it appears that *only* the append-only
attribute is ignored. Other attributes are respected fine.  However,
there are still some wierd things with reiserfs and attributes.  This is
a pretty long email detailing what I found.



I began by making a new filesystem.

# mkreiserfs /dev/hdc1
<-------------mkreiserfs, 2003------------->
reiserfsprogs 3.6.8

mkreiserfs: Guessing about desired format.. 
mkreiserfs: Kernel 2.4.20-xfs-r3 is running.
Format 3.6 with standard journal
...<snip>...

# mount -t reiserfs -o attrs /dev/hdc1 /mnt/reiser
# cd /mnt/reiser
# echo hello > file
-bash: file: Permission denied

Huh?  I'm root, this is a new filesystem, why would permission be
denied?  Wait a minute...

# lsattr -d /mnt/reiser
suS-iadAcjIt- /mnt/reiser

Immutable (i) is set by default on new filesystems?  That's funny.  And
why are all those others set?  Anyway, the point is, immutable works
just fine.

# chattr -i /mnt/reiser
# echo hello > file
# lsattr file
s-S---dAc--t- file
# chattr +i file
# echo line2 > file
-bash: file: Permission denied

Append only (a) is not respected.

# chattr -i +a file
# lsattr file
s-S--adAc--t- file
# echo test > file
# ls -l file
-rw-r--r--    1 root     root            5 Jul 16 16:09 file

However, noatime (A) works just fine.

# date
Wed Jul 16 16:11:09 CDT 2003
# cat file
test
# ls -lu file
-rw-r--r--    1 root     root            5 Jul 16 16:09 file

Now, a quick review of the attributes listed in chattr(1):

  A : do not modify atime on file access
      Works A-OK on reiserfs.

  a : file can only be opened in append mode
      Ignored by reiserfs.

  c : automatically compress file data
      No support in reiserfs.

  D : sync directory writes (like "dirsync" option)
      I don't know if this is supported or not.

  d : tell "dump" to ignore this file
      Does dump even work on reiserfs?

  E : file has compression error
      Not applicable; no compression support.

  I : this directory is indexed with hash trees
      Works A-OK on reiserfs.

  i : immutable, file cannot be changed deleted renamed or linked to
      Works A-OK on reiserfs.

  j : apply data journalling to this file
      I don't have the data journalling patches; I don't know if this works.

  S : sync file writes (like "sync" option)
      I don't know if this is supported or not.

  s : secure delete, data blocks should be written with zeros when deallocated
      I don't know if this is supported or not.

  T : directory is top of hierarchy for orlov allocator
      Not applicable, orlov is an ext2/3 block allocator added in 2.5.46

  t : do not merge tails on this file
      I don't know if this is supported or not.

  u : allow user to undelete this file
      No support in reiserfs.

  X : compressed data may be accessed directly
      Not applicable; no compression support.

  Z : compressed file is dirty
      Not applicable; no compression support.

lets look again at the default attributes on the root of a (newly
created) reiserfs3 filesystem:

# lsattr -d /mnt/reiser
suS-iadAcjIt- /mnt/reiser

Some of these attributes make sense (tail merging, indexing), others
require patches not in any vendor kernels (journalling), others just
plain are not supported in reiserfs (compression, undelete), and some
don't make a lick of sense (immutable, noatime).  Why are all these set
on new filesystems?

Finally, 'reiserfsck --clean-attributes' will produce the following:

# umount /mnt/reiser
# reiserfsck --clean-attributes /dev/hdc1
...<snip>...
# mount -t reiserfs -o attrs /dev/hdc1 /mnt/reiser
# lsattr -d /mnt/reiser
------------- /mnt/reiser
# lsattr /mnt/reiser/file
------------- /mnt/reiser/file

-- 
    -Matt Stegman
