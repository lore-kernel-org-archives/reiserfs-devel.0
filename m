From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 status (correction)
Date: Sat, 22 Jul 2006 07:34:02 -0500
Message-ID: <44C21B3A.9050000@slaphack.com>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com>	 <44C093D2.1040703@namesys.com>	 <1153514509.6659.41.camel@ipso.snappymail.ca>	 <44C141C4.1030802@slaphack.com>	 <1153517853.6659.56.camel@ipso.snappymail.ca>	 <44C157D2.5060202@slaphack.com>	 <1153525982.6659.108.camel@ipso.snappymail.ca>	 <44C191FD.4010302@slaphack.com>  <44C1BD65.8070204@namesys.com> <1153558557.6659.152.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29136-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153558557.6659.152.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Benoit <ipso@snappymail.ca>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

Mike Benoit wrote:


> Could you not also write a small little app that gathers all kinds of
> stats about a file system and sends it to a Namesys server in hopes of
> finding better statistical data? I'm sure there are thousands of users

Assuming the results are all made available, essentially public domain. 
  If it becomes "improve Reiser" instead of "improve filesystems", then 
only fans of Reiser will do it.

>>>> A much better approach in my opinion would be to have Reiser4 perform
>>>> well in the majority of cases without the repacker, and sell the
>>>> repacker to peopleisn' something  who need that extra bit of performance. If I'm not
>>>> mistaken this is actually Hans intent.
>>>
>>> Hans?
>> Yes, that's the idea.  Only sysadmins of large corps are likely to buy. 
>> We throw in service and support as well for those who purchase it.

> Personally, as much as I would like it all to be free, I think I would
> be much more willing to pay for compression/encryption (on both servers
> and desktops) then I would be for a repacker. Hard disks cost money, and
> if I can compress the vast majority of my data and save on purchasing a
> new hard disk, that is well worth it. I also have some important data
> that I would really like to encrypt, which is also worth spending money
> on. But gaining ~10% in performance probably isn't worthwhile spending
> money on as I most likely wouldn't notice a difference in my day to day
> life, unless my server was incredibly busy. 

Assuming the performance gain is only 10%, you may be right.  Still, 
faster disks, controllers, buses, and CPUs also cost money.

I would be willing to pay for both, even, if the price was reasonable (I 
think there was a scheme based on amount of space placed under the FS?), 
and if I could be guaranteed updates (bug fixes, new kernels, etc) for 
at least the functionality that I've paid for, with no additional cost.

Reiser4 lazy writes make a huge difference on a laptop, and my current 
laptop is a Mac.  That means that around when the next Mac OS rolls out, 
it will be perfectly reasonable to spend some $50 or $100 to make my 
Linux faster instead of my Mac OS, especially since I'm trying to 
migrate off of Mac OS as much as possible.  (I miss package management.)

One more suggestion:  Maybe make it free for non-commercial use only? 
And by that I mean, based on how the FS is actually being used.  I don't 
know if piracy is or has been a problem for Namesys, but at least the 
economics of it makes sense:  A fifteen year old hacker won't want to 
pay for an FS, but might have a lot to contribute.  But if your main 
market is large servers, have those people pay -- they are running their 
business off your FS.

> There is no doubt there is a market for a repacker, but I think people
> are much more likely to spend money on something that is immediately
> tangible, like disk space instantly being free'd up by compression, or
> data instantly being encrypted. As compared to something that is much

The compression will probably mostly be about speed.  Remember, if we're 
talking about people who want to see tangible, visceral results, we're 
probably also talking about end-users.  And trust me, the vast majority 
of most of my data (as an end-user) is not very compressible.

Ok, I lied:  I love games, and you can make a very modern-looking game 
in 96K:

http://produkkt.abraxas-medien.de/kkrieger

But while that could be seen as a kind of compression, it's done by 
hand, and is fairly irrelevant to filesystems.

No, mostly we're talking about things like office documents, the 
majority of which fit in less than a gigabyte, and multimedia (music, 
movies, games) which will gain very little from compression.  If 
anything, the benefit would be mostly in compressing software.

> less tangible like fragmentation percentages and minor I/O throughput
> improvements. I used to work at a large, world wide web hosting company
> and I could see making a case to management for purchasing Reiser4
> compression would be pretty easy for our shared servers. Instantly
> freeing up large amounts of disk space (where .html/.php files were the
> vast majority) would save huge amounts of money on disk drives,
> especially since most of the servers used RAID1 and adding new drives
> was a huge pain in the neck. Making a case to purchase a repacker would
> be much, much more difficult.

Hmm, the problem is, if storage space is really the big deal, it's been 
done before, and some of these efforts are still usable and free:

http://parallel.vub.ac.be/~johan/compFUSEd/
http://www.miio.net/fusecompress/
http://north.one.pl/~kazik/pub/LZOlayer/
http://apfs.humorgraficojr.com/apfs_ingles.html

And while we're on the topic, here's an FS that does unpacking of 
archives, probably about the same way we imagined it in Reiser4 
pseudofiles/magic:

http://www.nongnu.org/unpackfs/

But regardless, as far as I can tell, the only real, tangible benefit of 
using Reiser4 compression instead of one of those four FUSE filesystems 
is speed.  Reiser4 would compress/decompress when actually hitting the 
disk, not just the FS, and it would also probably use in-kernel 
compression, rather than calling out to userspace on every FS operation.

But you see, if you're talking about speed, 10% is a respectably big 
improvement, so I could see selling them on a repacker at the same time.

Maybe bundles are a good idea...
Maybe there should be a Reiser4 Whitepaper Value Pack, once everything 
on the whitepaper is done?

> See, customers who used lots of CPU were easy to up-sell to a dedicated
> server because page load times were tangible and if they didn't move we
> would be forced to shut them off. However customers who used gobs of
> disk space were much more difficult to up-sell to dedicated servers
> because it didn't affect themselves or other customers in a tangible
> way. They wouldn't notice any difference by moving to a much more
> expensive dedicated server.

Sounds like more a marketing problem than a technical one.  Couldn't you 
just charge more on the virtual server?  Or start charging by the megabyte?

> I would like to see Namesys succeed and become incredibly profitable for
> Hans, if nothing else for the fact that he has given a huge amount to
> the open source community already. A profitable Namesys only means we'll
> have a greater chance of seeing even more interesting stuff from them in
> the future. 

Amen.
