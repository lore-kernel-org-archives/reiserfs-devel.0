From: Dax Kelson <dax@gurulabs.com>
Subject: result of noreplay
Date: Fri, 3 May 2002 23:16:12 -0600 (MDT)
Message-ID: <Pine.LNX.4.44.0205032307120.25287-100000@mooru.gurulabs.com>
References: <Pine.LNX.4.44.0205040037160.7627-100000@manray.fourth-world.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10234-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0205040037160.7627-100000@manray.fourth-world.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>


The drive definately has bad sectors, but it isn't making any funny noises 
yet.  I think the drive is "more good than bad" as a "strings /dev/hda" 
returns lots of stuff (and then aborts on the first read error), and I can 
boot from the drive too, but mounting the / fails.

I used the patch Chris Mason posted for noreplay.  It applied with a few 
offsets to 2.4.18.

It would REALLY nice if I could recover my files by mounting the damaged 
fs, and then using "cp" to get what I can.

reiserfs: checking transaction log (device 03:03) ...
-o noreplay used to force unclean mount.  FS set to readonly
is_tree_node: node level 1 does not match to the expected one 4
vs-5150: search_by_key: invalid format found in block 14806. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to find stat 
data of [1 2 0x0 SD]
Using r5 hash to sort names
reiserfs: cannot support attributes until flag is set in super-block
ReiserFS version 3.6.25

Is there anyway I can mount using a "backup super-block" or some other 
method?

Dax

