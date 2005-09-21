From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Wed, 21 Sep 2005 14:16:09 +0400
Message-ID: <200509211416.10794.vitaly@namesys.com>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl> <4330B388.8010307@emc.com> <4330CDF1.4050902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750744AbVIUKRJ@vger.kernel.org>
In-Reply-To: <4330CDF1.4050902@namesys.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Ric Wheeler <ric@emc.com>, vitaly@thebsh.namesys.com, Theodore Ts'o <tytso@mit.edu>, Pavel Machek <pavel@suse.cz>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Wednesday 21 September 2005 07:05, Hans Reiser wrote:
> Ric Wheeler wrote:
> 
> > Hans Reiser wrote:
> >
> >> Ric Wheeler wrote:
> >>
> >>
> >>> As an earlier thread on lkml showed this summer, we still have a long
> >>> way to go to getting consistent error semantics in face of media
> >>> failures between the various file systems.  I am not sure that we even
> >>> have consensus on what that default behavior should be between
> >>> developers, so image how difficult life is for application writers who
> >>> want to try to ride through or write automated "HA" recovery scripts
> >>> for systems with large numbers of occasionally flaky IO devices ;-)
> >>
> >>
> >>
> >> If you'd like to form a committee to standardize these things, I will
> >> ask Vitaly to work with you on that committee, and to have ReiserFS3+4
> >> conform to the standards that result.
> >>
> >> Hans
> >
> >
> > I am not a big fan of formal committees, but would be happy to take
> > part in any effort to standardize, code and test the result...

I would be happy to take part in it too.

> > ric
> >
> >
> >
> The committee could simply exchange a set of emails, and agree on
> things.  I doubt it needs to get all complicated.  I suggest you contact
> all the folks you want to be consistent with each other, send us an
> email asking us to all try to work together, and then ask for proposals
> on what we should all conform to.  Distill the proposals, and then
> suggest a common solution.  With luck, we will all just say yes.:)
 
-- 
Thanks,
Vitaly Fertman
