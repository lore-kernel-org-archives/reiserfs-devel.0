From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 19:04:41 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <87sma1bng6.fsf@uhoreg.ca>
References: <200408311931.i7VJV8kt028102@laptop11.inf.utfsm.cl> <41352279.7020307@slaphack.com>
 <41356321.4030307@namesys.com>
 <Pine.LNX.4.58.0408312259180.2295@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>>>>> "Linus" == Linus Torvalds <torvalds@osdl.org> writes:

Linus> For example, you could make just _one_ program support
Linus> "openat()", and you'd get most of the advantages, with no
Linus> possibility of _breaking_ any of thousands of applications..

I'm starting to think that even if we had openat, it wouldn't solve
much.  Maybe I'm just not imaginative enough, but I still see problems.
Let's pretend, just for the sake of argument, that every program all of
a sudden magically was modified to support openat, which is a big
assumption.  But we'll make that assumption so that we can ignore _that_
problem for a second.

The question still remains, how do I tell the thing to open a stream?
If cat knows about openat, how do I tell it to cat foo.txt, stream
bar?  I obviously can't do it using a normal filename, because if I
could do that, we could just forget about the openat business.  The
only way I can think of is to give cat a flag that tells it what stream
to open: "cat --stream bar foo.txt".  Ugly.  It also makes it
impossible to do redirection, because you can't pass flags to "<".

And before someone yells "runat" at me (which, btw, won't work with
redirection either), consider larger programs like GIMP or emacs.  Let's
look at GIMP first.  I've already got an instance of GIMP open, and I
don't want to waste memory with another instance.  How do I tell it to
open the icon.png stream of the file xterm?  When I go to File | Open,
up pops a dialog that only shows real files.  Trying to design a dialog
box that will show real files and substreams, and not confuse the users
is not going to be fun.  Please don't ask the GTK/GNOME developers to
design another file selection dialog.  There were enough people whining
the last round.  If they need to add more complexity, we'll have even
more whining.

Now let's look at emacs.  I want to open up the description.txt stream
of the file xterm.  So I do "C-x C-f", and it prompts me on the status
bar for the file name.  What do I type?  Well, description.txt doesn't
live in the normal namespace, so the only way around that is for emacs
to ask for the filename, and then ask for the stream name.  That's
extra-annoying when I usually just want to open just the normal stream,
and that second prompt just makes more work for me.

Linus> I know, you've ignored the "runat" program (which is just a
Linus> wrapper around the openat() system call), but it _has_ been
Linus> mentioned several times in this thread. Yes, you'd type a bit
Linus> more to do

Linus> 	runat file ls -l

Linus> instead of

Linus> 	ls -l file/

Might not be just a "bit more" typing, because you lose handy things
like tab completion.  Say I want to "cat" file foo.txt, stream bar.  Or
was that baz?  Instead of being able to type
  cat foo/ba<tab>
and have the filename magically come up, I need to
  runat foo ls ba*
  runat foo cat baz
(which also requires more thinking, since I need to think about how to
formulate the query, read the output, and write the new command, and so
is much much slower than being able to mindlessly hit the <tab> key.)

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

