From: Nick Urbanik <nicku@vtc.edu.hk>
Subject: on-disk bitmap does not match to the correct one
Date: Wed, 03 Apr 2002 18:19:00 +0800
Sender: nicku@nicksbox.tyict.vtc.edu.hk
Message-ID: <3CAAD714.3223F1B6@vtc.edu.hk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Dear team,

I am concerned by a constant recurence of the output of reiserfsck run
on two of my partitions, shown at the end of this mail.

I do not understand what the bitmaps are, nor what to do about the
mismatch.

The partitions are on LVM on software RAID.

Comparing bitmaps..free block count 2991618 mismatches with a correct
one 2991883.
byte 2201: bm1: ffffffff bm2 fffffffe
byte 158584: bm1: ffffffff bm2 1f
byte 158585: bm1: ffffffff bm2 fffffffc
byte 160756: bm1: ffffffff bm2 fffffff8
byte 203250: bm1: ffffffc0 bm2 0
byte 203251: bm1: 1 bm2 0
byte 217940: bm1: fffffff0 bm2 0
byte 229067: bm1: ffffffc0 bm2 0
byte 229068: bm1: ffffffff bm2 0
byte 229069: bm1: ffffffff bm2 0
byte 229070: bm1: ffffffff bm2 0
byte 229071: bm1: ffffffff bm2 0
byte 229072: bm1: ffffffff bm2 0
byte 229073: bm1: ffffffff bm2 0
byte 229074: bm1: ffffffff bm2 0
byte 229075: bm1: ffffffff bm2 0
byte 229076: bm1: ffffffff bm2 0
byte 229077: bm1: ffffffff bm2 0
byte 229078: bm1: 3f bm2 0
byte 229079: bm1: ffffffc0 bm2 0
byte 229080: bm1: ffffffff bm2 0
byte 229081: bm1: ffffffff bm2 0
byte 229082: bm1: ffffffff bm2 0
byte 229083: bm1: ffffffff bm2 0
byte 229084: bm1: ffffffff bm2 0
byte 229085: bm1: ffffffff bm2 0
byte 229086: bm1: ffffffff bm2 0
byte 229087: bm1: 3 bm2 0
byte 230673: bm1: ffffff80 bm2 0
byte 230674: bm1: f bm2 0
byte 230727: bm1: ffffff80 bm2 0
byte 230728: bm1: 1f bm2 0
byte 230733: bm1: 10 bm2 0
byte 238268: bm1: ffffffff bm2 ffffff80
on-disk bitmap does not match to the correct one. 34 bytes differ
ok

Comparing bitmaps..free block count 2548352 mismatches with a correct
one 2548413.
byte 62468: bm1: ffffffff bm2 fffffff0
byte 65879: bm1: ffffffff bm2 f
byte 65880: bm1: ffffffff bm2 fffffffe
byte 70669: bm1: ffffffff bm2 fffffffb
byte 87339: bm1: ffffffff bm2 ffffff8f
byte 95766: bm1: ffffffff bm2 fffffffb
byte 97422: bm1: ffffffff bm2 fffffff0
byte 105022: bm1: ffffffff bm2 f
byte 105023: bm1: ffffffff bm2 fffffffc
byte 237180: bm1: ffffffff bm2 1f
byte 237181: bm1: ffffffff bm2 fffffff0
byte 238153: bm1: ffffffff bm2 ffffffe0
byte 241120: bm1: ffffffff bm2 1
byte 241369: bm1: ffffffff bm2 1f
byte 241370: bm1: ffffffff bm2 fffffffc
byte 241371: bm1: ffffffff bm2 7
byte 241372: bm1: ffffffff bm2 fffffffc
byte 245898: bm1: ffffffff bm2 3f
byte 245899: bm1: ffffffff bm2 fffffff8
byte 255969: bm1: ffffffff bm2 fffffffd
on-disk bitmap does not match to the correct one. 20 bytes differ
ok


--
Nick Urbanik   RHCE                                  nicku@vtc.edu.hk
Dept. of Information & Communications Technology
Hong Kong Institute of Vocational Education (Tsing Yi)
Tel:   (852) 2436 8576, (852) 2436 8579          Fax: (852) 2436 8526
PGP: 53 B6 6D 73 52 EE 1F EE EC F8 21 98 45 1C 23 7B     ID: 7529555D
GPG: 7FFA CDC7 5A77 0558 DC7A 790A 16DF EC5B BB9D 2C24   ID: BB9D2C24



