From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: fsck.reiser4-1.1.0 doesn't remove corrupted files
Date: Thu, 11 Aug 2016 16:12:36 +0200
Message-ID: <CADW=+3nf-BRyzJApVavoq-tUXNj=sAJbxqUXL=822-BCSrd7BA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=wcEB4At2mFGJriCPYK/H52Oq2VXnoln6UVyVhRiatXQ=;
        b=R8UHhrlP4qjiEB0KnMFJyA+mZCKJejsyH5a3CVxa8g4wf2L3iPcDqCGZhixINMS9RP
         ZogIge8nJAylqxTn+FXDp+x/xXT8jObR9/O+ZLuFhJvYKaslGTUozC/UG7b/cnVRowrF
         GJpwzq31zPFCCrH8jo2/pO2D30SrrCsQekvOty6YNnSnEacxk7YzEfPLfJyCzMZnp1Ee
         8okgqqXKXpMZiGk6sGvyEZ1b0z6awDR7ciBbwTnlqNtNyRmglULYXY4Ty+fYLH17WTNT
         NcFLXeFZxHL4gSh/NKWbQb1CrpLoMI8ieZTxfYh/Bk6SR5P+bJ7gHXhCa/xWgR5QNYAP
         Z96A==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>

Every time I check one same partition it warns me that same files are corrupted.
After fsck.reiser4 --build-fs those errors aren't fixed. Strangely, if
I read it correctly, one same cluster containing 3 files is corrupted.
In logs on mount:

Aug 11 16:11:15 krshina3 kernel: reiser4[mount(9121)]:
try_init_format40
(fs/reiser4/plugin/disk_format/disk_format40.c:303)[vpf-1364]:\x0aNOTICE:
Warning: mounting md125 with fatal errors, forcing read-only mount.


krshina3 dusan # fsck.reiser4 --build-fs /dev/md125
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/md125 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue?
(Yes/No): y
***** fsck.reiser4 started at Thu Aug 11 13:54:49 2016
Reiser4 fs was detected on /dev/md125.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           184e9560-bdf9-42b0-896c-0af2a0c84066
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        1
magic:          ReIsEr40FoRmAt
mkfs id:        0x2a685787
flushes:        0
blocks:         17091120
free blocks:    3030583
root block:     10465827
tail policy:    0x2 (smart)
next oid:       0x12b412f
file count:     1258379
tree height:    5
key policy:     LARGE


CHECKING THE STORAGE TREE
        Read nodes 7914473
        Nodes left in the tree 7914473
                Leaves of them 7819775, Twigs of them 93497
        Time interval: Thu Aug 11 13:54:53 2016 - Thu Aug 11 14:06:40 2016
CHECKING EXTENT REGIONS.
        Read twigs 93497
        Time interval: Thu Aug 11 14:06:40 2016 - Thu Aug 11 14:12:39 2016
LOOKING FOR UNCONNECTED NODES
        Read nodes 0
        Good nodes 0
                Leaves of them 0, Twigs of them 0
        Time interval: Thu Aug 11 14:12:39 2016 - Thu Aug 11 14:12:39 2016
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Thu Aug 11 14:12:39 2016 - Thu Aug 11 14:12:39 2016
INSERTING UNCONNECTED NODES
1. Twigs: done
2. Twigs by item: done
3. Leaves: done
4. Leaves by item: done
        Twigs: read 0, inserted 0, by item 0, empty 0
        Leaves: read 0, inserted 0, by item 0
        Time interval: Thu Aug 11 14:12:39 2016 - Thu Aug 11 14:12:39 2016
CHECKING THE SEMANTIC TREE
FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[12ad163:2e77696e646f77:12ad164] (ccreg40): the cluster at [851116032] offset
65536 bytes long is corrupted. Removed.
FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[1253cec:2e77696e646f77:1253ced] (ccreg40): the cluster at [851116032] offset
65536 bytes long is corrupted. Removed.
FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[124224e:2e77696e646f77:124224f] (ccreg40): the cluster at [851116032] offset
65536 bytes long is corrupted. Removed.
        Found 1258379 objects.
        Time interval: Thu Aug 11 14:12:39 2016 - Thu Aug 11 14:51:12 2016
CLEANING UP THE STORAGE TREE
        Removed items 0
        Time interval: Thu Aug 11 14:51:12 2016 - Thu Aug 11 15:08:59 2016
***** fsck.reiser4 finished at Thu Aug 11 15:08:59 2016
Closing fs...done

FS is consistent.

And then:

krshina3 dusan # fsck.reiser4 -y /dev/md125
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/md125 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
***** fsck.reiser4 started at Thu Aug 11 15:31:52 2016
Reiser4 fs was detected on /dev/md125.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           184e9560-bdf9-42b0-896c-0af2a0c84066
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        1
magic:          ReIsEr40FoRmAt
mkfs id:        0x2a685787
flushes:        0
blocks:         17091120
free blocks:    3030583
root block:     10465827
tail policy:    0x2 (smart)
next oid:       0x12b412f
file count:     1258379
tree height:    5
key policy:     LARGE


CHECKING THE STORAGE TREE
        Read nodes 7914473
        Nodes left in the tree 7914473
                Leaves of them 7819775, Twigs of them 93497
        Time interval: Thu Aug 11 15:31:56 2016 - Thu Aug 11 15:41:52 2016
CHECKING EXTENT REGIONS.
        Read twigs 93497
        Time interval: Thu Aug 11 15:41:52 2016 - Thu Aug 11 15:47:27 2016
CHECKING THE SEMANTIC TREE
FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[12ad163:2e77696e646f77:12ad164] (ccreg40): the cluster at [851116032]
offset 65536 bytes long
is corrupted.
FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[1253cec:2e77696e646f77:1253ced] (ccreg40): the cluster at [851116032]
offset 65536 bytes long
is corrupted.
FSCK: ccreg40_repair.c: 189: ccreg40_check_cluster: The file
[124224e:2e77696e646f77:124224f] (ccreg40): the cluster at [851116032]
offset 65536 bytes long
is corrupted.
        Found 3248399 objects (some could be encountered more then once).
        Time interval: Thu Aug 11 15:47:28 2016 - Thu Aug 11 16:07:43 2016
***** fsck.reiser4 finished at Thu Aug 11 16:07:43 2016
Closing fs...done

3 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.
