From: David Masover <ninja@slaphack.com>
Subject: Re: [PATCH] reiserfs: on-demand bitmap loading (testing only)
Date: Fri, 08 Jul 2005 11:55:31 -0500
Message-ID: <42CEB003.6060609@slaphack.com>
References: <42CC4B7F.2070506@suse.com>	<42CC5F1E.6060505@namesys.com>	<42CD528B.9040502@suse.com>	<5a59ce530507071059731b30cc@mail.gmail.com> <20050708003756.21bd4c80.petchema@concept-micro.com> <42CDB7AC.8030408@slaphack.com> <42CE06A4.8070101@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-25063-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CE06A4.8070101@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jeffrey Mahoney <jeffm@suse.com>
Cc: =?UTF-8?B?UGllcnJlIEV0Y2hlbWHDr3TDqQ==?= <petchema@concept-micro.com>, reiserfs-list@namesys.com

Jeffrey Mahoney wrote:
> David Masover wrote:
> 
>>Pierre Etchemaïté wrote:
>>
>>
>>>Le Thu, 7 Jul 2005 13:59:35 -0400, studdugie <studdugie@gmail.com> a
>>>écrit :
>>>
>>>
>>>
>>>>I agree w/ Jeff 100%. I'm not a kernel hacker, simply a user. As a
>>>>matter of fact, I was one of those people that Jeff aluded to when he
>>>>said: "There have been reports of large filesystems taking an
>>>>unacceptably long time to mount."
>>>
>>>
>>>
>>>That also makes reiserfs uncomfortable with automount devices, specially
>>>if they're bandwidth limited like external USB or firewire disks...
>>
>>
>>USB and firewire disks already take a little long to mount anyway.
>>
>>But, it is definitely a performance enhancement, or at least a tweak.
>>I'd like to see it happen -- it takes 10-15 seconds to mount my 200 gig
>>Reiser4 partition, which is unacceptabe for a desktop machine -- at
>>least, for a *linux* desktop machine.
>>
>>To keep Hans happy about the "default case", can we load the bitmap in
>>the background during boot/mount?  Basically, if it's loaded on demand,
>>then we pretend to demand each part of it, one by one.  Would that
>>considerably slow normal FS operation?  Could we defer it to when the
>>disk is idle?  (*disk*, not FS)
> 
> 
> Hi David -
> 
> The main issue I have with this is that I don't think bitmaps should be
> treated specially. They are metadata, pure and simple.

This is the philosophical reason why I like on-demand loading.  There's 
also the immediate speedup of boot.

But, I think Hans has a point that it may be better for performance to 
pre-cache them.  I would rather the default behavior be to load them on 
demand, but I can see situations where people would choose to pre-cache 
them, or even (as we do now) force them to stay in kernel memory as long 
as the FS is mounted.  But that's not a sane default.

Big hard drives on desktop machines are getting more and more common, 
and even the lowly Linux gamer doesn't want to waste the RAM he bought 
for Doom 3 on a 200 gig filesystem when he's only using 1.5 gigs of it 
at the moment.

I would guess that this is a lot more common of a scenario than massive 
2TB arrays where people can throw money (RAM) at the system to make it 
faster, in any way they can.  But even if it's not, people with 2TB 
arrays are much more likely to discover the precaching feature and turn 
it on than gamers / desktop users woud be to discover it and turn it off.

And besides, for the average desktop machine, it's latency that matters 
more than throughput.  The most noticeable latency that we can optimize 
for is boot time, the next most noticeable is launching a new app / 
changing apps.  For the average desktop user, it doesn't matter if it 
takes an extra half second to load a chunk of the bitmap in order to 
load apps, and it certainly doesn't matter if it takes an extra tenth of 
a second to load a file, but it does matter if RAM wasteage pushes an 
app into swap and it takes 5-10 seconds (at least) to switch apps, and 
it does matter if it takes 5-10-20 seconds longer to boot.

That is why I think on-demand should be default.

> The root block/node sees far more activity than any bitmap and it is not
> treated any differently than any other bit of metadata. It's simply
> requested when it is needed. If the vm has determined that the root
> block is frequently used, it stays in memory. Why should the bitmaps be
> any different?

Because bitmaps are harder to seek to?  I think that's the argument -- 
the bitmap is going to be pushed out of memory because it's used less 
frequently, but it'll take much longer to load than anything else 
because it's spread over the disk.

But, you could make a similar argument about most files.

I second the request for benchmarks.
