From: "David D. Huff Jr." <David.Huff@computer-critters.com>
Subject: Re: --rebuild-tree, out of disk
Date: Tue, 13 Jan 2004 19:30:16 -0500
Message-ID: <40048D98.9080301@computer-critters.com>
References: <40006BFF.2060502@computer-critters.com> <200401112326.02050.vitaly@namesys.com> <40021FA6.8010508@computer-critters.com> <200401121327.23043.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401121327.23043.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:
> On Monday 12 January 2004 07:16, David D. Huff Jr. wrote:
> 
>>Vitaly Fertman wrote:
>>
>>>>The system was using an abnormal amount of space, going through 3.8 Gig
>>>>of space in a week that could not be accounted for. I checked directory
>>>>sizes and file sizes, nothing added up to the space being used. It was
>>>>only a webserver and disk growth shouldn't have been more that 35MB a
>>>>month. I ran reiserfsck --check and it said it was OK but I knew it
>>>>wasn't so when I ran --rebuild-tree, it ran out of space.
>>>
>>>what reiserfsprogs version do you use?
>>
>>3.6.11
>>
>>
>>>did you specify any option to reiserfsck?
>>
>>Yes, --rebuild-tree
>>
>>
>>>>I'd allocated 2 Gig for swap, so I used cfdisk to reduce it to 1600 Mb
>>>>(/dev/hda2) and deleted and re-allocated the reiserfs partition
>>>>(/dev/hda1) to include the full size. When I run resize_reiserfs -f it
>>>>says to run reiserfsck --rebuild-tree. Well I've done that and received
>>>>the same out of disk condition. -That and using every other switch I can
>>>>think of. I also used gpart but it only recognized /dev/hda2 and that
>>>>there was a 27 Gig partition in front of it, then gpart would abort.
>>>
>>>so you increased the 25G fs up to 27 Gb and got out of space again,
>>>correct?
>>
>>No, it was already 27 Gig, it should have been 400 Mb larger but since
>>resize_reiserfs won't run it still reports the original size. cfdisk
>>reports the additional size correctly.
> 
> 
> oops, I wanted to ask about the partition, not fs size.
> did you run reiserfsck --rebuild-sb ? 
> If you increased the size of the partition without running resizer,
> the fs size is still the same. As you cannot run resizer -- fs is not 
> in consistent state, you should run reiserfsck --rebuild-sb to fix
> the fs size and then reiserfsck --rebuild-tree. Before rebuilding 
> the treee it would be better to zero the increased part of the 
> partition (dd if=/dev/zero ...)
> 

It all became a moot point today when I booted up the drive on the cdrom 
and the drive was gone. The last thing I ran on the drive Sunday was the 
program to report bad blocks, when it didn't find any I went on to other 
things. Today CFDISK showed a blank hard drive with no partitions. I'm 
pretty sure I really don't want anything I might recover from it now.

So another door stop was born and I'm off to rebuild the server. Thanks 
all for your help.

> Could you also run 
> 	debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
> _before_ running rebuild-sb and provide it somehow for downloading. 
> It is probably still possible to find out if there was any problem with 
> disk usage initially when reiserfsck reported no problem.
> 
> 
>>>>At this point I'm thinking it is de-allocating bad sectors as fast as
>>>>the drive can write.
>>>
>>>What do you mean by saying 'bad sectors'? Are there bad blocks on
>>>your drive or what? You should fix hardware problems first and read
>>>also http://www.namesys.com/bad-block-handling.html please.
>>
>>Thanks, I only had time to try once today and it didn't report any bad
>>blocks. Work continues as time allows.
>>
>>
>>>>For my next step I intend to dd the partition to another disk with a
>>>>larger formatted partition and try to run --rebuild tree there.
>>>
>>>I would advise to zero the rest of the 'larger partition' beyond the
>>>source partition size to avoid any possible problem of mixing your
>>>valid data with old reiserfs data existed on the 'larger partition'.
>>
>>Good idea, I was concerned about old data showing up. I'll have to read
>>up on how to zero the data, I've done that for the MBR in the past but
>>not for data.
>>
>>
>>>>For your edutainment, that bad disk is one of those IBM Deskstars
>>>>mentioned on the namesys faq I did not know that there was class action
>>>>suit pending in the matter, this is the 4th (Deskstar) drive to die less
>>>>than three years old and on short notice,(all purchased from Jan 2000
>>>>through June 2001, before their evils were known).
> 
> 


