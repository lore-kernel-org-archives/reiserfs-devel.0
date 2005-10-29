From: PFC <lists@boutiquenumerique.com>
Subject: fsck --rebuild-tree just because my battery ran out...
Date: Sun, 30 Oct 2005 00:21:03 +0200
Message-ID: <op.szfhpdihth1vuj@localhost>
References: <20051028223547.GF4180@stusta.de> <df47b87a0510282058t37e8393o60e7f592ea5b19e5@mail.gmail.com> <20051029092250.GG4180@stusta.de> <op.szejazspth1vuj@localhost> <43639EA0.5080300@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43639EA0.5080300@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, Alexander Zarochentcev <zam@namesys.com>
Cc: reiserfs-list@namesys.com


	I do not know if a laptop battery running out behaves the same as a power  
cord yanking, but this fact may be interesting :
	As I was just reading some document, with no other activity, the  
harddrive had spinned down since a while, and was NOT running (as in NOT  
spinning) when the battery ran out. So it seems, the HD had spinned down,  
while the FS was in an inconsistent state. Strange.

	This happened several times, out of which, once I had to fsck, and the  
other to --rebuild-tree.

	linux-2.6.11-cko1-swsusp2
	reiser4
	gentoo
	Centrino Pentium M laptop

cat /proc/sys/vm/laptop_mode
0

/dev/hda:
  multcount    = 16 (on)
  IO_support   =  0 (default 16-bit)
  unmaskirq    =  0 (off)
  using_dma    =  1 (on)
  keepsettings =  0 (off)
  readonly     =  0 (off)
  readahead    = 256 (on)
  geometry     = 65535/16/63, sectors = 60011642880, start = 0

I assume the disk flushes its write cache before going to standby (or else  
the manufacturers are crazy)...

	I hope this can help...

>>     Remember my message where I said reiser4 was preventing my laptop
>> from  shutting down itself ?
>>
>>     Well it turned out that, in fact, it was a stupid shfs-mount
>> process  which would refuse to die. Adding a "killall ssh" in the
>> local.stop script  is a bit violent, but perfectly functional way, to
>> bring it back to  reason. Everything now works.
>>
>>     But still, I had to fsck --rebuild-tree just because my battery
>> ran out...
>>
>>
>>
> the battery running out should not have caused you to need to do that.
>
> zam, can you do some testing of how well we handle power cord yanking
> while under load?  There are some guys at stanford who have some test
> programs for this sort of thing, I wish I could remember their name at
> the moment....http://www.materiel.net/details_VA7000BWA.html
>
> Hans
>


