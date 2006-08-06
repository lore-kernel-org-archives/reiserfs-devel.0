From: Bruce Byfield <bbyfield@axion.net>
Subject: Re: article abour Reiser4 on linux.com
Date: Sun, 06 Aug 2006 15:55:31 -0700
Message-ID: <1154904931.6553.34.camel@localhost.localdomain>
References: <87bqqzbaug.fsf@baldur.nicundtas.de>
	 <44D5B43D.3060501@namesys.com>
Reply-To: bbyfield@axion.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29519-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44D5B43D.3060501@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Tassilo Horn <heimdall@uni-koblenz.de>, reiserfs-list@namesys.com

Hans:

I suspect that most of your comments are a result of mild misreadings,
or inferences that may not be inevitable. 

My comments are interspersed below.

On Sun, 2006-08-06 at 03:19 -0600, Hans Reiser wrote:
> Bruce, regarding "a longstanding convention of avoiding plugins in the
> kernel", considering that we are the first and only ones ever to have
> plugins, and considering the existence of binary kernel modules, I don't
> think your characterization is accurate.  Perhaps there was some
> licensing controversy on lkml I am unaware of?  Since plugins are
> (always) compiled in, unlike kernel modules, I don't see how there is a
> licensing issue.

I believe that the controversy has arisen largely with commercial
companies who would like a way to keep their drivers proprietary.
Without actually doing a search, I seem to remember that the last time
the controversy arose was around October or November 2005.


> I think your characterization of plugins as something we impose on the
> VFS is unfair.  

I report that others make this claim. I don't characterize plugins in
any way myself. 

That said, if I were writing the article now, I would certainly mention
your rebuttals on the lkml since then. 

Researching the article, I realized early that I was attempting to
summarize a series of immensely complicated issues for people who might
know almost nothing about it, and my aim was not to take sides, but to
present the highlights as neutrally as possible. That means reporting
opinions that I don't necessarily agree with.

> I never made a reference to Steve Lord or Jim Lord, so suggesting that I
> got it wrong about him is inaccurate. 

I mention something like "Reiser and his supporters," which simply means
that the reference arises during the thread. I believe that you make a
reference to two people working on XFS, one of whom other people later
identify as Steve Lord. 

> Your characterization of the issue of whether Linux should double its
> filesystem performance as a philosophical point seems odd to me --- I
> think my writing failed to reach you as an audience on that point.

I characterized it as a philosophical issue because, although the focus
for everyone is superficially technical, it quickly spills over into
larger issues, such as whether following the conventions is more
important than performance.

> Reiser4 was first proposed for inclusion in October 2002, and a casual
> reader of your article would think it was proposed in 2005.

That was an unintended implication, and I apologize for it.

> Many journalists will run my words past me to see if it fairly portrays
> my views --- perhaps you might choose to do that with those you write
> about in the future.  In my experience it is a good journalistic practice.

Unfortunately, it's not one of which editors approve. It too easily
looks as though the writer is being influenced by the source. 
If I were to do so, I'd risk being banned from publication. 

That said, while I strive for accuracy, I am more than capable of making
mistakes. Moreover, on an issue as complicated as this one, mistakes are
even more likely than usual. That's why comments are an important part
online journalism.

> On a positive note, it seems like Andrew Morton will singlehandedly turn
> the Reiser4 review process into a technical not a political process, and
> I am much encouraged by that.  He has made numerous useful technical
> remarks in his last email, and we are addressing them.

That's good news. It seems long past the time that someone like Andrew
Morton stepped in to allow people to focus.

And when the day comes that Reiser4 is added to the kernel, I hope that
you will let I or somebody else from NewsForge interview you on the
subject. That will be a milestone that many people, including me, have
been waiting a long time for.

> >One thing which bothers me most: Whenever such an article appears it's
> >commented mostly by kiddies speaking after the mouth of several kernel
> >developers, sophisticating most of their comments, ripping them out of
> >context or spreading superficial knowledge. Of course those comments let
> >it get to possible new users.

Tassilo:

As I said to Hans, please step in and correct any misconceptions, either
from the article or its comments. Personally, I take the educational
goals of journalism seriously, and they aren't served by allowing
mistakes to stand unchallenged.

All the best,

-- 
Bruce Byfield 604-421-7177
Burnaby, BC, Canada
http://members.axion.net/~bbyfield

"All the ancient kings came to my door
They said, "Do you want to be an ancient king too?"
I said, "Oh yes, very much
But I think my timing's wrong"
-Dan Bern, "Jerusalem"

