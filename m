From: Vince <fuzzy77@free.fr>
Subject: Re: Yet another oops with reiser4...
Date: Mon, 09 Feb 2004 22:03:44 +0100
Message-ID: <4027F5B0.70300@free.fr>
References: <4021964D.3030707@free.fr> <402199DD.8060508@free.fr> <200402061800.08136.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050307000205000305060705"
Return-path: <reiserfs-list-return-16739-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402061800.08136.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

--------------050307000205000305060705
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Vitaly Fertman wrote:
> Hello Vince,
> 
> would you try the fsck from the latest reiser4progs snapshot:
> http://www.namesys.com/snapshots/2004.02.06/
> 

Well I tried the new reiser4progs and the fsck did finish... but I was 
unfortunately running a kernel with the 2004.01.19-fixed snapshot and it 
looks like it was a bad idea (?). I enclose the fsck log in attachment 
in case it could help.

Then I could mount my partition but any access failed with I/O Error. :-(

Then I booted my new kernel... now mounting the partition is also ok but 
the partition looks empty... except that df reports that my files are 
still there:

/dev/ide/host0/bus1/target0/lun0/part3
                       86757988  21631724  65126264  25% /mnt/goinfre

Now, fsck -build-fs with this kernel (new snapshot) fails with:
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read REAMDE first.
*******************************************************************

Fscking the /dev/hdc3 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
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
description:    Disk-format for reiser4, ver. 0.5.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x3f7b1d62
blocks:         22826356
free blocks:    17418425
root block:     5011605
tail policy:    0x4 (smart)
next oid:       0x181c7
file count:     5026
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
         Read nodes 8460
         Nodes left in the tree 8460
                 Leaves of them 8289, Twigs of them 168
         Time interval: Mon Feb  9 21:54:24 2004 - Mon Feb  9 21:54:29 2004
***** TwigScan Pass: checking extent pointers of all twigs.
         Read twigs 168
         Time interval: Mon Feb  9 21:54:29 2004 - Mon Feb  9 21:54:30 2004
***** DiskScan Pass: scanning the partition for unconnected nodes.
         Read nodes 0
         Good nodes 0
                 Leaves of them 0, Twigs of them 0
         Time interval: Mon Feb  9 21:54:36 2004 - Mon Feb  9 21:54:36 2004
***** TwigScan Pass: checking extent pointers of all twigs.
         Read twigs 0
         Time interval: Mon Feb  9 21:54:36 2004 - Mon Feb  9 21:54:36 2004
***** AddMissing Pass: inserting unconnected nodes into the tree.
         Twigs: read 0, inserted 0, by items 0
         Leaves: read 0, inserted 0, by items 0
         Time interval: Mon Feb  9 21:54:40 2004 - Mon Feb  9 21:54:40 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Error: Semantic pass failed: cannot create 'lost+found' directory.
         Time interval: Mon Feb  9 21:54:40 2004 - Mon Feb  9 21:54:41 2004
Closing fs...done

Operational error occured while fscking.
-----------------------------------------------


Now the question is: is it still possible to recover my data on this 
partition ?

Vince


--------------050307000205000305060705
Content-Type: text/plain;
 name="fsck.reiser4.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fsck.reiser4.log"

Error: Node (4806051), item (12): StatData of the file [14557:77726974696e67:1455b] has the wrong bytes (31044), Fixed to(32768). Plugin (stat40).
Error: Node (4804565), item (2): StatData of the file [14584:626f6f742e7478:14587] has the wrong bytes (16617), Fixed to
(20480). Plugin (stat40).
Error: Directory [14584:6b676462000000:15248]: The entry "." is not found. Inserts a new one. Plugin (dir40).
Error: Node (4804565), item (3): StatData of the file [14584:6b676462000000:15248] has the wrong size (11), Fixed to (9).Plugin (stat40).
Error: Node (4804565), item (3): StatData of the file [14584:6b676462000000:15248] has the wrong bytes (550), Fixed to
(450). Plugin (stat40).
Error: Node (3847317), item (7): StatData of the file [15248:6b6764622e7478:15250] has the wrong bytes (32895), Fixed to
(0). Plugin (stat40).
Error: Node (3847317), item (9): StatData of the file [15248:6c6f61646d6f64:15251] has the wrong bytes (2065), Fixed to
(920). Plugin (stat40).
Error: Node (4806088), item (3): StatData of the file [1447b:61746172696b62:14481] has the wrong bytes (26094), Fixed to
(28672). Plugin (stat40).
Error: Node (4804048), item (8): StatData of the file [1447b:6a6f7973746963:1448a] has the wrong bytes (19450), Fixed to
(20480). Plugin (stat40).
Error: Node (4804048), item (7): StatData of the file [1447b:6a6f7973746963:14488] has the wrong bytes (20645), Fixed to
(24576). Plugin (stat40).
Error: Node (4803620), item (4): StatData of the file [143dc:494e5445524641:143ec] has the wrong bytes (28512), Fixed to
(28672). Plugin (stat40).
Error: Node (4803620), item (5): StatData of the file [143dc:524541444d4500:143e5] has the wrong bytes (29286), Fixed to
(32768). Plugin (stat40).
Error: Node (4803620), item (9): StatData of the file [143dc:524541444d452e:143e3] has the wrong bytes (23885), Fixed to
(24576). Plugin (stat40).
Error: Node (4804657), item (4): StatData of the file [145ca:6d616b6566696c:145cd] has the wrong bytes (33556), Fixed to
(36864). Plugin (stat40).
Error: Node (4805967), item (8): StatData of the file [143a2:6b65726e656c2d:1460d] has the wrong bytes (36165), Fixed to
(36864). Plugin (stat40).
Error: Node (4805967), item (9): StatData of the file [143a2:6b65726e656c2d:15254] has the wrong bytes (32824), Fixed to
(36864). Plugin (stat40).
Error: Node (4804027), item (3): StatData of the file [14471:6b65726e656c2d:14472] has the wrong bytes (35338), Fixed to
(36864). Plugin (stat40).
Error: Node (4805967), item (25): StatData of the file [143a2:6d6f78612d736d:145f3] has the wrong bytes (16702), Fixed to(20480). Plugin (stat40).
Error: Node (4803668), item (8): StatData of the file [143f4:4e4150495f484f:14424] has the wrong bytes (27942), Fixed to
(28672). Plugin (stat40).
Error: Node (4803668), item (13): StatData of the file [143f4:6172636e65742d:14441] has the wrong bytes (112637), Fixed
to (114688). Plugin (stat40).
Error: Node (4803668), item (14): StatData of the file [143f4:6172636e65742e:143f9] has the wrong bytes (23990), Fixed to(24576). Plugin (stat40).
Error: Node (4803668), item (18): StatData of the file [143f4:626f6e64696e67:15258] has the wrong bytes (40017), Fixed to(40960). Plugin (stat40).
Error: Node (4803668), item (22): StatData of the file [143f4:6373383978302e:143f6] has the wrong bytes (25549), Fixed to(28672). Plugin (stat40).
Error: Node (4803669), item (4): StatData of the file [143f4:6966656e736c61:1525a] has the wrong bytes (29984), Fixed to
(32768). Plugin (stat40).
Error: Node (4803669), item (5): StatData of the file [143f4:69702d73797363:149a7] has the wrong bytes (24134), Fixed to
(24576). Plugin (stat40).
Error: Node (4803669), item (21): StatData of the file [143f4:7070705f67656e:1442e] has the wrong bytes (20793), Fixed to(24576). Plugin (stat40).
Error: Node (4803669), item (28): StatData of the file [143f4:736b39386c696e:1525d] has the wrong bytes (22435), Fixed to(24576). Plugin (stat40).
Error: Node (4803669), item (39): StatData of the file [143f4:77616e2d726f75:14405] has the wrong bytes (23446), Fixed to(24576). Plugin (stat40).
Error: Node (4803669), item (40): StatData of the file [143f4:77616e70697065:14408] has the wrong bytes (23446), Fixed to(24576). Plugin (stat40).
Error: Node (4803670), item (1): StatData of the file [143f4:7a383533306472:14401] has the wrong bytes (20515), Fixed to
(24576). Plugin (stat40).
Error: Node (4805967), item (33): StatData of the file [143a2:7061726964652e:14507] has the wrong bytes (17066), Fixed to(20480). Plugin (stat40).
Error: Node (4805967), item (35): StatData of the file [143a2:706172706f7274:145f7] has the wrong bytes (33260), Fixed to(36864). Plugin (stat40).
Error: Node (4804203), item (7): StatData of the file [144b1:44656275676769:144b4] has the wrong bytes (97266), Fixed to
(98304). Plugin (stat40).
Error: Node (4804204), item (1): StatData of the file [144b1:6364732e747874:144b7] has the wrong bytes (23004), Fixed to
(24576). Plugin (stat40).
Error: Node (4804204), item (4): StatData of the file [144b1:73333930646266:144b6] has the wrong bytes (20171), Fixed to
(20480). Plugin (stat40).
Error: Node (4803868), item (5): StatData of the file [1444b:4275734c6f6769:14454] has the wrong bytes (28487), Fixed to
(28672). Plugin (stat40).
Error: Node (4803868), item (6): StatData of the file [1444b:4368616e67654c:14451] has the wrong bytes (59959), Fixed to
(61440). Plugin (stat40).
Error: Node (4803868), item (8): StatData of the file [1444b:4368616e67654c:14460] has the wrong bytes (22777), Fixed to
(24576). Plugin (stat40).
Error: Node (4803868), item (9): StatData of the file [1444b:4368616e67654c:14465] has the wrong bytes (29463), Fixed to
(32768). Plugin (stat40).
Error: Node (4803869), item (2): StatData of the file [1444b:61696337397878:15264] has the wrong bytes (24769), Fixed to
(28672). Plugin (stat40).
Error: Node (4803869), item (4): StatData of the file [1444b:61696337787878:15265] has the wrong bytes (20394), Fixed to
(20480). Plugin (stat40).
Error: Node (4803869), item (3): StatData of the file [1444b:61696337787878:1445c] has the wrong bytes (24502), Fixed to
(24576). Plugin (stat40).
Error: Node (4803869), item (10): StatData of the file [1444b:69626d6d63612e:1445e] has the wrong bytes (77691), Fixed to(77824). Plugin (stat40).
Error: Node (4803869), item (13): StatData of the file [1444b:6e637235336338:1444c] has the wrong bytes (73828), Fixed to(77824). Plugin (stat40).
Error: Node (4803869), item (16): StatData of the file [1444b:716c6132787878:149ac] has the wrong bytes (18798), Fixed to(20480). Plugin (stat40).
Error: Node (4803869), item (21): StatData of the file [1444b:736373695f6d69:14467] has the wrong bytes (55468), Fixed to(57344). Plugin (stat40).
Error: Node (4803869), item (22): StatData of the file [1444b:73742e74787400:1444f] has the wrong bytes (22110), Fixed to(24576). Plugin (stat40).
Error: Node (4803869), item (23): StatData of the file [1444b:73796d35336338:1444e] has the wrong bytes (44886), Fixed to(45056). Plugin (stat40).
Error: Node (4803869), item (24): StatData of the file [1444b:746d736373696d:14459] has the wrong bytes (21060), Fixed to(24576). Plugin (stat40).
Error: Node (4804338), item (2): StatData of the file [144ec:414c53412d436f:15269] has the wrong bytes (44018), Fixed to
(45056). Plugin (stat40).
Error: Node (4804364), item (3): StatData of the file [144f0:177726974696e67:1526a] has the wrong bytes (193569), Fixed
to (196608). Plugin (stat40).
Error: Node (4804259), item (17): StatData of the file [144bd:4d756c7469536f:144d3] has the wrong bytes (37044), Fixed to(40960). Plugin (stat40).
Error: Node (4804260), item (9): StatData of the file [144bd:524541444d452e:144bf] has the wrong bytes (68723), Fixed to
(69632). Plugin (stat40).
Error: Node (4804251), item (3): StatData of the file [144bc:726d6539367878:144f7] has the wrong bytes (24841), Fixed to
(28672). Plugin (stat40).
Error: Node (4805968), item (22): StatData of the file [143a2:7374616c6c696f:1461d] has the wrong bytes (18411), Fixed to(20480). Plugin (stat40).
Error: Node (4804670), item (2): StatData of the file [145d0:557365724d6f64:145d1] has the wrong bytes (126697), Fixed to(126976). Plugin (stat40).
Error: Node (4804463), item (6): StatData of the file [1453b:77393936386366:149b1] has the wrong bytes (19339), Fixed to
(20480). Plugin (stat40).
Error: Node (4803579), item (1): StatData of the file [143c1:4150492e68746d:143d5] has the wrong bytes (18432), Fixed to
(20480). Plugin (stat40).
Error: Node (4803579), item (10): StatData of the file [143c1:5a6f72616e0000:15283] has the wrong bytes (22395), Fixed to(24576). Plugin (stat40).
Error: Node (4803602), item (1): StatData of the file [143c2:43617264730000:143ca] has the wrong bytes (26724), Fixed to
(28672). Plugin (stat40).
Error: Node (17293822569102704658), item (1): StatData of the file [14628:6d6d2e74787400:14629] has the wrong bytes
(6607), Fixed to (5659). Plugin (stat40).
Error: Node (3849515), item (5): StatData of the file [14945:626c6f77666973:14948] has the wrong bytes (17726), Fixed to
(20480). Plugin (stat40).
Error: Node (3849515), item (6): StatData of the file [14945:63617374352e63:14955] has the wrong bytes (35488), Fixed to
(36864). Plugin (stat40).
Error: Node (3849515), item (7): StatData of the file [14945:63617374362e63:14949] has the wrong bytes (23348), Fixed to
(24576). Plugin (stat40).
Error: Node (3849515), item (12): StatData of the file [14945:6465732e630000:1495d] has the wrong bytes (39726), Fixed to(40960). Plugin (stat40).
Error: Node (3849515), item (19): StatData of the file [14945:73657270656e74:1494c] has the wrong bytes (18144), Fixed to(0). Plugin (stat40).
Error: Node (3849515), item (23): StatData of the file [14945:7463727970742e:14956] has the wrong bytes (17957), Fixed to(0). Plugin (stat40).
Error: Node (3849515), item (24): StatData of the file [14945:7463727970742e:14957] has the wrong bytes (55003), Fixed to(0). Plugin (stat40).
Error: Node (3849515), item (25): StatData of the file [14945:74776f66697368:1495e] has the wrong bytes (45945), Fixed to(0). Plugin (stat40).
Error: Node (5388478), item (4): StatData of the file [1771c:14244204672202d:17720] has the wrong bytes (114221956),
Fixed to (114225152). Plugin (stat40).
        Removed names pointing to nowhere 35
        Time interval: Mon Feb  9 13:43:55 2004 - Mon Feb  9 13:44:46 2004
***** Cleanup Pass: cleaning up the reiser4 storage tree.
        Removed items 195
        Time interval: Mon Feb  9 13:44:47 2004 - Mon Feb  9 13:44:50 2004
***** fsck.reiser4 finished at Mon Feb  9 13:44:50 2004
Closing fs...done
 
No corruption found.
 

--------------050307000205000305060705--
