From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Wed, 23 Jul 2003 14:25:17 +0200
Message-ID: <200307231425.17476.Dieter.Nuetzel@hamburg.de>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu> <1058892649.5042.29.camel@tiny.suse.com> <3F1D7DD8.3010806@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15003-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1D7DD8.3010806@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

Am Dienstag, 22. Juli 2003 20:09 schrieb Hans Reiser:
> Chris Mason wrote:
> >On Tue, 2003-07-22 at 12:43, Hans Reiser wrote:
> >>The answer to the below is to use reiser4.  It uses extents, and two 64
> >>bit numbers are all that is needed to store the hole.  V4 will be ready
> >>for testing in a few days, and will ship for real users at the end of
> >>summer we hope.
> >>
> >>Fixing V3 is  the wrong answer: this is one of its design flaws.
> >
> >It's important to remember that releasing v4 doesn't automatically
> >convert all existing v3 users to it.  This is the kind of thing we
> >should try to fix without making major design changes to v3.  It's at
> >least worth talking about, "use v4" can't always be the answer.
>
> V3 is in feature freeze.   Unfortunately, determining what is a feature
> and what is a bug is a process based not just on the user experience,
> but on the structure of the code.  The proper fix for this bug is to add
> a feature called extents.   This  belongs in, and is in, V4.  V4 will be
> available very soon.

And "coplete" stable from the beginning? --- Come on.

> Adding features, like new kinds of items, will disturb the stability of
> V3.  V3 needs to be zero defect.  It is now in a phase in its lifetime
> where conservatism is appropriate.

I'll accept this fix in V3 before I "move" to V4.

-Dieter

