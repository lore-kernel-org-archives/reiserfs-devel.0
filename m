From: Marcus Furlong <furlongm@hotmail.com>
Subject: Re: Plugin Patch (was Re: creating live virtual files by concatenation)
Date: Tue, 28 Feb 2006 15:19:07 +0000
Message-ID: <du1pis$2rp$1@sea.gmane.org>
References: <1271316508.20060225153749@dns.toxicfilms.tv> <Pine.LNX.4.63.0602251736340.13659@cuia.boston.redhat.com> <44036470.8050305@namesys.com> <200602272224.19908.pvh@uvic.ca>
Reply-To: furlongm@hotmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-list-return-28153-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Peter van Hardenberg wrote:

> you've said that these kinds of plugins should be something a weekend
> warrior could tackle. Our group had a real stab and dumped hundreds of man
> hours into the project with little effect. Admittedly, we were not
> experienced kernel hackers, but we were all comfortable in low-level C and
> quite happy to read source.
> 
> I request that a simple plugin be maintained as a standalone patch to
> Reiser4.
> 
> Ideally, there would be a small set of these plugins demonstrating how to
> create a new plugin which operates within the existing disk structure, and
> one that extends the on-disk format in a safe way.

I second this. I have also spent a considerable amount of time wading
through reiser4 code in an attempt to put together a simple plugin. A
standalone plugin patch would be invaluable. Look at all the ideas for
plugins that have come up on this list, and notice that so far none have
come to fruition.

> Right now, the cost-of-entry appears to be set too high for developers
> outside your team to approach the project.

Agreed, after spending weeks on this I am almost at the point of abandoning
it.. An example plugin patch (just something trivial) would definitely
encourage people to get involved in plugin development.

--
Marcus Furlong

