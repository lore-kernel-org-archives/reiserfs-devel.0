From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: reiser4 panicked cowardly: assertion failed: hint->blk < reiser4_block_count(super)
Date: Tue, 7 Jun 2005 14:17:29 +0300
Message-ID: <200506071417.29559.rmeijer@internet.gr>
References: <20050605165029.386dc82e.reiser4@blinkenlights.ch> <200506071432.11752.vitaly@namesys.com> <20050607141018.76096dc6.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24342-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050607141018.76096dc6.reiser4@blinkenlights.ch>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 7 June 2005 15:10, Adrian Ulrich wrote:

> Ok, but i think it's still strange:
>
> This message only re-appears if i do a:
>
>  mount -o ro /dev/md1 /somewhere
>  mount -o remount,rw /dev/md1 /somewhere  <--- !!!
>  umount /dev/md1
>  fsck.reiser4 /dev/md1   <-- fsck will complain..

What happens if you do:

mount -o ro /dev/md1 /somewhere
mount -o remount,rw /dev/md1      <--- (no '/somewhere' !!!)
umount /dev/md1
fsck.reiser4 /dev/md1

???


Ray
