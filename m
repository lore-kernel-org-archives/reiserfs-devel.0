From: Phil Frost <indigo@bitglue.com>
Subject: Re: porting to alternate OSs and relational semantics
Date: Thu, 13 Nov 2003 18:06:10 -0500
Message-ID: <20031113230610.GC1705@europa.lair>
References: <20031113201925.GB1423@europa.lair> <3FB35BE1.2080006@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3FB35BE1.2080006@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Thu, Nov 13, 2003 at 02:24:33AM -0800, Hans Reiser wrote:
> Phil Frost wrote:
> 
> >My name is Phil Frost and I am looking at ReiserFS as a potential
> >filesystem for an OS called Unununium (http://uuu.sf.net/) in the early
> >stages of development.

> Do you have funding from anywhere?  Are you private or university or?

Hah...I wish! At least we project an image of professionalism :) If there is
anyone reading the list interesting in funding an OS, look no further!
Currently only I and a few other people are involved in the development.

> >From the beginning, we have planned to make the filesystem an integral
> >part of the system as a whole. Thus we came to many of the same
> >conclusions as ReiserFS: the filesystem should be an efficient database.
> >
> >Work had begun on a filesystem of our own making, but after reading about
> >Reiser4 I came to realize that ReiserFS wasn't just another filesystem
> >that performed better at doing the same useless FS stuff, but rather
> >exactly what we wanted, only years advanced :-) So, I am now aiming to
> >get the ReiserFS code working for our OS. Any information on how to
> >proceed would be appreciated.
> >
> >Furthermore, because we are developing an entirely new OS, we aren't
> >restricted by backwards compatibility or tradition. I would like (and
> >will definitely need, in order to sell this idea to the other members of
> >the project) to see the database features of ReiserFS develop, in
> >particular, relational semantics.
> >
> >I don't know what progress or ideas have been made in this idea, but as I
> >see it, a traditional hierarchal layout is a subset of a relational
> >database, only that the only usable relation is "child-of". Our primary
> >goal was to allow information to be found quickly by a key other than the
> >name, such as finding all music by "Pink Floyd" or all songs from "The
> >Wall".

> Please read www.namesys.com/whitepaper.html, which describes the 
> semantics intended for reiser6.

> >To this end I'd like to do whatever I can to assist. I'd rather
> >contribute to ReiserFS than produce a redundant effort. Other members of
> >the Unununium effort have expressed concerns about the suitability of
> >ReiserFS to our task and the time it may take to mature. Any remarks you
> >can make to quell their restlessness would be greatly appreciated and may
> >convert a talented developer to your cause :-)


> Reiser4 is getting installed on my desktop sometime this week, so I 
> don't think you should worry about the time to mature, unless you mean 
> the time required to implement semi-structured semantics on top of the 
> existing storage layer.
>
> thanks kindly for your interest in ReiserFS
> 
> -- 
> Hans


Yes, that's what I mean. As a new OS with no notions of compatibility or
tradition we'd rather have the right system initially rather than to regress
later. I'd like to know if any such development is activly in progress, and
if so, when it is estimated to be serviceable. Or if you prefer, what would
be involved time-wise to implement it given the current state? As we are
already working on such a project, with a little perswasion I'm might get a
developer in addition to myself working towards that goal.
