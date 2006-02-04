From: Gerhard Heift <mailing-list@gheift.de>
Subject: Re: reiser4 grub patch
Date: Sat, 04 Feb 2006 17:03:10 +0100
Message-ID: <43E4D03E.2060705@gheift.de>
References: <200602031237.06515.xxlucas@seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28016-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602031237.06515.xxlucas@seznam.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: luc <xxlucas@seznam.cz>
Cc: reiserfs-list@namesys.com

luc wrote:
 > Hi,
 >
 > i have a big trouble with the grub with reiser4 patch. Look here:
 >
 > ./install.sh:
 >
 > grub> root (hd0,0)
 >  Filesystem type is ext2fs, partition type 0x83
 > grub> setup (hd0)
 >  Checking if "/boot/grub/stage1" exists... yes
 >  Checking if "/boot/grub/stage2" exists... yes
 >  Checking if "/boot/grub/e2fs_stage1_5" exists... yes
 >  Running "embed /boot/grub/e2fs_stage1_5 (hd0)"...  15 sectors are
 > embedded.
 > succeeded
 >  Running "install /boot/grub/stage1 (hd0) (hd0)1+15 p
 > (hd0,0)/boot/grub/stage /boot/grub/menu.lst"... failed
 >                                                         should be
 > stage2  ^^^^^^
 >
 >
 > without reiser4 patch works perfectly
 >
 >

I posted this bug already on the grub bug tracking system, but I think 
they ignored it there... i think it's not a bug of the patch but a bug 
of grub or the gcc optimization.

Look here:
http://savannah.gnu.org/bugs/?func=detailitem&item_id=14874

Gerhard Heift
