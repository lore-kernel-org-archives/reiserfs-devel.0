From: Vince <fuzzy77@free.fr>
Subject: fsck.reiser4 infinite loop
Date: Tue, 16 Mar 2004 15:56:13 +0100
Message-ID: <4057158D.5090201@free.fr>
References: <405597B6.1000906@free.fr> <4056DD84.2010107@free.fr> <4056E32D.5010405@free.fr> <200403161654.48374.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17247-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403161654.48374.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

Vitaly Fertman wrote:
> 
> thank you for hitting this, I have attached the updated patch for reiser4progs.
> it should cure for the problem, email me about your results please.
> 

It looks that I'm quite good at hitting bugs ;-)

Ok, yet another problem: fsck.reiser4 on my other reiser4 partition 
loops on some entry. I can pack the metadata and make it available if 
needed, for now here is the log:

Fscking the /dev/hdc3 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Openning the fs.
Reiser4 fs was detected on the /dev/hdc3.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           2c166267-3a92-488b-902f-30dc85f086f8
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.2
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x3f7b1d62
blocks:         22826356
free blocks:    18051014
root block:     6340107
tail policy:    0x4 (smart)
next oid:       0x9c389
file count:     3686
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
         Read nodes 2145
         Nodes left in the tree 2145
                 Leaves of them 2015, Twigs of them 125
         Time interval: Tue Mar 16 15:49:26 2004 - Tue Mar 16 15:49:29 2004
***** TwigScan Pass: checking extent pointers of all twigs.
         Read twigs 125
         Time interval: Tue Mar 16 15:49:29 2004 - Tue Mar 16 15:49:30 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Error: Directory [2a:4d616e61726100:103ed], plugin [dir40], node 
[3920676], item [0], unit [20]: entry
has wrong offset 
[103ed:0(NAME):14c276172742064:65206c6120466573:6600f39efe3688d0]. Should be
[103ed:0(NAME):14c276172742064:65206c6120466573:ba6f4da7b42f7420].
Error: Directory [2a:4d616e61726100:103ed], plugin [dir40], node 
[3920676], item [0], unit [25]: entry
has wrong offset 
[103ed:0(NAME):1506972616e6573:6520286c6120706c:d6bdb1be36b2b0]. Should be
[103ed:0(NAME):1506972616e6573:6520286c6120706c:d292ac7637ed80].
Error: Directory [2a:4d616e61726100:103ed], plugin [dir40], node 
[3920676], item [0], unit [26]: entry
has wrong offset 
[103ed:0(NAME):1506c616e636865:73204f726967696e:61324235cf02fffc]. Should be
[103ed:0(NAME):1506c616e636865:73204f726967696e:6131e135541a626c].
Error: Directory [2a:4d616e61726100:103ed], plugin [dir40], node 
[3920676], item [0], unit [27]: entry
has wrong offset 
[103ed:0(NAME):1506c616e636865:73204f726967696e:b084105f6fc0e590]. Should be
[103ed:0(NAME):1506c616e636865:73204f726967696e:6baf3c8eb0cabfe0].
Error: Directory [2a:4d616e61726100:103ed], plugin [dir40], node 
[3920676], item [0], unit [27]: entry
has wrong offset 
[103ed:0(NAME):1506c616e636865:73204f726967696e:b084105f6fc0e590]. Should be
[103ed:0(NAME):1506c616e636865:73204f726967696e:6baf3c8eb0cabfe0].
[-> from here, fsck.reiser4 only loops on the last entry]

