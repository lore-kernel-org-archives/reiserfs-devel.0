From: "David Dabbs" <david@dabbs.net>
Subject: RE: mongo benchmark results
Date: Wed, 28 Jul 2004 22:13:03 -0500
Message-ID: <20040729031449.37DD915CCA@mail03.powweb.com>
References: <4105645F.7040106@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4105645F.7040106@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'E. Gryaznova'" <grev@namesys.com>
Cc: reiserfs-list@namesys.com, 'Alex Zarochentsev' <zam@namesys.com>, 'Hans Reiser' <reiser@namesys.com>

> >
> >Elena:
> >...run reiser4 with and without 'notail'
> >
> >...would you please reboot before each test?
> >
> >
> it does not matter 4k or 8k, I think.  So, you can try to repeat 4k
> benchmark just to be sure that your previous results were correct (if
> you want, of course).
> 
> >
> ext3 default is ok.
> 
> Thanks,
> Lena
>

Elena,

I've reproduced my original mongo benchmarks using the 'cpu util' mongo you
posted. The results are at http://dabbs.net/reiser4/mongo_updated.html. I
was careful to use the same kernel for all the runs except for one (the
reiser4 "mm7" run), rebooting before each test. For some reason I could not
get the CREATE phase to finish with GAMMA=0 using ext3, so I didn't move
forward with that. Will investigate more when I get the time to do so.


Best,

david



