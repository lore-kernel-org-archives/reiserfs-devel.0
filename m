From: "Willi W." <willi.w@gmx.at>
Subject: Re: Application Problems with Reiser4/19.01.2004-fixed
Date: Fri, 23 Jan 2004 12:35:44 +0100
Message-ID: <40110710.4070100@gmx.at>
References: <4010218C.9090006@gmx.at> <16400.65481.167302.617050@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16614-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16400.65481.167302.617050@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Nikita Danilov wrote:

> > * overnet cannot reload shared data from the reiser4 partition.
>
> > * azureus (a java bittorrent client) has hash problems all the time when 
>
>What are these application, and where can we obtain them from?
>  
>
overnet, small binary, closed source from 
http://download.overnet.com/overnet0.51.2.tar.gz for downloading edonkey 
files

azureus, java app, opensource from http://azureus.sourceforge.net/ for 
downloading bittorrent files (google: bittorrent)

both store parts of downloaded (p2p) data in files.

---

more info on my system:

AMD Athlon XP 1800+
*Asus 7v333 motherboard with the Via KT333 chipset 512 MB ddr-ram

*binutils-2.14.90.0.6-r6
glibc-2.3.2-r3
gcc-3.2.3-r3
linux-headers-2.6.0

system is very stable (no faulty ram, no reboots, no oops, no hdd problems)

---

btw. i did a fsck on the reiser4 disk. result (truncated):

Fscking the /dev/hdb5 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): YES
***** Openning the fs.
Reiser4 fs was detected on the /dev/hdb5.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           323a54db-01e2-4795-a30c-32204a620a11
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.4.20
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x1b044880
blocks:         3913685
free blocks:    3682103
root block:     866227
tail policy:    0x4 (smart)
next oid:       0x14561
file count:     11104
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
        Read nodes 781
        Nodes left in the tree 781
                Leaves of them 577, Twigs of them 199
        Time interval: Thu Jan 22 20:33:10 2004 - Thu Jan 22 20:33:14 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 199
        Time interval: Thu Jan 22 20:33:14 2004 - Thu Jan 22 20:33:14 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Error: Node (914913), item (1): StatData of the file
[12a68:50413136383732:12a69] has the wrong bytes (279413), Should be 
(282624).
Plugin (stat40).
Error: Node (914913), item (2): StatData of the file
[12a68:50413136383734:12a6a] has the wrong bytes (211014), Should be 
(212992).
Plugin (stat40).
Error: Node (914913), item (3): StatData of the file
[12a68:50413136383734:12a6b] has the wrong bytes (276989), Should be 
(278528).
Plugin (stat40).
Error: Node (914913), item (4): StatData of the file
[12a68:50413136383736:12a6e] has the wrong bytes (277502), Should be 
(278528).
Plugin (stat40).
Error: Node (914913), item (5): StatData of the file
[12a68:50413136383738:12a77] has the wrong bytes (274325), Should be 
(274432).
Plugin (stat40).
Error: Node (914913), item (6): StatData of the file
[12a68:50413136383739:12a78] has the wrong bytes (273219), Should be 
(274432).
Plugin (stat40).
Error: Node (914913), item (7): StatData of the file
[12a68:50413136383739:12a79] has the wrong bytes (276861), Should be 
(278528).
Plugin (stat40).
Error: Node (914913), item (8): StatData of the file
[12a68:50413136383830:12a7a] has the wrong bytes (310393), Should be 
(311296).
Plugin (stat40).

--- skipping a few lines ---

Error: Node (659617), item (13): StatData of the file
[10103:707265662e6d65:1010e] has the wrong bytes (3402), Should be 
(486). Plugin
(stat40).
Error: Node (659617), item (14): StatData of the file
[10103:73686172652e64:1010a] has the wrong bytes (336), Should be (24). 
Plugin
(stat40).
Error: Node (368471), item (7): StatData of the file
[10111:312e706172742e:10112] has the wrong bytes (279), Should be (163). 
Plugin
(stat40).
Error: Node (641915), item (1): StatData of the file
[10103:75706c6f616471:1010c] has the wrong bytes (940), Should be (100). 
Plugin
(stat40).
Error: Node (18524), item (22): StatData of the file 
[2a:7363726f6c6c6b:142a2]
has the wrong bytes (28395), Should be (28672). Plugin (stat40).
        Time interval: Thu Jan 22 20:33:14 2004 - Thu Jan 22 20:33:27 2004
***** fsck.reiser4 finished at Thu Jan 22 20:33:27 2004
Closing fs...done

11000 fixable corruptions were detected in the FileSystem. Run with 
--fix option to fix them.

