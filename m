From: Gerrit Hannaert <degerrit@web.de>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Fri, 16 Aug 2002 10:59:52 +0200
Message-ID: <3D5CBF08.4010308@web.de>
References: <200208152007.42370.degerrit@web.de> <200208152253.40413.vitaly@namesys.com> <200208152329.40707.degerrit@web.de> <200208161205.00550.vitaly@namesys.com>
Reply-To: degerrit@web.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11204-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

Hi Vitaly,

Your analysis is dead-on!

I ran reiserfsck a second time, and this time it stopped later.
The strange thing is this disk and installation are relatively new 
(March 2002), and digging back through syslogs shows occurances 
(kernel)(.*)(hda) only on:
4 May 20 (2 sectors)
370 Aug 15 (>100 different sectors involved)
34 Aug 16 (17 sectors)

...which means the problems only really started by all this fsck stuff. 
At least sectors 81170944 - 81171056 seem to be involved during 
yesterday and today. Why would these problems be so recent? The 
filesystem has been up to 95% full at times, and a lot of it is indexed 
with a web indexer daily, one would have expected this earlier, no?

I'll keep you posted if things fare worse (or better, hopefully),

- Gerrit


# first reiserfsck --rebuild-tree:

# bread: Cannot read a block # 10146373.

> Aug 15 23:16:31 luna kernel: hda: dma_intr: status=0x51 { DriveReady 
> SeekComplete Error }
> Aug 15 23:16:31 luna kernel: hda: dma_intr: error=0x40 { 
> UncorrectableError }, LBAsect=9641711
> 9, sector=81170984
> Aug 15 23:16:31 luna kernel: end_request: I/O error, dev 03:09 (hda), 
> sector 81170984

# second time:

# bread: Cannot read a block # 10146381.

> Aug 16 03:01:40 luna kernel: hda: read_intr: status=0x59 { DriveReady 
> SeekComplete DataRequest
>  Error }
> Aug 16 03:01:40 luna kernel: hda: read_intr: error=0x40 { 
> UncorrectableError }, LBAsect=964171
> 11, sector=81171048
> Aug 16 03:01:40 luna kernel: end_request: I/O error, dev 03:09 (hda), 
> sector 81171048





Vitaly Fertman wrote:

>It seems your hadrddrive has badblocks. At least 10146373 block (4k size) 
>cannot be read. Have a look into your syslog for any related information.
>If you have a faulty hardware and you need our assistance in recovering 
>from it, please visit our support page first. 
>




