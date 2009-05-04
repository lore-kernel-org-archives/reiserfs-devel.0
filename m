From: ". ." <moonraket@hotmail.com>
Subject: attempt to access beyond end of device on encrypted harddisk with
 reiserfs
Date: Mon, 4 May 2009 10:36:55 +0000
Message-ID: <COL110-W3188747D18A2EFE3CECBE7A5680@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org



Hi,



when trying to mount decrypted devices, this appears in the logs:

May  3 11:47:04 debian kernel: ReiserFS: dm-3: found reiserfs format "3.6" with standard journal
May  3 11:47:04 debian kernel: ReiserFS: dm-3: using ordered data mode
May  3 11:47:04 debian kernel: attempt to access beyond end of device
May  3 11:47:04 debian kernel: dm-3: rw=0, want=3191529648, limit=976960845
May  3 11:47:04 debian kernel: ReiserFS: dm-3: warning: sh-459: unable to read journal header
May  3 11:47:04 debian kernel: ReiserFS: dm-3: warning: sh-2022: reiserfs_fill_super: unable to initialize journal space

The same symptoms occur with all devices that are encrypted, 6 in total.



Let me explain chronologically what happened:

- encryption of harddisks with data already on it via cryptsetup && dd

- mounting of the resulted encrypted devices give no problem

- server is shutdown to enter a new disk, when booting it was reported
that CTRL+D had to be pressed to continue after some 'maintenance'

- after bootup, when decrypting the devices and trying to mount, aforementioned messages appear in the logs


The system is debian 2.6.25.14 and reiserfs is version 1:3.6.19-6.


I checked the contents of the devices with 'strings' and got almost complete dirlistings and contents of text files, so I'm thinking data recovery is possible.
After makeing a backup of one of the devices, I checked with reiserfsck
which says the superblock has to be rebuilt, after doing so (also rebuilding the journal) it
complains that the tree has to be rebuilt.
While rebuilding (with the
extra -S flag even) one error appearing for a few 50 times is:
init_source_bitmap: Bitmap 3714 (of 32768 bits) is wrong - mark all blocks [121700352 - 121733120] as used
When finished only one file is found and put in lost+found.

Using testdisk on the image, millions of
partitions are found when doing a quick search for partitions, all
reporting sizes far over the limit (most> 13TB). At the moment it's still scanning for partitions, but as this will take a few more days I wanted to know if there are other options, like upgrading to the latest reiserfs, using --no-journal, ...


If any logs are needed, please ask.


Thanks

C.


_________________________________________________________________
Show them the way! Add maps and directions to your party invites. 
http://www.microsoft.com/windows/windowslive/products/events.aspx
