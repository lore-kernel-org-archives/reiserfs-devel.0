From: Frank van Maarseveen <frankvm@xs4all.nl>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 3 Sep 2004 10:01:45 +0200
Message-ID: <20040903080145.GA8355@janus>
References: <200408261034.38509.vda@port.imtp.ilyichevsk.odessa.ua> <Pine.LNX.4.44.0408260736080.23532-100000@chimarrao.boston.redhat.com> <20040826121223.GG30449@mail.shareable.org> <4137F4D9.7040206@pointblue.com.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21407-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4137F4D9.7040206@pointblue.com.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grzegorz Ja??kiewicz <gj@pointblue.com.pl>
Cc: Jamie Lokier <jamie@shareable.org>, Rik van Riel <riel@redhat.com>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Matt Mackall <mpm@selenic.com>, Nicholas Miell <nmiell@gmail.com>, Wichert Akkerman <wichert@wiggy.net>, Jeremy Allison <jra@samba.org>, Andrew Morton <akpm@osdl.org>, Spam <spam@tnonline.net>, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Fri, Sep 03, 2004 at 06:36:41AM +0200, Grzegorz Ja??kiewicz wrote:
> Jamie Lokier wrote:
> 
> >Is it a problem to decree that "file data MUST NOT be stored in a
> >metadata directory; only non-essential metadata and data computed from
> >the file data may be stored"?
> 
> That's exactly what folks seem to lost in this debate.

And that's not even the most important part: How would you educate all
the developers _not_ on this list: application developers? I think this
is just a disaster waiting for us to occur.

> * be able to extract/modify file part on fly.
> * be able to store metadata, that doesn't matter on copy

those may be orthogonal.

-- 
Frank
