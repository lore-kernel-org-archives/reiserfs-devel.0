From: "John P. New" <jnew@hazelden.ca>
Subject: Procedure to recover a bad superblock
Date: 17 Aug 2003 10:52:16 -0400
Message-ID: <1061131936.3001.8.camel@headoffice.hazelden.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15338-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

Yesterday my UPS decided it didn't like the load it was carrying, and
unceremoniously shut off the power to my computer just as I was logging
into KDE. Upon reboot, I can no longer mount my /home partition. Here is
my system configuration:

Mandrake 9.1
Kernel 2.4.21-0.13mdk
Partitions:
hdg8      /boot      reiserfs
hdg9      /          reiserfs
hde5} md0 /mnt/LM82  reiserfs
hdg1}
hde6} md1 /home      reiserfs
hdg7}

ReiserFS 3.6.25
ReiserFSprogs 3.6.8

I know that the ReiserFS is up and running, because my md0 partition is
mounted and accessible.

I believe the following is the relevant portion of the /var/log/messages
for the next boot after the power was cut:

Aug 16 21:09:23 headoffice kernel: reiserfs: checking transaction log
(device 22:09) ...
Aug 16 21:09:23 headoffice kernel: Warning, log replay starting on
readonly filesystem
Aug 16 21:09:23 headoffice kernel: reiserfs: replayed 20 transactions in
6 seconds
Aug 16 21:09:23 headoffice kernel: Using r5 hash to sort names
Aug 16 21:09:23 headoffice kernel: ReiserFS version 3.6.25
(snip)

Aug 16 21:09:23 headoffice kernel: reiserfs: checking transaction log
(device 22:08) ...
Aug 16 21:09:23 headoffice kernel: reiserfs: replayed 2 transactions in
1 seconds
Aug 16 21:09:23 headoffice kernel: Using r5 hash to sort names
Aug 16 21:09:23 headoffice kernel: ReiserFS version 3.6.25
Aug 16 21:09:23 headoffice kernel: reiserfs: checking transaction log
(device 09:01) ...
Aug 16 21:09:23 headoffice kernel: reiserfs: replayed 4 transactions in
1 seconds
Aug 16 21:09:23 headoffice kernel: attempt to access beyond end of
device
Aug 16 21:09:23 headoffice kernel: 09:01: rw=0, want=1370749188,
(=0x51b3f904), limit=59447552
Aug 16 21:09:23 headoffice kernel: vs-13070: reiserfs_read_inode2: i/o
failure occurred trying to find stat data of [1 2 0x0 SD]
Aug 16 21:09:23 headoffice kernel: invalidate: busy buffer
Aug 16 21:09:23 headoffice last message repeated 2 times
Aug 16 21:09:23 headoffice kernel: reiserfs: checking transaction log
(device 09:00) ...
Aug 16 21:09:23 headoffice kernel: Using r5 hash to sort names
Aug 16 21:09:23 headoffice kernel: ReiserFS version 3.6.25
(snip)

Aug 16 21:09:27 headoffice kernel: read_super_block: can't find a
reiserfs filesystem on (dev 09:01, block 16, size 4096)
Aug 16 21:09:27 headoffice kernel: read_super_block: can't find a
reiserfs filesystem on (dev 09:01, block 2, size 4096)
Aug 16 21:09:27 headoffice mount: mount: wrong fs type, bad option, bad
superblock on /dev/md1,
Aug 16 21:09:27 headoffice mount:        or too many mounted file
systems
(snip)

When I try 'mount /dev/md1 -t reiserfs /home' I get the "mount: wrong fs
type..." error and the "read_super_block: can't find a reiserfs..."
entry in /var/log/messages.

I have done a 'reiserfsck --check --logfile /root/rfscheck.log /dev/md1'
with the following result:

reiserfs_open: the reiserfs superblock cannot be found on /dev/md1.
Failed to open the filesystem.
If the partition table has not been changed, and the partition is
valid  and  it really  contains  a reiserfs  partition,  then the
superblock  is corrupted and you need to run  --rebuild-sb.
Aborted (core dumped)

So, I guess I have a bad superblock on md0. I assume my next step would
be:

reiserfsck --rebuild-sb /dev/md1

Is there anything I should do to protect my data before I run this
command, and is there a possibiltity of file corruption at this point,
or is this a fairly safe step?

Thanks in advance,
-- 
John P. New <jnew@hazelden.ca>

