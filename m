From: "Bostjan Skufca @ domenca.com" <bostjan.skufca@domenca.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 2 Sep 2004 12:05:59 +0200
Message-ID: <200409021205.59353.bostjan.skufca@domenca.com>
References: <20040826150202.GE5733@mail.shareable.org> <Pine.LNX.4.58.0409020030220.2295@ppc970.osdl.org> <4136E0B6.4000705@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21266-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4136E0B6.4000705@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I think Hans' idea about further evolution is right.

(2.7 which will lead into 3.0 maybe?)


Regards,
Bostjan


On Thursday 02 of September 2004 10:58, Hans Reiser wrote:
> Linus Torvalds wrote:
> > But _my_ point is, no user program is going to take _advantage_ of
> >
> >anything that only one filesystem on one system offers.
>
> Apple does not have this problem....
>
> and yes, the apps will take advantage of it, which is different from
> depending on it.  If you use the wrong fs you will lose some of the
> features of the app.
>
> For 30 years nothing much has happened in Unix filesystem semantics
> because of sheer cowardice (excepting Clearcase, which priced itself
> into a niche market).   It is 25 years past time for someone to change
> things.  That someone will have first mover advantage, and the more
> little semantic features possessed the more lure there will be to use it
> which will increase market share which will lure more apps into
> depending on it and in a few years the other filesystems will
> (deservedly) have only a small market share because the apps won't all
> work on them.
>
> Besides, there are enhancements which are simply compelling.  You can
> write a dramatically better performance version control system with a
> much simpler design if the FS is atomic.    Our transaction manager
> first draft was written by a version control guy, and he would probably
> be happy to tell you how  lack of atomicity other than rename makes
> version control software design hideous.
>
> We have the performance lead.  By next year we will be stable enough for
> mission critical servers, and then we start the serious semantic
> enhancements.
>
> If you don't embrace progress, then you doom Linux to following behind,
> because the guys at Apple are pretty aggressive now that Jobs is back,
> and they WILL change the semantics, and they will do so in compelling
> ways, and Linux will be reduced to aping them when it should be leading
> them.
>
> Hans
