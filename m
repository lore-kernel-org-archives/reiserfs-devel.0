From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 and ACLs
Date: Mon, 15 Aug 2005 19:21:52 -0500
Message-ID: <430131A0.4060905@slaphack.com>
References: <42FEC9F1.9040709@perkel.com>	 <b14e81f005081405316a06995c@mail.gmail.com>	 <17151.17921.996376.693013@gargle.gargle.HOWL>	 <87k6in5dri.fsf@evinrude.uhoreg.ca>	 <17152.63727.435377.223362@thebsh.namesys.com>	 <1124138041.11626.4.camel@localhost>	 <17152.65201.525419.283987@gargle.gargle.HOWL>	 <43010157.1030107@perkel.com> <43012440.8020804@slaphack.com>	 <43012598.7080207@perkel.com> <b14e81f00508151637be3d229@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25510-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00508151637be3d229@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: michael chang <thenewme91@gmail.com>
Cc: Marc Perkel <marc@perkel.com>, reiserfs-list@namesys.com

michael chang wrote:
> On 8/15/05, Marc Perkel <marc@perkel.com> wrote:
> 
>>It seems to me that getting in the Kernel is the most important thing.
> 
> 
> This is because nothing else can happen because no one will know it
> exists.  Everything else will happen *as soon as* Reiser4 gets in. 
> Otherwise, it's practically useless.
> 
> 
>>Then getting it compatible with existing standards. Then you build up
> 
> 
> But then you're basically rewriting ext2 or 3.  There's no point in that.
> 
> 
>>the user based (addicts) and then you add the innovative stuff.
> 
> 
> You do this first, because it's what sets you appart.  Otherwise,
> people won't convert away from EXT2/3.  Priorities first.
> 
> 
>>Otherwise people are going to use Ext3 because it has ACLs and Reiser4
>>doesn't. That's where I'm at. If it doesn't do ACLs it doesn't work. I
>>need acls.
> 
> 
> So why fix something that isn't broken?  Just because one person who
> uses ACLs doesn't use Reiser4 right away doesn't mean he won't use it
> later.  Compare the number of people who use Ubuntu Linux (who won't
> support Reiser4 until it's vanilla) and other Vanilla kernels, to the
> number of ACL users.  The numbers matter.
> 
> 
>>The way I see it - and I may well be missing something - s that the
>>current API is just a way of talking to the security layer. So why not
>>support multiple ways to talk to it?
> 
> 
> There is nothing wrong with this idea.  It's just time consuming. 
> It's not done, yet (for Reiser4).  If someone is willing to pay the
> time/sweat or the money to get it done, it will be done.  Otherwise,
> it won't.  Simple as that.

And, just to clarify, people are willing to pay the money for the 
time/sweat that it takes to implement the nice, clean, new ways of doing 
things like ACLs and xattrs.  I don't think anyone's willing to spend 
money (yet) to get the old things working -- no point.

I'm betting that at some point, there's going to be a question of the 
amount of time it'd take to rewrite an existing project vs. adding the 
xattrs compatibility layer, and that layer will be easier to do, because 
someone has a rediculously un-modular system.  But not soon, and not 
before it's in the vanilla kernel.



Completely offtopic, inane comment follows:

"Vanilla" should really be called "Essence of Madagascar Orchid", or 
some such.  It is, in fact, one of the most exotic tastes on the planet. 
  Read up at:  http://en.wikipedia.org/wiki/Vanilla_%28orchid%29

So, the Vanilla kernel should never be seen as something boring ;)
