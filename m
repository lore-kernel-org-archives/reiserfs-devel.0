From: John Dalbec <jpdalbec@ysu.edu>
Subject: Re: quota problem
Date: Wed, 06 Nov 2002 08:29:36 -0500
Message-ID: <3DC91940.8000406@ysu.edu>
References: <20021104121034.GA96760@ppk.itb.ac.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11930-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dikshie <dikshie@ppk.itb.ac.id>
Cc: reiserfs-list@namesys.com, ext3-users@redhat.com

Dikshie wrote:
> 
> 
> Hello,
> What am I missing ?

ReiserFS treats quota information as data, not metadata.  Your quota 
file was corrupted.  Have you had any crashes lately?  You may find the 
data-logging patches to be helpful.  The "quotacheck" utility will 
rebuild the quota file; depending on the extent of corruption, you can 
expect to lose some or all information about quota limits.  However, the 
quota usage information will then be accurate.  Can you reconstruct your 
current quota limits from another source?
HTH,
John Dalbec

> 
> thanks !
> 
> -dikshie-
> 
> @fisbum:/usr/bin$ uname -a
> Linux fisbum 2.4.18 #3 Tue Mar 19 16:55:23 JAVT 2002 i686 unknown
> 
> @fisbum:/usr/bin$ mount
> /dev/hda1 on / type ext3 (rw,errors=remount-ro)
> /dev/hda3 on /usr type reiserfs (rw)
> /dev/hda5 on /home type reiserfs (rw,nosuid,usrquota)
> /dev/hda6 on /var type reiserfs (rw,usrquota)
> /dev/hda7 on /tmp type reiserfs (rw)
> /dev/hdb1 on /data1 type reiserfs (rw)
> /dev/hdb2 on /data2 type reiserfs (rw)
> /dev/hdb3 on /data3 type reiserfs (rw)
> none on /dev/pts type devpts (rw,gid=5,mode=620)
> none on /proc type proc (rw)
> 
> 
> 
> kjournald starting.  Commit interval 5 seconds
> EXT3-fs: mounted filesystem with ordered data mode.
> VFS: Mounted root (ext3 filesystem) readonly.
> Freeing unused kernel memory: 220k freed
> Adding Swap: 265064k swap-space (priority -1)
> EXT3 FS 2.4-0.9.17, 10 Jan 2002 on ide0(3,1), internal journal
> reiserfs: checking transaction log (device 03:03) ...
> Using r5 hash to sort names
> reiserfs: using 3.5.x disk format
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device 03:05) ...
> Using r5 hash to sort names
> reiserfs: using 3.5.x disk format
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device 03:06) ...
> Using r5 hash to sort names
> reiserfs: using 3.5.x disk format
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device 03:07) ...
> Using r5 hash to sort names
> reiserfs: using 3.5.x disk format
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device 03:41) ...
> Using r5 hash to sort names
> reiserfs: using 3.5.x disk format
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device 03:42) ...
> Using r5 hash to sort names
> reiserfs: using 3.5.x disk format
> ReiserFS version 3.6.25
> reiserfs: checking transaction log (device 03:43) ...
> Using r5 hash to sort names
> reiserfs: using 3.5.x disk format
> ReiserFS version 3.6.25
> VFS: Quota for id 1114 referenced but not present.
> VFS: Can't read quota structure for id 1114.
> VFS: Quota for id 1116 referenced but not present.
> VFS: Can't read quota structure for id 1116.
> VFS: Quota for id 1115 referenced but not present.
> VFS: Can't read quota structure for id 1115.
> VFS: Inserting already present quota entry (block 12).
> VFS: Error -5 occured while creating quota.
> VFS: Quota for id 1113 referenced but not present.
> VFS: Can't read quota structure for id 1113.
> VFS: Quota for id 1116 referenced but not present.
> VFS: Can't read quota structure for id 1116.
> VFS: Inserting already present quota entry (block 12).
> VFS: Error -5 occured while creating quota.
> VFS: Inserting already present quota entry (block 12).
> VFS: Error -5 occured while creating quota.
> VFS: Quota for id 1115 referenced but not present.
> VFS: Can't read quota structure for id 1115.
> VFS: Quota for id 1118 referenced but not present.
> VFS: Can't read quota structure for id 1118.
> VFS: Quota for id 1001 referenced but not present.
> VFS: Can't read quota structure for id 1001.
> VFS: Inserting already present quota entry (block 12).
> VFS: Error -5 occured while creating quota.
> VFS: Quota for id 1118 referenced but not present.
> VFS: Can't read quota structure for id 1118.
> VFS: Quota for id 1113 referenced but not present.
> VFS: Can't read quota structure for id 1113.
> VFS: Inserting already present quota entry (block 12).
> VFS: Error -5 occured while creating quota.
> VFS: Quota for id 1113 referenced but not present.
> VFS: Can't read quota structure for id 1113.
> 
> 



