From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 17:53:51 +0100
Message-ID: <20040826165351.GM5733@mail.shareable.org>
References: <20040826154446.GG5733@mail.shareable.org> <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@redhat.com>
Cc: Christophe Saout <christophe@saout.de>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

Rik van Riel wrote:
> And if an unaware application reads the compound file
> and then writes it out again, does the filesystem
> interpret the contents and create the other streams ?

Yes, exactly that.  The streams are created on demand of course, and
by userspace helpers when that's appropriate which I suspect it almost
always is.

> Unless I overlook something (please tell me what), the
> scheme just proposed requires filesystems to look at
> the content of files that is being written out, in
> order to make the streams work.

Yes.  Hence the idea of coherent views between two files: writing to
one affects the content of the other, although the calcalation is only
done on demand (or when the fs wants to migrate the representation --
for example, creating the flat container prior to deleting the
regeneratable pieces in order to save space).

I haven't seen anything from Namesys that says they'll do that.  I
have the impression the streams are just generated in memory on the
fly, not stored on disk with a cacheing policy, but that's just an
impression.  (We've all seen the Namesys white papers, they're not
_that_ revealing). :)

I'm just pointing out how to do it _right_.  I think it will turn out
like this eventually, either next year or some time over the next
decade after some iterations.  Inevitable.  Mark my words, etc. :)

-- Jamie
