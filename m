From: David Masover <ninja@slaphack.com>
Subject: Re: recovering from "rm -rf"
Date: Fri, 05 Aug 2005 16:39:39 -0500
Message-ID: <42F3DC9B.3010303@slaphack.com>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com>	 <42F3C73B.9040808@slaphack.com>	 <b14e81f0050805135739c94933@mail.gmail.com>	 <42F3D760.7090008@slaphack.com> <b14e81f00508051427254bb32@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25314-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00508051427254bb32@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: reiserfs-list@namesys.com

michael chang wrote:
> On 8/5/05, David Masover <ninja@slaphack.com> wrote:
> 
>>michael chang wrote:
>>
>>>On 8/5/05, David Masover <ninja@slaphack.com> wrote:
>>>
>>>
>>>>I've got a Reiser4 partition which I just moved (mv) a bunch of stuff
>>>>off of, onto another drive.  The other drive died immediately after.
>>>>
>>>>I'm trying to repair the other drive, and to find any backups, but is
>>>>there a reasonable chance to recover from the good drive?  Maybe force
>>>>fsck.reiser4 to rebuild stuff... somehow?  It's sort of the equivalent
>>>>of an "rm -rf".
>>>
>>>
>>>I have no idea what you're trying to say; can you identify your drives
>>>by e.g. Drive A and Drive B?  However, I've heard that Spinrite
>>>(grc.com) is known to be pretty good at drive recovery, and supposedly
>>>compatable with Linux partitions.  Requires an i386 compatable
>>>machine, and I believe you need Windows to write the diskette/iso
>>>which you can boot the recovery system from.  Haven't tried it though.
>>
>>I could do that, but this is Reiser4.  Does anyone but Namesys support
>>recovery from Reiser4 yet?
> 
> 
> No clue.  They'll be able to tell you, for $25, from what I've heard.

I meant more along the lines of sending in Drive B to somewhere.  The
standard procedure is to pull apart the drive and replace as much as
they need to to create an image, then start working on the image in a
fairly low-level fashion that's highly FS-dependant.

I'm figuring that if repair on Drive A fails, I'll have one of these
guys send me the raw image of Drive B, which I'll then try to repair
with fsck and such if I have to, and that's where Namesys would be a
possibility.  Of course, I still haven't given up on Drive A.

> Well, most filesystems [I don't know for sure about Reiser4] will not
> immediately clear out unused data.  However, if Drive A has been
> running for a while post "rm -rf" and has some sort of repacker
> enabled (I think they haven't implemented it yet or it was removed in
> recent versionf of Reiser4) then the data could be all gone. 
> Otherwise, I suppose if you had a backup of the metadata [which you
> probably don't], you could try recovering from that...

No, I don't.  And, Drive A wasn't running for nearly long enough, even
if the repacker was implemented -- I think it's supposed to run
something like once a week.

> As a note for the Power Plug + Sparks -- in the future, if it falls
> out, unplug BOTH ends of the cord, then plug in the end that is
> connected to the device FIRST, then the power socket/source SECOND. 
> This goes for _ALL_ electronic devices, and will save you a lot of
> hassle.  Paranoid people will also unplug electronics during a
> thunderstorm/rolling blackouts/brownouts, and get a UPS system.

No, what I should have done was pull the main power cable *immediately*,
then plugged everything back in with power off.  I'm talking about the
power cable that leads to the drive -- the four-pin molex connector --
not the big, usually black cable that leads to the box.

>>>anyways, so you shouldn't use it).  For all you know, the drive could
>>>have died because the internals wore out/broke, or because your cable
>>>died/broke/etc.
>>
>>I'm guessing that the internals did break, so I think that a recovery
>>service would probably be able to recover 100% of my data (as an image),
>>but only after replacing some parts, or even pulling the whole thing
>>apart in a cleanroom.  This would cost at least $300-500, and if it goes
>>to the cleanroom, probably $700 and up.
> 
> 
> Considering the situation, most likely you shocked (e.g. with static
> electricity or from that AC)  the motor and head and whatnot, although
> if you're lucky, the spindle containing your data will be untouched.
> In that case, a data recovery center only has to take it apart, move
> the spindle to an identical drive, and put it back in the machine
> (hopefully, without shocking it a second time).  As for drive A, you
> can ask if there is some hack to get an older version of the metadata.
>  *shrugs*

I'm counting on some combination of that and of a grep on the raw
device.  And so help me, I'm not writing a single byte more onto the
drive until I'm sure there's nothing left to recover.

>>By the way, do you know any good data recovery services?
> 
> 
> Not that I've used.  What area [e.g. country, metro area, etc.]

I was assuming I'd have to ship it.  I'm in a small town in Iowa.
