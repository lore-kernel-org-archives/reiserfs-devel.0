From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 20:37:23 -0400
Message-ID: <200506250037.j5P0bOWn016330@turing-police.cc.vt.edu>
References: <tdwebste2@yahoo.com> <20050624093510.4330.qmail@web51301.mail.yahoo.com> <200506241545.j5OFj3Iw014214@laptop11.inf.utfsm.cl> <2f9ccaae050624101329390969@mail.gmail.com> <200506242138.j5OLcPr0025054@turing-police.cc.vt.edu>
            <2f9ccaae0506241520ffa8aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1119659843_6755P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24567-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 24 Jun 2005 16:20:45 MDT."
             <2f9ccaae0506241520ffa8aa@mail.gmail.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: perry@kundert.ca
Cc: ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>

--==_Exmh_1119659843_6755P
Content-Type: text/plain; charset=us-ascii

On Fri, 24 Jun 2005 16:20:45 MDT, Perry Kundert said:

>     OK, fair enough.  The file-as-directory stuff, which introduces
> VFS-incompatible issues, was turned off.  It requires VFS changes.

Mind you, I still think that sounds *interesting*, but it *has* to happen
at the VFS level.  (And if *that* doesn't force a 2.7 fork to happen,
nothing will :)

>     The remaining plugin architecture, as far as I understand, deals
> in the on-disk structure of the FS -- just like journals.  Encryption,
> Compression, and the like.
> 
>     So, what you are saying, is -- so long as the "plugins" do stuff
> that deals in how reiser4 slings bits back and forth to the disk,
> you're OK, right?

Right - once the VFS hands the call off to reiser4, you're on your own
as far as I'm concerned..

>     So, what you are saying is: if reiser4 wants to provide
> variability in on-disk format, so long as it implements it using
> *multiple different filesystems* (eg reiser4-cryptcompress,
> reiser4-whatever) -- just like ext2 vs. ext3 -- then you are OK with
> it?  But, if they are implemented as "plugins", so that the ONE
> reiser4 filesystem can modulate its behaviour based on what the
> on-disk format says, that you are NOT OK with it?
> 
>     And this makes sense, why?

You misread that - my point was that ext2 and ext3 may look similar, but
they're sufficiently divergent that trying to create one driver that handles
both results in an ugly driver, thus the split...

>     Don't get me wrong -- I'm not saying that ext2 and ext3 shouldn't
> be separate file systems.  However, if they were designed from the
> start so that the ONE (say) ext23 filesystem could look at its on-disk
> format, notice that the data specified the "journal" plugin, and
> implement the correct behaviour -- that this would be "bad"?

Well, if they *had* been, it would be a different story.  And there's stuff
in ext3 (see the "-O feature" section of 'man tune2fs') that *does* do the
sort of thing that you're proposing.  It's just that the ext2 codebase doesn't
fit in well for historical reasons.

>     Because I can envision an ext23 filesystem that is just like
> reiser4, that does exactly that -- implements its variable behaviour
> via a "journal" plugin.

>     So, if it did so, would you be OK with it?  As long as it wasn't
> called reiser4?

No, I'd be perfectly happy with a reiser4 that had a 'tunereiser --enable-plugin='
that had the same sort of format-altering semantics that 'tune2fs -O' has.

For bonus points, design a system that stores the plugin *in the file
system* (probably need to have a bytecode interpreter for this).  Then
you eliminate the "can't mount if the kernel can't insmod the plugin" issue ;)

>     I really don't mean to sound sarcastic -- it just sounds like
> there are "other" issues at work here -- like "Hans is a Butt-Head, so
> I want to reject reiser4's plugin design for modulating its behviour,
> no matter what".

I've never actually met Hans, so I don't know if he really *is* a butt-head
or not.  And I usually at least *try* to phrase it more like "this proposal is
a non-starter that only a butt-head could continue to support, because.." :)

Of course, I myself have been called a butt-head on numerous occasions, because
I'm convinced there's a right and wrong way to design something. ;)

>     OK, so far it seems like we are actually agreeing -- the stuff
> that gets done via reiser4 "plugins" actually doesn't have anything to
> do with the VFS, and it shouldn't be there.  So long as reiser4
> presents a VFS-sensible, VFS-consistent heirarchy of stuff that "looks
> like" files and directories to the VFS, then we're OK with it?
> 
>     Whether reiser4 uses "plugins", or ESP, or whatever to decide what
> behaviour it implements in order to produce this VFS-consistent
> interface, then that's OK, right?

Right - not that *my* opinion counts for tons on LKML, and any *other*
stylistic/design faults are a separate issue. :)

--==_Exmh_1119659843_6755P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCvKdDcC3lWbTT17ARAgqoAJ97dtf1YMQcNHIYnKnuIrEbG3TxEwCg8tcy
xBd65JzWA64b4i6nm4cSy5o=
=9T0h
-----END PGP SIGNATURE-----

--==_Exmh_1119659843_6755P--
