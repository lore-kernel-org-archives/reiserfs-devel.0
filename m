From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Fri, 16 Aug 2002 12:05:00 +0400
Message-ID: <200208161205.00550.vitaly@namesys.com>
References: <200208152007.42370.degerrit@web.de> <200208152253.40413.vitaly@namesys.com> <200208152329.40707.degerrit@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11203-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200208152329.40707.degerrit@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gerrit Hannaert <degerrit@web.de>, reiserfs-list@namesys.com


Hi, 

On Friday 16 August 2002 01:29, Gerrit Hannaert wrote:
> Hi again,
>
> Well, I decided to give rebuild-tree a try now, since the trouble was not
> with my binaries and I didn't know what else to do (maybe I should have
> waited). Unfortunately, it went bad after 60% or so.
>
> What is there left to do? Will rebuilding again help this time around?
>
> - Gerrit
>
>
> reiserfsck --rebuild-tree /dev/hda9
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.6.3
> ...
> Replaying journal..
> 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Thu Aug 15 23:00:03 2002
> ###########
>
> Pass 0:
> Loading on-disk bitmap .. ok, 12812325 blocks marked used
> Skipping 8749 blocks (super block, journal, bitmaps) 12803576 blocks will
> be read
> 0%....20%....40%....60%..                               left 3639489, 9322
> /sec
> bread: Cannot read a block # 10146373.

It seems your hadrddrive has badblocks. At least 10146373 block (4k size) 
cannot be read. Have a look into your syslog for any related information.
If you have a faulty hardware and you need our assistance in recovering 
from it, please visit our support page first. 

-- 

Thanks,
Vitaly Fertman
