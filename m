From: "Mark M. Hoffman" <mhoffman@lightlink.com>
Subject: LVM1 snapshots and reiserfs
Date: Fri, 9 Apr 2004 15:37:49 -0400
Message-ID: <20040409193749.GA15077@earth.solarsys.private>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS <reiserfs-list@namesys.com>

Hello:

(I've already sent this to the LVM list; it was suggested that
I ask here as well.)

Sometimes, but not always, I am unable to mount a snapshot.
When it fails, I see the following lines in my logs...

kernel: reiserfs: checking transaction log (device 3a:06) ...
kernel: clm-2076: device is readonly, unable to replay log
kernel: Replay Failure, unable to mount
kernel: reiserfs_read_super: unable to initialize journal space

I am using RedHat 9 with the following stock packages:

kernel-smp-2.4.20-30.9
lvm-1.0.3-12
reiserfs-utils-3.6.4-5

I have not tried the combination of snapshots & reiserfs with
earlier RedHat packages so I don't know if this is a regression.

After some STFW, I thought I might need a "VFS lock" patch.
However, it looks like this was already included by RedHat...
in kernel-smp-2.4.20-30.9.src.rpm there is already this patch:
linux-2.4.18-lvm-VFSlock.patch.

Is there anything else I can try or look at?

Also, is it necessary that the filesystem be quiescent in order to
create a snapshot?  I could temporarily remount readonly to create
the snapshot, but I would like not to have to do that.

Thanks and regards,

-- 
Mark M. Hoffman
mhoffman@lightlink.com

