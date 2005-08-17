From: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Subject: Re: where is the journal kept?
Date: Tue, 16 Aug 2005 17:47:47 -0700
Message-ID: <d9a6586e05081617471a845a82@mail.gmail.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>
	 <4300A603.2050602@namesys.com>
	 <d9a6586e05081509195017d679@mail.gmail.com>
	 <4300D240.7010109@namesys.com>
	 <d9a6586e0508151108431fabba@mail.gmail.com>
	 <4302458E.9070604@namesys.com>
	 <d9a6586e05081613275071c00a@mail.gmail.com>
	 <430268F4.8020100@slaphack.com>
	 <d9a6586e050816162322c99721@mail.gmail.com>
	 <43027E86.1080900@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43027E86.1080900@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On 8/16/05, David Masover <ninja@slaphack.com> wrote:
> Shawn Rutledge wrote:
> > On 8/16/05, David Masover <ninja@slaphack.com> wrote:
> >>Something Reiser4 does very well.  If you have enough RAM, it's possibl=
e
> >>to avoid any reads/writes at all -- given enough RAM, it behaves as a
> >
> > Well that's cool if it's true.  But IMO for this application it ought
> > to have a deadline - after the writes have been pending for 10 seconds
> > or so, go ahead and commit all of them, in case I forget to unmount
> > before I remove the card.
>=20
> Not that it'd be a bad feature, but if you forget to unmount before you
> remove the card, you're going to lose something.  Even Windows now has a
>   form of unmounting -- you have to click "safely remove this device"
> before you take a USB keychain out.

And people often don't bother.  For one thing, half the time it fails
with some sort of error (some process still has a file open - gee,
what do I do about that?  I didn't ask it to hold that file open!=20
Well nevermind... <yank>)

It doesn't have to be that way.  That's probably why DOS didn't
usually have any write caching at all on floppies, so that you could
always safely remove a floppy whenever the access LED was not lit.=20
This made it OK for floppy drives to have mechanical eject buttons.
Apple came up with the alternative idea of having every kind of media
slot motorized, so that you must use the software to do the eject
because it's impossible to do it mechanically (without a paperclip, at
least).  This was a good idea but the existing CF slots are more
problematic than floppies or CDs - they have no motorized eject, no
access LED and no lock.  (Although I had a good laugh when I
discovered that some Powerbooks do have motorized PCMCIA slots!)

So I think having a hard "write deadline" for removable media is a
reasonable compromise, isn't it?  It reduces the chances of
corruption.

Maybe it could even automatically unmount after the writes are
committed and nobody has any files open; but cache the metadata so you
can still see the files, and automatically remount if anybody opens a
file.  If the card is removed, hopefully the kernel can detect it and
send a message to the FS implementation to flush the cache so that you
no longer see the metadata.  Supermount tried to achieve some of this,
I think.  The idea of having to umount stuff yourself is one of the
biggest usability problems in general, on both Windows and Linux, and
it just doesn't have to be that way.

> >>One other thing you might try is disabling the write-twice behavior.
> >>Currently, if you've got a huge, fairly well-sorted file that you're
> >>making lots of tiny writes to, such as a database, it makes sense to
> >>write twice to keep the file from getting fragmented.  But,
> >>fragmentation isn't nearly as much an issue on truly random-access
> >>media, so you'd want the default small-file behavior to be used
> >>everywhere -- first write the data to the new location, then atomically
> >>update the pointer to it as you deallocate the old location.
> >
> >
> > What would you change to do that?
>=20
> Because you want to write less.  Normally, when there's a big file,

I was asking how.  What files do you change?  Is it a source change,
or just a parameter somewhere?

> everything gets written twice, once to the "journal", then once back to
> the file, so that the file stays in the same place on disk and doesn't
> get fragmented.
>=20
> But if we're talking about a flash device, fragmentation doesn't matter
> so much, and you want to minimize the number of writes, so if you have a
> small write in the middle of a big file, you write that once to the
> "journal", and that's it -- once it's been successfully written, that
> chunk of "journal" becomes the new location for that chunk of the file.

Yeah that would be a good approach as long as it doesn't cost too much
efficiency (what if you have changed it multiple times?  Are there
multiple journal entries that override each other?)

> Obviously, you wouldn't have this behavior turned on by default.  On
> desktop machines, you want to let the FS decide when to write twice.
> But on a flash device, at least as a mount option, you want to force
> everything to be written at most once unless something fails.

Yep.

Maybe there is a way to detect what kind of media it is, too, so you
don't have to use the mount parameter most of the time.  The default
should be the correct one for the kind of media that it is.
