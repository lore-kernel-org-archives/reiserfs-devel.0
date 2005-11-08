From: Joshua Wise <joshua@joshuawise.com>
Subject: Re: reiserfsck does not actually fix bitmap
Date: Tue, 8 Nov 2005 17:47:12 -0500 (EST)
Message-ID: <Pine.LNX.4.63.0511081729300.28446@dashnine>
References: <42CCA0B2.6030701@joshuawise.com> <1120734198.3871.134.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26817-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120734198.3871.134.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Hello --

I just created a new reiserfs partition using this same system (albeit two
new hard drives, sitting on a different controller. The drives are in a RAID
mirror.)

I got the same behavior once again, in which the system determines on boot
that there is an invalid count of free blocks, switches to --fix-fixable,
complains about differing bitmaps, reboots, and then repeats the same thing.

I'll retype the outputs from various commands below my sig. (/dev/md0 is not mounted)

The summary is:
 	* I do a reiserfsck (defaulting to --check), which complains that I
need to fix it.
 	* I fix it.
 	* I fix it again.
 	* I autocheck it, it autofixes itself.
 	* Repeat a few more times.
 	* I autocheck it, it says everything's fine.
 	* Repeat a few more times.
 	* I autocheck it, it autofixes itself.

I sent a similar email to support@namesys.com until I remembered that I has
posted this a while ago here as well.

I'm not quite sure what's going on here. I'm hoping that I'm just missing
somethingn in the command line arguments that would cause this kind of
indeterminate behavior, but I have a feeling that that's not the case.

When I --check, it gives me varying corruption counts when I run it
repeatedly. I've seen 1 corruption, then 2, then 2 again, and still 2 now,
but well, it varies :)

Retyped + cut + pasted logs follow below my sig.

joshua

root@bluefire:~ # reiserfsck /dev/md0
<...>
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10640: The on-disk and the correct bitmaps differs.
Checking Semantic tree:
finished
1 found corruptions can be fixed when running with --fix-fixable
<...>
root@bluefire:~ # reiserfsck --fix-fixable /dev/md0
<...>
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps differs.
Will be fixed later.
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem
 	Leaves 33181
 	Internal nodes 221
 	Directories 10646
 	Other files 122375
 	Data block pointers 2072215 (17 of them are zero)
 	Safe links 0
<...>
root@bluefire:~ # reiserfsck -a /dev/md0
Reiserfs super block in block 16 on 0x900 of format 3.6 with standard
journal
Blocks (total/free): 24414752/22300193 by 4096 bytes
Filesystem is clean
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Wrong amount of used blocks. Switching to the --fix-fixable mode.
<...>
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps differs.
Will be fixed later.
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem
 	Leaves 33181
 	Internal nodes 221
 	Directories 10646
 	Other files 122375
 	Data block pointers 2072215 (17 of them are zero)
 	Safe links 0
<...>
root@bluefire:~ # reiserfsck -a /dev/md0
Reiserfs super block in block 16 on 0x900 of format 3.6 with standard
journal
Blocks (total/free): 24414752/22300193 by 4096 bytes
Filesystem is clean
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Wrong amount of used blocks. Switching to the --fix-fixable mode.
<...>
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps differs.
Will be fixed later.
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem
 	Leaves 33181
 	Internal nodes 221
 	Directories 10646
 	Other files 122375
 	Data block pointers 2072215 (17 of them are zero)
 	Safe links 0
<...>
root@bluefire:~ # reiserfsck -a /dev/md0
Reiserfs super block in block 16 on 0x900 of format 3.6 with standard
journal
Blocks (total/free): 24414752/22300193 by 4096 bytes
Filesystem is clean
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
root@bluefire:~ # reiserfsck -a /dev/md0
Reiserfs super block in block 16 on 0x900 of format 3.6 with standard
journal
Blocks (total/free): 24414752/22300193 by 4096 bytes
Filesystem is clean
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
root@bluefire:~ # reiserfsck -a /dev/md0
Reiserfs super block in block 16 on 0x900 of format 3.6 with standard
journal
Blocks (total/free): 24414752/22300193 by 4096 bytes
Filesystem is clean
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
root@bluefire:~ # reiserfsck -a /dev/md0
Reiserfs super block in block 16 on 0x900 of format 3.6 with standard
journal
Blocks (total/free): 24414752/22300193 by 4096 bytes
Filesystem is clean
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Wrong amount of used blocks. Switching to the --fix-fixable mode.
<...>
Replaying journal..
Reiserfs journal '/dev/md0' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps differs.
Will be fixed later.
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem
 	Leaves 33181
 	Internal nodes 221
 	Directories 10646
 	Other files 122375
 	Data block pointers 2072215 (17 of them are zero)
 	Safe links 0
<...>

On Thu, 7 Jul 2005, Vladimir Saveliev wrote:

> Hello
>
> On Thu, 2005-07-07 at 07:25, Joshua Wise wrote:
>> Hi folks,
>>
>> I just set up a new system, and all was well, but on a boot of the
>> system a few days later, I was greeted with reiserfsck complaining that
>> the number of free blocks was incorrect, and that it wished to run
>> itself with --fix-fixable. It did so, noting that the on-disk and
>> correct bitmaps differ. It said that they will be fixed later, as shown:
>>
>> Comparing bitmaps..vpf-10630: The on-disk and the correct bitmaps
>> differs. Will be fixed later.
>>
>> The system rebooted, and it ran reiserfsck -p (or -a, I dunno which)
>> once more. Again, it said that the on-disk and correct bitmaps differed,
>> and that they would be fixed "later". This repeated until I booted into
>> a liveCD and ran reiserfsck from there.  A -p from there shows that
>> "Some corruptions on the filesystem were detected. Switching to the
>> --fix-fixable mode". When it entered --fix-fixable mode, it again
>> mentioned taht the on-disk and correct bitmaps differed, and that it
>> would fix them later, but at the end, it said "No corruptions found" and
>> made no sign that it actually fixed the bitmaps. Running reiserfsck -p
>> again showed no difference, so it seems to me like reiserfsck didn't fix
>> the bitmap when it told me it would.
>>
> If it showed no bitmap difference anymore - then it is fixed.
>
>> Does anyone have any insights as to how to get reiserfsck to actually
>> fix the problem?
>>
>
> I guess that problem is that on -p option reiserfsck gets switched to
> quiet mode which supresses some output.
> Please run
> reiserfsck /dev/hda1 to see whether /dev/hda1 has any problems.
>
>
>> Thanks,
>> joshua
>>
>
>
