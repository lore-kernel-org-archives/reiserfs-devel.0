From: "Jedi Ninja" <jedi@ninja.dynup.net>
Subject: fsck.reiser4 errors
Date: Sat, 13 Dec 2003 12:02:46 -0600
Message-ID: <20031213180246.3042.qmail@ninja.dynup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16343-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: reiserfs-list@namesys.com

trinity root # fsck.reiser4 /dev/hda8
 *** note about $25 support *** 

Fscking the /dev/hda8 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Will use (default) params.
Continue?
(Yes/No): Yes
Fatal: Device operation "read" isn't implemented.
Fatal: Can't read master super block.
Fatal: Failed to open teh master super block.
Fatal: Cannot open the FileSystem on (/dev/hda8).
Segmentation fault 

trinity root # ls -l /dev/hda8
lr-xr-xr-x    1 root ... /dev/hda8 -> ide/host0/bus0/target0/lun0/part8
trinity root # ls -l /dev/ide/host0/bus0/target0/lun0/part8
brw-------    1 root ... /dev/ide/... 

 

I get the same errors if I try to fsck the long (devfs-style) device. 

 --check
 --fix
 --build-sb
 --build-fs 

None of these work, though --build-sb says it can't find the superblock 
(after the error about read not being implemented) and offers to make a new 
one. 

I can read from the device, even make a backup, but mounting it causes 
problems (mount hangs forever).  I know I'm not supposed to keep important 
stuff there, and I do make backups, but there's still several hours of work 
on that partition.  I'm certainly willing to spend the $25 if you think you 
can get this back.  (In truth, I'd kind of rather break out the hex editor 
or a grep of the raw filesystem than nuke that partition.) 

(No PGP signature because keyring was on that partition.)
