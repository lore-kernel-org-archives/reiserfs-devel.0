From: Silviu Marin-Caea <silviu@genesys.ro>
Subject: Bad blocks on a ReiserFS volume.  How to retrieve files?
Date: Tue, 23 Sep 2003 17:05:27 +0300
Message-ID: <3F705327.7070503@genesys.ro>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020705030605070607080205"
Return-path: <reiserfs-list-return-15728-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------020705030605070607080205
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I have a large hard-disk (120 GB) on which some blocks went bad.

Now, it cannot be mounted.  Attached is what debugreiserfs says.  What
can I do; I'm newbie to reiserfs architecture.  I thought that ReiserFS
keeps copies of the superblock or something, like ext2/3 does.

reiserfsck says "error occured looks like hardware problem.  bread
cannot read block 13271040".  That's the actual number it displays.


PS I have asked the same question on the reiserfs-list, but it's 
extremely low traffic.  Maybe someone here knows more.

Thank you

--------------020705030605070607080205
Content-Type: text/plain;
 name="debugreiser"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="debugreiser"


Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x1642 of format 3.6 with standard journal
Count of blocks on the device: 29945160
Number of bitmaps: 914
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 29154954
Root block: 14969
Filesystem is NOT clean
Tree height: 4
Hash function used to sort names: "r5"
Objectid map size 10, max 972
Journal parameters:
	Device [0x0]
	Magic [0x34ae2c74]
	Size 8193 blocks (including 1 for journal header) (first block 18)
	Max transaction length 1024 blocks
	Max batch size 900 blocks
	Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0
sb_version: 2
inode generation number: 35482
UUID: 48d29ced-fe37-4c68-adf8-32ace9f2be45
LABEL: 
Set flags in SB:
	ATTRIBUTES CLEAN


--------------020705030605070607080205--


