From: "David Dabbs" <david@dabbs.net>
Subject: RE: [RFC] Pathname Semantics with //
Date: Thu, 9 Sep 2004 22:06:48 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040910030206.E29B015D9E@mail03.powweb.com>
References: <4140FA21.50101@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4140FA21.50101@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hans Reiser' <reiser@namesys.com>
Cc: linux-fsdevel@vger.kernel.org, 'ReiserFS List' <reiserfs-list@namesys.com>



> Hans Reiser wrote:
> 
> David Dabbs wrote:
> 
> >>Use of : in addition to / is a bad idea, see The Hideous Name by Rob
> >>Pike for why.
> >>
> >>Hans
> >>
> >
> >I've read The Hideous Name, and I think you're taking Pike out of
> context.
> >He wrote that document when device files were still only a part of a
> >research version of UNIX. His main point is that programs should not be
> >saddled with understanding physical devices when constructing filenames.
> >
> No, it was more than that.  It was that hierarchy requires only one
> delimiter.

Of course his essay was about more than that! Where you quote me above, I
was referring to his main point /about use of the colon/. Perhaps my message
was truncated and you didn't get to read a bit later where I acknowledge

>Regarding slashes, I can't find anywhere that Pike criticizes slashes.
>Now, I can see where the proposal runs afoul of his advice that:
>
>The syntax should be clean and uniform; every new syntactic rule requires
>at least one, and usually many, semantic rules to resolve peculiarities
>introduced by the new syntax. If the name space is a tree or any other kind
>of graph, a single character should be used to separate nodes in a name.
>
>Well, the only reason two trailing slashes are required is that we need
>some way to distinguish a directory's named streams from its entries. What
>is worse, one extra slash at the end of a directory (or two for a file) or
>"/metas"?

I completely agree with Pike on the one delimiter thing -- it is certainly
much more elegant. And we can have that simplicity/elegance as long as
directories are prohibited from having metadata. Do you have a proposal to
expose metadata on a directory such that it 

a) allows one to distinguish a directory entry from directory metadata,
b) uses only already-reserved pathname character(s),
c) doesn't require any reserved name,
d) is the same delimiter used for file metadata and
e) doesn't butt heads with Sus?


In a different post you said 
>Oh, and yes, I understand that minimizing the cost of change by 
>being artful is desirable.

Isn't it artful to try for the most innovation with the least breakage;
taking as little from the namespace and breaking only as many eggs as are
needed to make that innovative new omelet? I'm certainly willing to break as
many eggs as needed, but no more.

I don't claim to know as much about closure (or free trade) as do you. My
mental gifts are in other matters. ;-)


David




