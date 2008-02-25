From: Mat <jackdachef@gmail.com>
Subject: reiser4 w. cryptcompress data-corruption (?!)
Date: Mon, 25 Feb 2008 21:51:25 +0000 (UTC)
Message-ID: <loom.20080225T213801-660@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi Edward,

I just ran into an (seemingly) data corruption incident:

here the steps to (hopefully) reproduce:

1. boot up system with reiser4-formatted root-partition (cryptcompress lzo1,
algorithm)
2. work with it, openoffice, gnome-desktop (I had compiz activated, but I'm sure
that's only worth a side-note)
3. plug in an usbstick with a large enough capacity (e.g. 4 GB) or a large
enough external usb-harddrive, now format it via
mkfs.ntfs

<-- here was the point where I made the "mistake" ;), since I was concerned of
the usbstick' life (read- and write-cycles are limited so I wanted to forcefully
quit mkfs.ntfs and re-execute it with mkfs.ntfs -f  after that didn't help and
the progress number stayed at around 81% I unplugged the usbstick ;)

4. this should lead to a similar error message like the following in dmesg:

[12423.120846] reiser4[mkfs.ntfs(22617)]: dc_check_checksum
(fs/reiser4/plugin/file/cryptcompress.c:971)[edward-156]:
[12423.120848] WARNING: Bad disk cluster checksum -1991768807, (should be
1988809339) Fsck?
[12423.120850] 
[12423.121158] reiser4[mkfs.ntfs(22617)]: reiser4_inflate_cluster
(fs/reiser4/plugin/file/cryptcompress.c:1138)[edward-1460]:
[12423.121159] WARNING: Inode 75477: disk cluster 0 looks corrupted
[12423.121307] reiser4[mkfs.ntfs(22617)]: dc_check_checksum
(fs/reiser4/plugin/file/cryptcompress.c:971)[edward-156]:
[12423.121308] WARNING: Bad disk cluster checksum -1991768807, (should be
1988809339) Fsck?
[12423.121309] 
[12423.121472] reiser4[mkfs.ntfs(22617)]: reiser4_inflate_cluster
(fs/reiser4/plugin/file/cryptcompress.c:1138)[edward-1460]:
[12423.121473] WARNING: Inode 75477: disk cluster 0 looks corrupted

5. safe your data & reboot your system with magic sysrq key
6. I booted into a livecd & checked the reiser4-partition, there was one error
(corrupted cluster or something, I'm apologize for not having noted it down ;( )
after that fsck.reiser4 --build-fs
showed thousands of errors

I'm sure it would have fixed the filesystem, however I'm dependent on this box
right now & need to work, so I played back a tarball with the system & here I am

I have to give you guys involed in reiserfs creation a compliment: my /home
partition suffered from no (0 == zero) data corruption from this incident, where
other filesystem surely would have corrupted some files (I already had similar
cases with other filesystems losing almost all data ;( )

I hope you're able to reproduce this error

comments:
this is the 2nd case of ntfs-related access/contact leading to data corruption,
I think Microsoft has included a secret data corruption mechanism in ntfs to
destroy other opensource filesystems when accessed outside of windows ;)

Thanks for your help & work

Mat

