From: Oleg Drokin <green@namesys.com>
Subject: Re: duplicate files and recent changes
Date: Thu, 6 Jun 2002 13:25:05 +0400
Message-ID: <20020606132505.A2647@namesys.com>
References: <20020606094504.A851@namesys.com> <Pine.WNT.4.43.0206060328570.1296-100000@fanatic>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10537-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.WNT.4.43.0206060328570.1296-100000@fanatic>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "S. Alexander Jacobson" <alex@shop.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jun 06, 2002 at 03:33:17AM -0400, S. Alexander Jacobson wrote:

> > Hm, you mean, each time you create a file, reiserfs should scan all
> > other files and see if there is exactly a file like you just wrote?
> > Hm, even something more complicated as you are writing to a file in
> > 4k chunks.
> > Definitely no.
> I could imagine a cheaper implementation in which
> the fs computes an MD5 hash of each file as it is
> being written.  If the hash matches the
> pre-existing hash of some other file, then
> consolidate.

But MD5 may be identical for different files.
Also this buys you nothing.
You write file in chunks, once file is identical to other file,
one of the files deleted. Looks like just more extra work (but some saved space
of course).

> > > 2. Is there a fast way to get access to the file
> > > change list?  It would be nice to be able to do
> > > fast backup of changed files without having to
> > > traverse entire directory trees.
> > No.
> I would presume that journalling gives access to
> this sort of recent information.  It is really a

No. All kinds of metadata is journaled. Also it is possible to get
in situation where file was modified, but not journaled, because
no metadata changed. (mmaped writes coming to mind).
Also journal is not infinite, it is only 32M long.
And I presume you want some kind of info like "what have changed since
week ago".
Journal well might be overwritten many times since then.

Bye,
    Oleg
