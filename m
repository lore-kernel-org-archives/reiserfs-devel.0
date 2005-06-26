From: Christoph Hellwig <hch@infradead.org>
Subject: Re: reiser4 plugins
Date: Sun, 26 Jun 2005 17:52:46 +0100
Message-ID: <20050626165246.GB18942@infradead.org>
References: <20050620235458.5b437274.akpm@osdl.org> <42B831B4.9020603@pobox.com> <42B87318.80607@namesys.com> <20050621202448.GB30182@infradead.org> <42B8B9EE.7020002@namesys.com> <42B8BB5E.8090008@pobox.com> <42B8E834.5030809@slaphack.com> <20050622053656.GB28228@infradead.org> <42B91764.1080208@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42B91764.1080208@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Wed, Jun 22, 2005 at 02:46:44AM -0500, David Masover wrote:
> >>There's been sloppy code in the kernel before.  I remember one bit in
> >>particular which was commented "Fuck me gently with a chainsaw."  If I
> >>remember correctly, this had all of the PCI ids and the names and
> >>manufacturers of the corresponding devices -- in a data structure -- in
> >>C source code.  It was something like one massive array definition, or
> >>maybe it was a structure.  I don't remember exactly, but...
> >
> >
> > Every device driver has a big array of corresponing device ids as an
> > array in C code - oh my god we're doomed  .. not.
> 
> I could throw the same sarcasm back at you.  We must be doomed because
> Reiser does some stuff that VFS already does!  Or am I misunderstanding
> the complaint?

I rather wanted to say I absolutely don't see any correlation of your
PCI driver example to what we're discussing here.  PCI driver hardcode
ID tables because they are supposed to do that.  And if a PCI driver works
around hardware bugs for a specific subset of hardware it needs to use
an ID table for that one aswell.  And adding a strong comment about broken
hardware is considered to be just fine in Linux kernel land aswell.

Now to your reply.  We're not doomed if a driver re-implements "something"
we already have in common code.  We would be doomed if every driver
reimplements lots of things, that's why we push hard to avoid drivers
doing that.  It gets even more important if that "something" duplicated is
not some simple piece code but complex abstractions.

> How does it get proven if you won't give it a chance as a *separate*
> unproven mess, with a big fat EXPERIMENTAL flag, for users to play with?
> 
> I know, it exists as a separate patch.  But it works now, and I think
> the best way to "prove" it would be to package it with the kernel.

You're free to test it as much outside the kernel tree.  This might make
it more proven one day, but not automatically less of a mess.  The real
point here is that we already have a useful abstraction in that area, and
we spent a lot of work to make it proven and not a mess (or just a little
bit of a mess..), and thus we'd rather see people extending it reasonably
for their needs instead of duplicating lots of infastructure in less than
ideal ways.

