From: "Matheus Izvekov" <mizvekov@gmail.com>
Subject: Re: reiser4 panic
Date: Sun, 11 Mar 2007 18:12:35 -0300
Message-ID: <305c16960703111412o5e009138q6259850db1067954@mail.gmail.com>
References: <305c16960703111212m3494130em409969e20e0f310@mail.gmail.com>
	 <45F466B9.2040408@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=PJCU7hQqpp0L1z7dqem2hZqbtrT7CCiUZXBz2dI35AzKJqSN9VcDXvG6lr+V63kighn19QUoZVYqEt0BwV38NSwrbc9lxSjGFYqK3uFaciO7EJwiVTuYLP+b/NTIWLdbyfYiB01aruBIKQLwCiC8myWmfNg05XqOkJKHED2vL5g=
In-Reply-To: <45F466B9.2040408@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-list@namesys.com

On 3/11/07, Edward Shishkin <edward@namesys.com> wrote:
> Hello Matheus,
> Unfortunately, there is no suggestions except checking this by fsck.
>
> Thanks,
> Edward.
>

Just did it, here is what i got:

FSCK: Node (3112), item (12), [123c7:1(SD):12e747561726567:5a379:0]: item has
the wrong length (56). Should be (2).
FSCK: Node (3112), item (12), [123c7:1(SD):12e747561726567:5a379:0]: broken item
found.
FSCK: Node (3112): the node is broken. Pointed from the node (14624), item (47),
unit (0). The whole subtree is skipped.
FSCK: Node (4294), item (0): Offset (12771) is wrong. Should be (28).
FSCK: Node (4294): the node is broken. Pointed from the node (24403), item (55),
unit (0). The whole subtree is skipped.
FSCK: Node (24453), item (0): Offset (0) is wrong. Should be (28).
FSCK: Node (24453): the node is broken. Pointed from the node (24411), item
(22), unit (0). The whole subtree is skipped.
FSCK: Node (30345), items (13) and (14): Wrong order of keys.
FSCK: Node (30345): the node is broken. Pointed from the node (68437), item
(26), unit (0). The whole subtree is skipped.
FSCK: Node (58606), item (0): Offset (6946) is wrong. Should be (28).
FSCK: Node (58606): the node is broken. Pointed from the node (15337), item
(39), unit (0). The whole subtree is skipped.
FSCK: Node (17165), item (3), unit (1), [1cc66:0(NAME):0:0:0]: unit offset
(29281) is wrong.
FSCK: Node (17165), item (3), unit (1), [1cc66:0(NAME):0:0:0]: unit offset
(29281) is wrong, should be (104).
FSCK: Node (17165), item (3), [1cc66:0(NAME):0:0:0]: broken item found.
FSCK: Node (17165): the node is broken. Pointed from the node (72100), item
(32), unit (0). The whole subtree is skipped.
FSCK: Node (20681), item (3), [1d328:1(SD):2e4d616e696665:3f2cf:0]: item has the
wrong length (56). Should be (2).
FSCK: Node (20681), item (3), [1d328:1(SD):2e4d616e696665:3f2cf:0]: broken item
found.
FSCK: Node (20681): the node is broken. Pointed from the node (72105), item
(25), unit (0). The whole subtree is skipped.
FSCK: Node (27567), item (0): Offset (3617) is wrong. Should be (28).
FSCK: Node (27567): the node is broken. Pointed from the node (22954), item
(31), unit (0). The whole subtree is skipped.
FSCK: Node (41824), item (2), unit (29), [30bcf:0(NAME):0:0:0]: unit offset
(7738) is wrong.
FSCK: Node (41824), item (2), unit (29), [30bcf:0(NAME):0:0:0]: unit offset
(7738) is wrong, should be (1868).
FSCK: Node (41824), item (2), [30bcf:0(NAME):0:0:0]: broken item found.
FSCK: Node (41824): the node is broken. Pointed from the node (71189), item (4),
unit (0). The whole subtree is skipped.
FSCK: Node (65820), item (0): Offset (14806) is wrong. Should be (28).
FSCK: Node (65820): the node is broken. Pointed from the node (71421), item
(29), unit (0). The whole subtree is skipped.
FSCK: Node (44979), item (0): Offset (15083) is wrong. Should be (28).
FSCK: Node (44979): the node is broken. Pointed from the node (72037), item
(49), unit (0). The whole subtree is skipped.
FSCK: Node (55661), item (14), [44215:0(NAME):0:0:0]: unit count (25185) is not
correct. Should be (3).
FSCK: Node (55661), item (14), [44215:0(NAME):0:0:0]: entries [0..0] look
corrupted.
FSCK: Node (55661), item (14), [44215:0(NAME):0:0:0]: broken item found.
FSCK: Node (55661): the node is broken. Pointed from the node (72529), item (7),
unit (0). The whole subtree is skipped.
FSCK: Node (64366): Region of items [9-10] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-11] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-12] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-13] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-14] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-15] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-16] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-17] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-18] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-19] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-20] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-21] with wrong offsets should be removed.
FSCK: Node (64366): Region of items [9-22] with wrong offsets should be removed.
FSCK: Node (64366): Free space start (3222) is wrong. Should be (1195).
FSCK: Node (64366): the node is broken. Pointed from the node (72523), item
(20), unit (0). The whole subtree is skipped.

