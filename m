From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: reiserfsprogs 3.6.5-pre2 release.
Date: 4 Mar 2003 19:50:32 -0500
Message-ID: <b43hko$qeg$1@satsuki.furryterror.org>
References: <200302251650.22469.vitaly@namesys.com>
Return-path: <reiserfs-list-return-13064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <200302251650.22469.vitaly@namesys.com>,
Vitaly Fertman  <vitaly@namesys.com> wrote:
>this new pre-release includes:
>- reiserfsck -a (started at boot) replays journal, checks error flags in 
>the superblock, bitmaps, fs size, 2 levels of internal tree and switches 
>to fixble mode if any problem is detected. For root fs fixable cannot be 
>performed (as fs is mounted) and just --check will be done.

I get:

	Checking all file systems...                                                    
	fsck 1.27 (8-Mar-2002)                                                          
	Reiserfs super block in block 16 on 0x902 of format 3.6 with standard journal   
	Blocks (total/free): 32848/22393 by 4096 bytes                                  
	Filesystem is cleanly umounted                                                  
											
	flush_buffers: device is not specifed                                           
	Warning... fsck.reiserfs for device /dev/md2 exited with signal 6.              
	Reiserfs super block in block 16 on 0x900 of format 3.6 with standard journal   
	Blocks (total/free): 37446896/1277098 by 4096 bytes                             
	Filesystem is cleanly umounted                                                  
											
	flush_buffers: device is not specifed                                           
	Warning... fsck.reiserfs for device /dev/md0 exited with signal 6.              
											
	fsck failed.  Please repair manually.                                           
											
	CONTROL-D will exit from this shell and continue system startup.                
											
	Give root password for maintenance                                              
	(or type Control-D for normal startup):  

...at which point booting stops.

On another machine I get:

	Checking all file systems...
	fsck 1.27 (8-Mar-2002)
	Reiserfs super block in block 16 on 0x900 of format 3.6 with standard journal
	Blocks (total/free): 152654320/1162905 by 4096 bytes
	Filesystem is NOT cleanly umounted
	Wrong amount of used blocks. Switching to fix-fixable pass.
	###########
	reiserfsck --fix-fixable started at Tue Mar  4 19:18:18 2003
	###########

	flush_buffers: device is not specifed
	Warning... fsck.reiserfs for device /dev/md0 exited with signal 6.

	fsck failed.  Please repair manually.

	CONTROL-D will exit from this shell and continue system startup.

	Give root password for maintenance
	(or type Control-D for normal startup):

...again, booting stops.  

If I run reiserfsck --rebuild-tree from a shell, it seems to work
normally.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
