From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Question on IICACHE and mount info (2.4.19-pre5)
Date: Fri, 05 Apr 2002 02:00:03 +0200
Message-ID: <3CACE903.30901@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

Hi!

Is there only the addidional mount option "iicache" with this patch:
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/linux-2.4.19p4-iicache-new-5.patch 
?

There were some more in the early versions of iicache, IIRC.

But at the moment it works very well with 2.4.19-pre5 + 
rml.preempt+lock-break + aa.vm-33 + some other aa patches and some akpm 
ones.

When I put ",iicache" to the fstab lines of my reiserfs partitions I 
don't get a response from

# cat "/proc/fs/reiserfs/ide0(3,11)/super"
state:  REISERFS_VALID_FS
mount options:  BORDER NO_TAILS LOG
...

# cat "/proc/fs/reiserfs/ide0(3,7)/super"
state:  REISERFS_VALID_FS
mount options:  BORDER NO_TAILS LOG
...

# cat /proc/mounts
/dev/root / reiserfs rw,noatime 0 0
/dev/hda11 /mnt/beta reiserfs rw,noatime,nosuid,nodev 0 0
...

only # mount says:
/dev/hda7 on / type reiserfs (rw,noatime,notail,iicache)
...
/dev/hda11 on /mnt/beta type reiserfs 
(rw,nosuid,nodev,noatime,notail,iicache)
...

Seems like some things have gone with the latest patches which worked 
before? It's o.k., of course, if "iicache" doesn't show up for now, I 
know it's for testing only (yes, it would be very nice!). But the 
"notail" thing worked before!


Best regards,

Manuel


