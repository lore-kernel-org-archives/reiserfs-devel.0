From: "David D. Huff Jr." <David.Huff@computer-critters.com>
Subject: Re: --rebuild-tree, out of disk
Date: Sun, 11 Jan 2004 13:44:32 -0500
Message-ID: <40019990.8000408@computer-critters.com>
References: <40006BFF.2060502@computer-critters.com> <200401111534.07660.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16443-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401111534.07660.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:
> On Sunday 11 January 2004 00:17, David D. Huff Jr. wrote:
> 
>>I've used cfdisk to change change the size of the partition but
>>resize_resierfs fails even when -f is used.
>>
>>Any suggestions on how to minimize space usage?
> 
> 
> Did you want to shrink the partition? Looks like resize_reiserfs failed
> because you run it after the fdisk, it should be run before at shrinking.
> 
> 
>>I'd rather mark the partition clean, then run resize_reiserfs followed
>>by reiserfsck --rebuild-tree but I don't know how.
> 
> 
> I do not undestand you, have you run reiserfsck --rebuild-tree?
> What were your steps in the chronological order?
> 
The system was using an abnormal amount of space, going through 3.8 Gig 
of space in a week that could not be accounted for. I checked directory 
sizes and file sizes, nothing added up to the space being used. It was 
only a webserver and disk growth shouldn't have been more that 35MB a 
month. I ran reiserfsck --check and it said it was OK but I knew it 
wasn't so when I ran --rebuild-tree, it ran out of space.

I'd allocated 2 Gig for swap, so I used cfdisk to reduce it to 1600 Mb 
(/dev/hda2) and deleted and re-allocated the reiserfs partition 
(/dev/hda1) to include the full size. When I run resize_reiserfs -f it 
says to run reiserfsck --rebuild-tree. Well I've done that and received 
the same out of disk condition. -That and using every other switch I can 
think of. I also used gpart but it only recognized /dev/hda2 and that 
there was a 27 Gig partition in front of it, then gpart would abort.

At this point I'm thinking it is de-allocating bad sectors as fast as 
the drive can write.

For my next step I intend to dd the partition to another disk with a 
larger formatted partition and try to run --rebuild tree there.

For your edutainment, that bad disk is one of those IBM Deskstars 
mentioned on the namesys faq I did not know that there was class action 
suit pending in the matter, this is the 4th (Deskstar) drive to die less 
than three years old and on short notice,(all purchased from Jan 2000 
through June 2001, before their evils were known).

