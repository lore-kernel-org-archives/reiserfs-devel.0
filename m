From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk <
 reiser4_block_count(super)
Date: Tue, 7 Jun 2005 18:58:13 +0200
Message-ID: <20050607185813.0ffa0f4b.reiser4@blinkenlights.ch>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch>
	<200506071432.11752.vitaly@namesys.com>
	<20050607141018.76096dc6.reiser4@blinkenlights.ch>
	<200506071417.29559.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24344-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506071417.29559.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> mount -o remount,rw /dev/md1      <--- (no '/somewhere' !!!)

Hmm... this seems to make fsck happy :)

But once i bootet using /dev/md1 as my rootfs, fsck.reiser4
complains again after the next reboot (into my rescue fs)

 -- Adrian



-- 
 We're working on it, slowly but surely...or not-so-surely in the spots
we're not so sure...               -- Larry Wall