Then i ran it with --build-fs:

FSCK: Node (3112), item (12), [123c7:1(SD):12e747561726567:5a379:0]: item has
the wrong length (56). Should be (2). Fixed.
FSCK: Node (4294), item (0): Offset (12771) is wrong. Should be (28). Fixed.
FSCK: Node (4294), item (0),
[13819:4(FB):65786d616373:17465786d616373:d00000000001381d]: does not look likea
valid (sdext_symlink) statdata extension.
FSCK: Node (4294), item (0),
[13819:4(FB):65786d616373:17465786d616373:d00000000001381d]: does not look likea
valid stat data.
FSCK: Node (4294), item (0),
[13819:4(FB):65786d616373:17465786d616373:d00000000001381d]: broken item found.
Remove it.
FSCK: Node (4294): The left delimiting key [13825:0(NAME):0:0:0] in the parent
node (24403), pos (0/4294967295) does not match the first key
[13819:4(FB):17465786d616373:1381d:43a] in the node. Fixed.
FSCK: Node (24453), item (0): Offset (0) is wrong. Should be (28). Fixed.
FSCK: Node (24453), item (0): the item of unknown plugin id (0xec44) is found.
Removed.
FSCK: Node (24453): The left delimiting key
[14ec4:4(FB):12e676c69626d6d:58b21:119] in the parent node (24411), pos
(0/4294967295) does not match the first key
[14ec4:4(FB):676c69626d6d2d:14ed0:2c2] in the node. Fixed.
FSCK: Node (30345), items (13) and (14): Wrong order of keys.
FSCK: Node (30345): the node is unrecoverable. Pointed from the node (68437),
item (26), unit (0). Removed.
FSCK: Node (58606), item (0): Offset (6946) is wrong. Should be (28). Fixed.
FSCK: Node (58606), item (0), [1b011:4(FB):67662d312e30:0:9000000000000000]:
does not look like a valid (sdext_symlink) statdata extension.
FSCK: Node (58606), item (0), [1b011:4(FB):67662d312e30:0:9000000000000000]:
does not look like a valid stat data.
FSCK: Node (58606), item (0), [1b011:4(FB):67662d312e30:0:9000000000000000]:
broken item found. Remove it.
FSCK: Node (58606): The left delimiting key [1b013:0(NAME):0:0:0] in the parent
node (15337), pos (0/4294967295) does not match the first key
[1b011:4(FB):7067662d312e30:1b018:24] in the node. Fixed.
FSCK: Node (17165), item (3), unit (1), [1cc66:0(NAME):0:0:0]: unit offset
(29281) is wrong.
FSCK: Node (17165), item (3), unit (1), [1cc66:0(NAME):0:0:0]: unit offset
(29281) is wrong, should be (104). Fixed.
FSCK: Node (20681), item (3), [1d328:1(SD):2e4d616e696665:3f2cf:0]: item has the
wrong length (56). Should be (2). Fixed.
FSCK: Node (27567), item (0): Offset (3617) is wrong. Should be (28). Fixed.
FSCK: Node (27567), item (0): the item of unknown plugin id (0x8000) is found.
Removed.
FSCK: Node (27567): The left delimiting key
[200ab:4(FB):12e6a686561642d:55395:0] in the parent node (22954), pos
(0/4294967295) does not match the first key
[200ab:4(FB):6d657461646174:200b7:70] in the node. Fixed.
FSCK: Node (41824), item (2), unit (29), [30bcf:0(NAME):0:0:0]: unit offset
(7738) is wrong.
FSCK: Node (41824), item (2), unit (29), [30bcf:0(NAME):0:0:0]: unit offset
(7738) is wrong, should be (1868). Fixed.
FSCK: Node (41824), item (2), [30bcf:0(NAME):0:0:0]: wrong order of units [28,
29]. The whole item is to be removed.
FSCK: Node (41824), item (2), [30bcf:0(NAME):0:0:0]: broken item found. Remove
it.
FSCK: Node (65820), item (0): Offset (14806) is wrong. Should be (28). Fixed.
FSCK: Node (65820): The key
[3202f:4(FB):30004368616e6765:9000000010003990:300000001000383f] of the item (0)
is broken. Fixed to [3202f:4(FB):30004368616e6765:0:300000001000383f].
FSCK: Node (65820), item (0),
[3202f:4(FB):30004368616e6765:9000000010003990:300000001000383f]: does not look
like a valid SD plugin set extention: wrong pset member count detected (8251).
FSCK: Node (65820), item (0),
[3202f:4(FB):30004368616e6765:9000000010003990:300000001000383f]: does not look
like a valid stat data.
FSCK: Node (65820), item (0),
[3202f:4(FB):30004368616e6765:9000000010003990:300000001000383f]: broken item
found. Remove it.
FSCK: Node (65820): The left delimiting key [3202f:4(FB):2e4d616e696665:77c0b:0]
in the parent node (71421), pos (0/4294967295) does not match the first key
[3202f:4(FB):2e4368616e6765:77c0a:bf9] in the node. Fixed.
FSCK: Node (44979), item (0): Offset (15083) is wrong. Should be (28). Fixed.
FSCK: Node (44979), item (0),
[32885:4(FB):6262736c6f61:12e6262736c6f61:2000000000058889]: does not look likea
valid SD plugin set extention: wrong pset member count detected (24943).
FSCK: Node (44979), item (0),
[32885:4(FB):6262736c6f61:12e6262736c6f61:2000000000058889]: does not look likea
valid stat data.
FSCK: Node (44979), item (0),
[32885:4(FB):6262736c6f61:12e6262736c6f61:2000000000058889]: broken item found.
Remove it.
FSCK: Node (44979): The left delimiting key [32888:0(NAME):0:0:0] in the parent
node (72037), pos (0/4294967295) does not match the first key
[32885:4(FB):12e6262736c6f61:58889:2e6] in the node. Fixed.
FSCK: Node (55661), item (14), [44215:0(NAME):0:0:0]: unit count (25185) is not
correct. Should be (3). Fixed.
FSCK: Node (55661), item (14), [44215:0(NAME):0:0:0]: entries [0..0] look
corrupted. Removed.
FSCK: Node (55661), item (14): the item key [44215:0:0] does not match the first
unit key [44215:2e2e0000000000:0]. Fixed.
FSCK: Node (55661), item (14), [44215:0(NAME):0:0:0]: broken item found. Remove
it.
FSCK: Node (64366): Region of items [9-10] with wrong offsets is removed.
FSCK: No 'lost+found' entry found. Building a new object with the key 2a:0:ffff.
FSCK: Failed to recognize the plugin for the directory [2a:0:ffff].
FSCK: Trying to recover the directory [2a:0:ffff] with the default
plugin--dir40.
FSCK: The file [2a:0:ffff] does not have a StatData item. Creating a new one.
Plugin dir40.
FSCK: Directory [2a:0:ffff]: The entry "." is not found. Insert a new one.
Plugin (dir40).
FSCK: Node (4171), item (1), [2a:0:ffff] (stat40): wrong size (0), Fixed to (1).
FSCK: Node (4171), item (1), [2a:0:ffff] (stat40): wrong bytes (0), Fixed to
(50).
FSCK: Node (4658), item (7), [11f0b:2e4368616e6765:3dc91] (stat40): wrong bytes
(9267577352093712), Fixed to (2686).
FSCK: Directory [11df5:7475617265672d:123c7]: can't find the object
[123c7:12e747561726567:5a379] pointed by the entry [tuareg-mode-1.46.2.ebuild].
Entry is removed.
FSCK: Node (16492), item (3), [13819:17465786d616373:1381d] (stat40): wrong size
(3178), Fixed to (1082).
FSCK: Node (16492), item (3), [13819:17465786d616373:1381d] (stat40): wrong
bytes (3178), Fixed to (1082).
FSCK: Node (30342), item (4), [19c1c:2e4d616e696665:54c85] (stat40): wrong size
(2520), Fixed to (1691).
FSCK: Node (30342), item (4), [19c1c:2e4d616e696665:54c85] (stat40): wrong bytes
(2520), Fixed to (1691).
FSCK: Node (30342), item (8), [19c1c:12e657a632d4669:54c86] (stat40): wrong size
(431), Fixed to (0).
FSCK: Node (30342), item (8), [19c1c:12e657a632d4669:54c86] (stat40): wrong
bytes (431), Fixed to (0).
FSCK: Node (30342), item (7), [19c1c:12e657a632d4669:3f7b8] (stat40): wrong size
(416), Fixed to (0).
FSCK: Node (30342), item (7), [19c1c:12e657a632d4669:3f7b8] (stat40): wrong
bytes (416), Fixed to (0).
FSCK: Directory [19c1c:66696c65730000:19c1e]: The entry "." is not found. Insert
a new one. Plugin (dir40).
FSCK: Node (30342), item (5), [19c1c:66696c65730000:19c1e] (stat40): wrong size
(2), Fixed to (1).
FSCK: Node (30342), item (5), [19c1c:66696c65730000:19c1e] (stat40): wrong bytes
(100), Fixed to (50).
FSCK: Node (30342), item (6), [19c1c:6d657461646174:19c22] (stat40): wrong size
(156), Fixed to (0).
FSCK: Node (30342), item (6), [19c1c:6d657461646174:19c22] (stat40): wrong bytes
(156), Fixed to (0).
FSCK: Directory [19c0b:657a632d4d6169:19c23]: The entry "." is not found. Insert
a new one. Plugin (dir40).
FSCK: Node (48128), item (19), [19c0b:657a632d4d6169:19c23] (stat40): wrong size
(11), Fixed to (1).
FSCK: Node (48128), item (19), [19c0b:657a632d4d6169:19c23] (stat40): wrong
bytes (550), Fixed to (50).
FSCK: Node (13639), item (10), [1b011:7067662d312e30:1b018] (stat40): wrong size
(776), Fixed to (36).
FSCK: Node (13639), item (10), [1b011:7067662d312e30:1b018] (stat40): wrong
bytes (776), Fixed to (36).
FSCK: Directory [1b2c0:706b67636f7265:3f6ab]: can't find the object
[636568632d65726:10001b1e5000:d7574692c711000] pointed by the entry [ChangeLog].
Entry is removed.
FSCK: Directory [1b2c0:706b67636f7265:3f6ab]: can't find the object
[64657:2e4d616e696665:763cd] pointed by the entry [Manifest]. Entry is removed.
FSCK: Directory [1cc64:66696c65730000:1cc66] (dir40), node [17165], item [3],
unit [1]: entry has wrong offset
[1cc66:0(NAME):1cc6400000000:1cc66100000000:6e73667500000000]. Should be
[1cc66:0(NAME):1cc641cc6616e:7366750000000000:0]. Removed.
FSCK: Node (15780), item (5), [1cc64:66696c65730000:1cc66] (stat40): wrong size
(3), Fixed to (2).
FSCK: Node (15780), item (5), [1cc64:66696c65730000:1cc66] (stat40): wrong bytes
(150), Fixed to (100).
FSCK: Node (20681), item (2), [1d328:2e4368616e6765:3f2ce] (stat40): wrong bytes
(18428729705264840704), Fixed to (1162).
FSCK: Directory [1d30d:62617373000000:1d328]: can't find the object
[1d328:2e4d616e696665:3f2cf] pointed by the entry [Manifest]. Entry is removed.
FSCK: Node (17600), item (26), [1deca:6b64656e657477:1ebc0] (stat40): wrong
bytes (4750453212010512384), Fixed to (458).
FSCK: Directory [1deca:6b646577656264:1e2bf]: can't find the object
[1e2bf:100013ffc0000000:1bf2b0000000] pointed by the entry [files]. Entry is
removed.
FSCK: Directory [1deca:6b646577656264:1e2bf]: can't find the object
[10000ffb2000000:12e6b6465770000:6a188] pointed by the entry
[kdewebdev-3.5.5.ebuild]. Entry is removed.
FSCK: Node (60725), item (7), [42ea3:70726f702d6261:42ea6] (stat40): wrong bytes
(8589934594), Fixed to (100).
FSCK: Directory [6c6e0:70726f70730000:6c6e4]: The entry "." is not found. Insert
a new one. Plugin (dir40).
FSCK: Node (64366), item (3), [6c6e0:70726f70730000:6c6e4] (stat40): wrong size
(2), Fixed to (1).
FSCK: Node (64366), item (3), [6c6e0:70726f70730000:6c6e4] (stat40): wrong bytes
(100), Fixed to (50).
FSCK: Directory [6c6e0:746d7000000000:6c6e5]: The entry "." is not found. Insert
a new one. Plugin (dir40).
FSCK: Node (64366), item (5), [6c6e0:746d7000000000:6c6e5] (stat40): wrong size
(5), Fixed to (1).
FSCK: Node (64366), item (5), [6c6e0:746d7000000000:6c6e5] (stat40): wrong bytes
(250), Fixed to (50).
FSCK: Directory [44213:746578742d6261:44215]: The entry "." is not found. Insert
a new one. Plugin (dir40).
FSCK: Node (55661), item (11), [44213:746578742d6261:44215] (stat40): wrong size
(3), Fixed to (1).
FSCK: Node (55661), item (11), [44213:746578742d6261:44215] (stat40): wrong
bytes (188), Fixed to (50).
FSCK: Node (22971), item (5), [200ab:6d657461646174:200b7] (stat40): wrong size
(227), Fixed to (112).
FSCK: Node (22971), item (5), [200ab:6d657461646174:200b7] (stat40): wrong bytes
(227), Fixed to (112).
FSCK: Node (24635), item (5), [210f3:2e4368616e6765:51dca] (stat40): wrong bytes
(12615590258671632), Fixed to (2072).
FSCK: Directory [21b5f:616d61726f6b66:6ff3c]: can't find the object
[6ff3c:66696c65730000:6ff3d] pointed by the entry [files]. Entry is removed.
FSCK: Node (29033), item (26), [26f40:2e6c7a6f2d312e:6629e] (stat40): wrong
bytes (1322849927169), Fixed to (397).
FSCK: Directory [2fc98:67636300000000:2fcae]: can't find the object
[100004bbd00:12e6763632d332e:4cfe6] pointed by the entry [gcc-3.3.2-r7.ebuild].
Entry is removed.
FSCK: Directory [2a:7669727475616c:30bcf]: The entry "." is not found. Insert a
new one. Plugin (dir40).
FSCK: Node (63234), item (13), [2a:7669727475616c:30bcf] (stat40): wrong size
(45), Fixed to (1).
FSCK: Node (63234), item (13), [2a:7669727475616c:30bcf] (stat40): wrong bytes
(2250), Fixed to (50).
FSCK: Directory [31cb8:6c696258666f6e:320c4]: can't find the object
[6258666f0000000:68e13012e6c69:e69666500000000] pointed by the entry [files].
Entry is removed.
FSCK: Directory [31cb8:6c696258666f6e:320c4]: can't find the object
[2e4d6:12e6c696258666f:68e13] pointed by the entry [libXfont-1.2.2.ebuild].
Entry is removed.
FSCK: Node (65819), item (2), [3202f:2e4368616e6765:77c0a] (stat40): wrong size
(5285), Fixed to (3065).
FSCK: Node (65819), item (2), [3202f:2e4368616e6765:77c0a] (stat40): wrong bytes
(5285), Fixed to (3065).
FSCK: Node (44570), item (8), [32885:12e6262736c6f61:58889] (stat40): wrong size
(762), Fixed to (742).
FSCK: Node (44570), item (8), [32885:12e6262736c6f61:58889] (stat40): wrong
bytes (762), Fixed to (742).
FSCK: File count 134329 is wrong. Fixed to 134318.

After that all was well.
Ive got the metadada dump of this fs before fscking it, in case anyone
is interested (7mb bz2).
