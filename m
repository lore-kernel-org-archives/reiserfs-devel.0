From: Hans Reiser <reiser@namesys.com>
Subject: Re: Install errors, reiser3 messages
Date: Mon, 28 Feb 2005 13:52:14 -0800
Message-ID: <4223928E.6060708@namesys.com>
References: <421E71D4.7050806@linspireinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <421E71D4.7050806@linspireinc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clifford Beshers <clifford.beshers@linspireinc.com>
Cc: reiserfs-list@namesys.com

Clifford Beshers wrote:

>
> We recently rewrote our installer to use a custom program that can 
> stream a compressed iso9660 image file and unpack it to disk.  
> Previously it used rsync.  Everything seemed to be fine, but when we 
> started running it on many machines, we started encountering errors 
> like the ones shown below, the output of dmesg.
>
> At first I suspected it might be that the kernel hadn't re-read the 
> partition table, but on several installs we did not create or modify 
> that table.
>
> Anyone have any guesses as to what is going wrong?
> Again, this is reiser3.
>
>
> hda1: rw=0, want=116654088, limit=50058477
> attempt to access beyond end of device
> hda1: rw=0, want=116916232, limit=50058477
> attempt to access beyond end of device
> hda1: rw=0, want=117178376, limit=50058477
> ReiserFS: hda1: warning: sh-2029: reiserfs read_bitmaps: bitmap block 
> (#6258688) reading failed
> ReiserFS: hda1: warning: jmacd-8: reiserfs_fill_super: unable to read 
> bitmap

The above look like hardware errors from the disk drive.  There have 
been rsync related emails on this list, but let's start with a working 
disk drive, ok?

It is remotely possible that the above could be a failure to reboot 
after using fsync....

> NTFS volume version 1.2.
> NTFS-fs warning (device hda2): load_system_files(): Volume is dirty.  
> Will not be able to remount read-write.  Run chkdsk and mount in Windows.
> ReiserFS: hda1: found reiserfs format "3.6" with standard journal
> ReiserFS: hda1: using ordered data mode
> ReiserFS: hda1: journal params: device hda1, size 8192, journal first 
> block 18, max trans len 1024, max batch 900, max commit age 30, max 
> trans age 30
> ReiserFS: hda1: checking transaction log (hda1)
> ReiserFS: hda1: Using r5 hash to sort names
> ReiserFS: hda1: warning: Created .reiserfs_priv on hda1 - reserved for 
> xattr storage.
> Adding 1049592k swap on /mnt/install/boot/linux-swap.swp.  Priority:-1 
> extents:215
> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
> *3.6* [7 32 0x1 DIRECT], item_len 170, item_location 3388, 
> free_space(entry_count) 65535
> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format found 
> in block 5439488. Fsck?
> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
> free_space(entry_count) 65535
> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format found 
> in block 5439488. Fsck?
> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
> free_space(entry_count) 65535
> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format found 
> in block 5439488. Fsck?
> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
> free_space(entry_count) 65535
> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format found 
> in block 5439488. Fsck?
> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
> free_space(entry_count) 65535
> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format found 
> in block 5439488. Fsck?
> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
> free_space(entry_count) 65535
> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format found 
> in block 5439488. Fsck?
> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
> free_space(entry_count) 65535
> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format found 
> in block 5439488. Fsck?
>
> -- 
>
> This message contains information which may be confidential and 
> privileged. Unless you are the addressee (or authorized to receive for 
> the addressee), you may not use, copy or disclose to anyone the 
> message or any information contained in the message. If you have 
> received the message in error, please advise the sender and delete the 
> message.  Thank you.
>
>

