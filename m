From: Clifford Beshers <clifford.beshers@linspireinc.com>
Subject: Re: Install errors, reiser3 messages
Date: Tue, 01 Mar 2005 10:25:09 -0800
Message-ID: <4224B385.7080507@linspireinc.com>
References: <421E71D4.7050806@linspireinc.com> <4223928E.6060708@namesys.com> <42237B36.6050006@linspireinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42237B36.6050006@linspireinc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Clifford Beshers <clifford.beshers@linspireinc.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

progsreiserfs was the culprit.  Rebuilding with reiserfsprogs has 
restored sanity.

Clifford Beshers wrote:

> Well, I have some new info this morning.
>
> We attributed the errors to hard drive problems to start with as well, 
> but the errors were too consistent and appeared on too many machines 
> simultaneously.
>
> Over the weekend we have collected many reports of people being unable 
> to install using reiser3, but succeeding with reiser4.  This 
> eliminates both bad CD burns and hard drive errors, so I went looking 
> for another cause.
>
> Recently we included qtparted which pulls in a Debian package called 
> ``progsreiserfs'' instead of ``reiserfsprogs.''  We are investigating 
> this as the cause of the problems right now.
>
> We are seeing a behavior with the ``progsreiserfs'' tools that one 
> install will generate errors, another will succeed but take a long 
> time, and a third will succeed in the normal amount of time.  Same 
> machine, same hard disk, same CDROM.
>
> I'm including Debian's description of these packages below.
>
> Package: reiserfsprogs
> Status: install ok installed
> Priority: optional
> Section: admin
> Installed-Size: 1072
> Maintainer: Ed Boraas <ed@debian.org>
> Architecture: i386
> Version: 1:3.6.19-1
> Depends: libc6 (>= 2.3.2.ds1-4), libuuid1
> Description: User-level tools for ReiserFS filesystems
> This package contains utilities to create, check, resize, and debug 
> ReiserFS
> filesystems.
> .
> NOTE: Releases of Linux prior to 2.4.1 do not support ReiserFS on 
> their own.
> Thus, these tools will only be useful with Linux 2.4.1 or later, or if 
> your
> kernel has been built with the ReiserFS patch applied. This patch can 
> be found
> in the appropriate kernel-patch-<version>-reiserfs packages.
> .
>  Homepage: http://www.namesys.com/
>
> zz:~# apt-cache show progsreiserfs
> Package: progsreiserfs
> Version: 0.3.0.4-4
> Architecture: i386
> Priority: extra
> Section: admin
> Maintainer: Jose Luis Tallon <jltallon@adv-solutions.net>
> Depends: libc6 (>= 2.3.2.ds1-4), libreiserfs0.3-0 (>= 0.3.0), libuuid1
> Conflicts: reiserfsprogs
> Provides: reiserfsprogs
> Size: 34236
> Installed-Size: 156
> MD5sum: 57feec6fc2b48d125e755e0a2ab31bb0
> Description: Tools for manipulating ReiserFS filesystems
> progsreiserfs is a collection of tools for manipulating
> ReiserFS filesystems. There are tools to create, check,
> resize, tune and copy ReiserFS filesystems.
> .
> These tools differ from the standard Namesys ReiserFS tools
> in that they use libreiserfs to do their work.
> Filename: pool/p/progsreiserfs/progsreiserfs_0.3.0.4-4_i386.deb
>
>
>
> Hans Reiser wrote:
>
>> Clifford Beshers wrote:
>>
>>>
>>> We recently rewrote our installer to use a custom program that can 
>>> stream a compressed iso9660 image file and unpack it to disk.  
>>> Previously it used rsync.  Everything seemed to be fine, but when we 
>>> started running it on many machines, we started encountering errors 
>>> like the ones shown below, the output of dmesg.
>>>
>>> At first I suspected it might be that the kernel hadn't re-read the 
>>> partition table, but on several installs we did not create or modify 
>>> that table.
>>>
>>> Anyone have any guesses as to what is going wrong?
>>> Again, this is reiser3.
>>>
>>>
>>> hda1: rw=0, want=116654088, limit=50058477
>>> attempt to access beyond end of device
>>> hda1: rw=0, want=116916232, limit=50058477
>>> attempt to access beyond end of device
>>> hda1: rw=0, want=117178376, limit=50058477
>>> ReiserFS: hda1: warning: sh-2029: reiserfs read_bitmaps: bitmap 
>>> block (#6258688) reading failed
>>> ReiserFS: hda1: warning: jmacd-8: reiserfs_fill_super: unable to 
>>> read bitmap
>>
>>
>>
>> The above look like hardware errors from the disk drive.  There have 
>> been rsync related emails on this list, but let's start with a 
>> working disk drive, ok?
>>
>> It is remotely possible that the above could be a failure to reboot 
>> after using fsync....
>>
>>> NTFS volume version 1.2.
>>> NTFS-fs warning (device hda2): load_system_files(): Volume is 
>>> dirty.  Will not be able to remount read-write.  Run chkdsk and 
>>> mount in Windows.
>>> ReiserFS: hda1: found reiserfs format "3.6" with standard journal
>>> ReiserFS: hda1: using ordered data mode
>>> ReiserFS: hda1: journal params: device hda1, size 8192, journal 
>>> first block 18, max trans len 1024, max batch 900, max commit age 
>>> 30, max trans age 30
>>> ReiserFS: hda1: checking transaction log (hda1)
>>> ReiserFS: hda1: Using r5 hash to sort names
>>> ReiserFS: hda1: warning: Created .reiserfs_priv on hda1 - reserved 
>>> for xattr storage.
>>> Adding 1049592k swap on /mnt/install/boot/linux-swap.swp.  
>>> Priority:-1 extents:215
>>> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
>>> *3.6* [7 32 0x1 DIRECT], item_len 170, item_location 3388, 
>>> free_space(entry_count) 65535
>>> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format 
>>> found in block 5439488. Fsck?
>>> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
>>> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
>>> free_space(entry_count) 65535
>>> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format 
>>> found in block 5439488. Fsck?
>>> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
>>> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
>>> free_space(entry_count) 65535
>>> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format 
>>> found in block 5439488. Fsck?
>>> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
>>> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
>>> free_space(entry_count) 65535
>>> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format 
>>> found in block 5439488. Fsck?
>>> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
>>> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
>>> free_space(entry_count) 65535
>>> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format 
>>> found in block 5439488. Fsck?
>>> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
>>> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
>>> free_space(entry_count) 65535
>>> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format 
>>> found in block 5439488. Fsck?
>>> ReiserFS: warning: is_leaf: item location seems wrong (second one): 
>>> *3.6* [7 32 0x1 DIRECT], item_len 169, item_location 3388, 
>>> free_space(entry_count) 65535
>>> ReiserFS: hda1: warning: vs-5150: search_by_key: invalid format 
>>> found in block 5439488. Fsck?
>>>
>>> -- 
>>>
>>> This message contains information which may be confidential and 
>>> privileged. Unless you are the addressee (or authorized to receive 
>>> for the addressee), you may not use, copy or disclose to anyone the 
>>> message or any information contained in the message. If you have 
>>> received the message in error, please advise the sender and delete 
>>> the message.  Thank you.
>>>
>>>
>>
> -- 
>
> This message contains information which may be confidential and 
> privileged. Unless you are the addressee (or authorized to receive for 
> the addressee), you may not use, copy or disclose to anyone the 
> message or any information contained in the message. If you have 
> received the message in error, please advise the sender and delete the 
> message.  Thank you.

--

This message contains information which may be confidential and privileged. Unless you are the 
addressee (or authorized to receive for the addressee), you may not use, copy or disclose to anyone 
the message or any information contained in the message. If you have received the message in error, 
please advise the sender and delete the message.  Thank you.
