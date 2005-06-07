From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk <
 reiser4_block_count(super)
Date: Tue, 7 Jun 2005 14:10:18 +0200
Message-ID: <20050607141018.76096dc6.reiser4@blinkenlights.ch>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
	<200506071100.44749.vitaly@namesys.com>
	<20050607130111.39bda1f2.reiser4@blinkenlights.ch>
	<200506071432.11752.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24341-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506071432.11752.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com


> I am about the particular fsck message that appeares when you 
> use -5 reiser4 patch: 

Ok, but i think it's still strange:

This message only re-appears if i do a:

 mount -o ro /dev/md1 /somewhere
 mount -o remount,rw /dev/md1 /somewhere  <--- !!!
 umount /dev/md1
 fsck.reiser4 /dev/md1   <-- fsck will complain..


If i do
 mount /dev/md1 /somewhere
 umount /dev/md1
 fsck.resier4 /dev/md1

, fsck does *not* print any errors.

(I'm using -5 in both cases)




