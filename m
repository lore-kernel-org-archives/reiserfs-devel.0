From: Philippe =?ISO-8859-15?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Subject: 2.4.22-aa1 : race ?
Date: Wed, 29 Oct 2003 17:16:15 +0100
Message-ID: <20031029171615.53e24632.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

 Hello,

We recently found several messages like this on several servers (Mysql databases) and always the guilty partition was /tmp

No obvious sign of hardware failure so far.

# /root/debugreiserfs -p /dev/sda8 | bzip2 -c > sda8.bz2
debugreiserfs 3.6.11 (2003 www.namesys.com)

Loading on-disk bitmap .. 8265 bits set - done
super block..ok
bitmaps..(9).. ok
journal (from 18 to 8210)..ok
Super block, bitmaps, journal - 8203 blocks - done, 62 blocks left
0%....20%....40%....60%....80%....100%                           left 0, 0 /sec
Packed 8204 blocks:
        compessed 1648
        full blocks 6556
                leaves with broken block head 0
                corrupted leaves 0
                internals 11
                descriptors 0
data packed with ratio 0.81


Errors in the log:

Oct 29 15:31:16 dmphpf05 kernel: is_tree_node: node level 1 does not match to the expected one 2
Oct 29 15:31:16 dmphpf05 kernel: sd(8,8):vs-5150: search_by_key: invalid format found in block 141172. Fsck?
Oct 29 15:31:16 dmphpf05 kernel: sd(8,8):vs-13060: reiserfs_update_sd: stat data of object [1 2 0x0 SD] (nlink == 3) not found (pos 0)
Oct 29 15:31:47 dmphpf05 last message repeated 186 times
Oct 29 15:32:48 dmphpf05 last message repeated 346 times
Oct 29 15:33:49 dmphpf05 last message repeated 326 times
Oct 29 15:34:50 dmphpf05 last message repeated 368 times
Oct 29 15:35:52 dmphpf05 last message repeated 344 times
etc.. until it was rebooted.

I have saved the metadata and as it contains sensitive infos ( db names ), i'll be made available upon request to people from Namesys only :)

Kernel is vanilla 2.4.22-aa1.

Thanks.

Philippe
