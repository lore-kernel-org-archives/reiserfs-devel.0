From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: silent semantic changes with reiser4
Date: Wed, 01 Sep 2004 02:32:35 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <87wtzejy7w.fsf@uhoreg.ca>
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

[...]

Linus> I know, you've ignored the "runat" program (which is just a
Linus> wrapper around the openat() system call), but it _has_ been
Linus> mentioned several times in this thread. Yes, you'd type a bit
Linus> more to do

Linus> 	runat file ls -l

Linus> instead of

Linus> 	ls -l file/

And how do I get GIMP (or insert your favourite image editing program
here) to edit xterm/icon.png without having to open a new instance of
GIMP?  runat isn't going to help here.  You'll have to modify every
editing program if you want that type of functionality.

Linus> but at least the openat/runat approach also works for
Linus> directories, which does actually make it a lot more _generic_
Linus> than the "show in the regular filespace" approach. No special
Linus> cases.

Linus> So your comparison isn't valid, because you're ignoring the
Linus> people who shout "runat" at you. You've also not ever actually
Linus> answered about the problems about directories with attributes.

All attributes should be stuffed in a specially-named subdirectory, like
Reiser4 puts all metadata in a metas subdirectory.  That's one solution.
The only trick here is picking a suitable name for the subdirectory that
is both user-friendly and highly unlikely to generate clashes.

Both of these I've mentioned before in this thread, and nobody has
brought up any objections yet.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

