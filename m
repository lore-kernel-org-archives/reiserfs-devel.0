From: Hans Reiser <reiser@namesys.com>
Subject: Re: WinFS beta out
Date: Wed, 31 Aug 2005 13:05:30 -0700
Message-ID: <43160D8A.7010006@namesys.com>
References: <e692861c0508292136543a02e1@mail.gmail.com> <1125380557.9589.3.camel@gentoo> <4313FE21.8080709@namesys.com> <019d01c5ad68$4d5fdfa0$d60310ac@homedom> <43147EFE.2020804@perkel.com> <43150100.40304@namesys.com> <4315D455.1050100@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25764-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4315D455.1050100@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Marc Perkel <marc@perkel.com>, Reiserfs List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:

> Hans Reiser wrote:
>
> >I didn't have any role in the reiser3 acls.  I would never have designed
> >them the way they got written.  If you want high performance acls,
> >sponsor me to supervise the work for reiser4, and they will be very high
> >performance.  Making them high performance in reiser4 is straightforward
> >and easy.
>
>
> I would have also rather designed them differently, as another item
> associated with the key. One of the strengths of the reiserfs design was
> the btree that allows nodes of various types. ACLs should have been
> implemented this way, extents could have been implemented this way.
>
> Unfortunately, when I tried doing that, I found that the implementation
> does not at all live up to the design. The implementation can handle the
> four core items, and those alone. The addition of a new item type causes
> the system to panic. Those issues could have been fixed, but we still
> would have been left with a filesystem that would panic if mounted on an
> older kernel -- since reiserfs also has no concept of feature versioning.

So you understand why reiser4 got written....;-)

>
> The current implementation is hardly what I had envisioned ACLs and
> xattrs being on reiserfs -- but was the only solution we could find to
> still allow the filesystem to be mounted on an earlier kernel.
>
> An ideal solution would have been to introduce reiserfs v3.7 with a new
> magic, and add feature versioning to the superblock, similar to the way
> ext[23] does it. I felt that would have been met with much, much more
> resistance than the implementation I ultimately presented.

I understand that you meant well, and we just honestly disagree about
when to code freeze a stable release and put all the new stuff in the
next release.  I would never release code that dramatically reduces
performance to the point of eliciting the remarks in this thread by the
users, and that too is an honest disagreement.  I was offered money by
more than one entity to do the design you did, and refused the money.

All of what you wish you could have done differently is easily done in
reiser4 because of plugins, and acls in reiser4 will happen when someone
offers money (and they will, I am sure of it).

>
> -Jeff
>
> --
> Jeff Mahoney
> SuSE Labs

