From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Problem with reiserfs
Date: Fri, 2 Jul 2004 23:09:06 +0400
Message-ID: <200407022309.06536.vitaly@namesys.com>
References: <200407021942.05459.Uwe.Beach@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19489-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407021942.05459.Uwe.Beach@gmx.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Uwe Wagner <Uwe.Beach@gmx.de>, reiserfs-list@namesys.com

On Friday 02 July 2004 21:42, Uwe Wagner wrote:
> Hi,
>
> I've problems with a reiserfs filesystem.
>
> reiserfsck --rebuild-tree -S --logfile /tmp/reiser.log /dev/hda6
>
> No reiserfs metadata found.  If you are sure that you had the reiserfs
.....


>
> the contents of /tmp/reiser.log :
>
> ####### Pass 0 #######
> block 3823602: The free space (4094) is incorrect, should be (4072) - corrected
> block 4253995: The number of items (39428) is incorrect, should be (1) - corrected
> block 4253995: The free space (1791) is incorrect, should be (720) - corrected 
> pass0: vpf-10110: block 4253995, item (0): Unknown item type found [83860229 2567307162 0x20006ff ??? (15)] - deleted
> block 9145906: The number of items (24) is incorrect, should be (1) - corrected
> block 9145906: The free space (34063) is incorrect, should be (3792) - corrected
> pass0: vpf-10110: block 9145906, item (0): Unknown item type found [4143972353 33554626 0xb4850f00 ??? (15)] - deleted
> block 19806806: The number of items (1890) is incorrect, should be (1) - corrected
> block 19806806: The free space (1) is incorrect, should be (3280) - corrected 
> pass0: vpf-10210: block 19806806, item 0: The item with wrong offset or length found [3574071296 16777405 0xf0802000018c008 DRCT (2)],
> len 768 - deleted Could not find a hash in use. Using "r5"
> ####### Pass 1 #######
> ####### Pass 2 #######
>
>
> Is there a chance to repair the filesystem ?

what you are recovering does not look like reiserfs. If you need 
our assistance here please visit www.namesys.com/support.html.

-- 
Thanks,
Vitaly Fertman

