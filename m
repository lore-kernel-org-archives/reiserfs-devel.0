From: Usuario Jose <jose@holisticas.com>
Subject: reiser filesystem crashed
Date: Thu, 13 Nov 2003 12:33:27 +0100
Message-ID: <E1AKFkr-0002Ad-00@parato.holisticas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16072-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


Hi, friends:

My copmputer has a hard disk with the following partition schema:


	/dev/hda1		windows backup
	/dev/hda2		windows xp ntfs

/dev/hda3		win95 ext'd (LBA)
	/dev/hda5		linux swap
	/dev/hda6		linux  - resiserfs

The linux partition crashed (my suspicions are after opening a 5MB pdf file=
).=20
Following are the messages given by reiserfsck:


#reiserfs --check /dev/hda6
Bad root block 4294967295=20

#reiserfs --rebuild-tree /dev/hda6
.....
Pass 0:
##### Pass 0 #####
Loading on-disk bitmap .. ok, 963801 blocks marqued used
Skipping 8406 blocks (superblock, journal.....) 955395 blocks will be read
0% =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0left =A0955077, 318 /sec
bread: Cannot read a block # 13236

Aborted

#reiserfsck --rebuild-sb /dev/hda6  ----> OK
#reiserfs --rebuild-tree /dev/hda6 =A0  -------->  same error as above.


The information in the linux partition is very important, so:
- Is there any way to recover it, to rebuild to filesystem or whatever?

Any help would be appreciated.

Thanks in advance.



