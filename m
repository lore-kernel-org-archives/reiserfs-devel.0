From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: Snapshots a la NetApp?
Date: 24 Mar 2003 22:42:25 +0100
Message-ID: <1048542143.1332.31.camel@wusel.schnulli.de>
References: <200303221822.34401.phma@webjockey.net>
	 <33433.10.20.2.148.1048390681.squirrel@alpha>
	 <1048411014.1427.5.camel@wusel.schnulli.de>  <3E7F6F66.5050808@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13358-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E7F6F66.5050808@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: kend@xanoptix.com, reiserfs-list@namesys.com

Am Mon, 2003-03-24 um 21.49 schrieb Hans Reiser:
> Heinz-Josef Claes wrote:
> 
> >Am Son, 2003-03-23 um 04.38 schrieb kend@xanoptix.com:
> >  
> >
> >>I'm just wondering if there's any development being done on NetApp-like
> >>snapshots.  (This differs from LVM snapshots in that it's file-by-file,
> >>instead of volume based.)  If not, has anyone given it any consideration? 
> >>It would be a huge win for the RAID-in-a-box folks, and, speaking as a
> >>sysadmin, is something about which I dream frequently.
> >>
> >>Just curious...
> >>
> >>Ken D'Ambrosio
> >>Sr. SysAdmin,
> >>Xanoptix, Inc.
> >>    
> >>
> >
> >Hi,
> >you can look at the URL below. It's a kind of snapshot inspired by
> >NetApp, but has nothing to do with LVM or the filesystem. It also has a
> >different behaviour.
> >
> >  
> >
> I didn't find the magic click that gave me the design doc for 
> storebackup, could you post it to the list?

There is no design doc, because it's principal design is so simple :-).
Here is an excerpt from the README file include in the tar file at
sourceforge:

GENERAL FUNCTIONALITY
---------------------

storeBackup is a disk-to-disk backup tool for Linux. It should run on
other Unix like machines. You can directly browse through the backuped
files (locally, via NFS, via SAMBA or whatever). This gives the users
the possibility to restore files absolutely easily and fast. He/She
only has to copy (and possibly uncompress) the file. There is also a
tool for easily restoring (sub) trees for the administrator. Every
single backup of a specific time can be deleted without affecting the
other existing backups.


HOW DOES IT WORK?
-----------------

storeBackup makes a backup of a directory to another direct reachable
location. It does not care about where this location is (same disk,
another disc, via NFS over the network). You should use another disk
or better another computer to store the backup. The target directory
must be on a Unix virtual file system which supports hard links. So
backing up to a SAMBA share is not possible. Naturally, you can also
mount the source directory via NFS and backup in a local
filesystem. In this case, it's good to have a fast network.  The
backup(s) can be seen in a directory in the form date_time
(yyyy.mm.dd_hh.mm.ss) which it creates.

Implemented are several optimizations to reduce disk usage:

- The files to backup are compressed (default bzip2) as discrete files
  in the backup. Files with definable suffixes (like .gz, which is part
  of the default value) will not be compressed. It is possible to
  avoid compression in general.

- If a file with the same contents exists in the previous backup, the
  new backup will only be a hard link to the other one. (This
  mechanism depends on the contents, not on a file name or path!) If you
  rename a file or directory or move sub trees around, it will not cost
  additional space in the backup.

- You can also check older backups than the last one for files with
  the same contents. But this is normally not worth the effort. You
  can also check backups of *other* machines (or backup series)
  for files with the same contents, which can be very efficient.

- If a file with the same contents exists in the same tree to back up,
  it will be hard linked to the other one (and naturally to the older
  ones).

As a result, only changes resulting in different files were stored
(compressed) and require disk space. Normally, the required disk space
for one backup a day for 30 days is less then the required space for the
original. But this depends on the number of changes.


There are several optimizations to improve performance. Normally, the
first backup is much slower than the followings, because all the data
has to be compressed and/or copied. storeBackup is able to take
advantage of multiprocessor machines. From the second run, it should not
be a problem to get more than 100 files/sec with a normal machine of
today. This does not depend on the file size.

There is are special files in the root of the created backup called
.md5CheckSums.info and .md5CheckSums or .md5CheckSums.bz2
(default). You must not delete these files. They contain all
information about the original files. You can use this information to
write you own tools beside the existing to restore or to analyze the
backups.

When started, storeBackup will read .md5CheckSums and creates its own
databases (dbm file) in $TMPDIR or --tmpdir (default is /tmp). If you
back up a large number of files (some millions), the required space can
be several dozens of megabytes. If you do not have enough memory to
cache the dbm file, I recommend using a separate hard disk (if
available) for better performance.


LIMITATIONS
-----------

- storeBackup can backup normal files, directories, symbolic links and
  named pipes. Other file types are not supported up to now and will
  generate a warning.

- The permissions in the backup tree(s) are equal to the permissions
  in the original directory. Under special rare conditions it is
  possible, that a user cannot read one ore more of own his/her files
  in the backup. With the restore tool - storeBackupRecover.pl -
  everything is restored with the original permissions.

- storeBackup uses hard links to save disk space. Linux with ext2 file
  system supports up to 32000, reiserfs up to 64535 hard links. If
  storeBackup needs more hard links, it will write a warning and store
  a new (compressed) copy of the file. If you use ext2 for the backup,
  you have to reserve enough (static) inodes!



Hope this helps. As I wrote, it's not depending on the filesystem. It's
depending on files, while NetApp is depending on blocks. Making a
snapshot of a big database file with NetApp is a good idea. Making
backups of big database files with storebackup costs you a lot of space.

On the other side, if you change a normal text file, the block related
algorithm of NetApp will not save much blocks. Compressing the whole
file is much more efficient. And duplicated files, with exist in a great
number in a "normal" file system containing the data of many users (I
also didn't believe this :-)) are saved only once in the backup.

If you want to backup big DB files on linux, there's a better tool for
this use case which uses the algorithm of rsync and stores the original
file and a series of deltas. If I remember well it's called rdiff.
(Sorry, but I never used it.)

-- 
Heinz-Josef Claes                     hjclaes@web.de
project: http://sourceforge.net/projects/storebackup
      -> snapshot-like backup to another disk

