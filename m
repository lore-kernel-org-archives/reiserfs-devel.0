From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: "Metas"
Date: Wed, 28 Apr 2004 02:49:12 -0400
Sender: news <news@sea.gmane.org>
Message-ID: <87d65sbnrr.fsf@uhoreg.ca>
References: <no.id> <200404280506.i3S56jXb022934@sirius.cs.pdx.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

>>>>> "Elliot" =3D=3D The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.ed=
u> writes:

[...]

Elliot> I think we've provided evidence that it might well be one in one
Elliot> thousand. Pretty much any filename that `ls` without the "-a"
Elliot> option will display will be unacceptable.

metas is not returned by readdir(), so won't show up in ls.
Nevertheless, I'm still in favour of adding a leading dot (or two).  I
don't think that allowing renames is a good idea, especially given that
the metas directory is not returned by readdir -- the user (or
application) has no way of discovering what the name is.

>> From: mjt@nysv.org (Markus T=F6rnqvist)

>> What's so terribly bad about having the name for it in /proc or /sys
>> or wherever and having it global from the kernel config?

Elliot> open()/read()/write()/stat()/readdir() are system calls, but
Elliot> fairly cheap operations. getcwd() is a library call, almost
Elliot> certainly making *hundreds* of system calls, and quite possibly
Elliot> *thousands*. In order to use a /proc or /sys interface you'd
Elliot> need to use getcwd(), if you're accessing many files this would
Elliot> be extremely expensive.

I don't see why putting the name in /proc or /sys requires getcwd().
Can you explain in more detail?

Oh.  I think you're talking about something different from what Markus
is talking about.  I think you're talking about putting metadata for
/foo/bar into, say, /proc/metas/foo/bar.  What Markus is talking about
is having a file called, say /proc/fs/reiser4/metas, and if you cat
that file, it will spit out the name of the metas directory.

I don't like it because I think that Reiser4 should be consistent.
Making users look up the name from /proc/fs/reiser4/metas I think is a
lot worse than making them use a long name for the metas directory.  And
"ls foo/`cat /proc/fs/reiser4/metas`", or even "ls foo/$metas", where
$metas is the cached value of /proc/fs/reiser4/metas, is a lot uglier
than "ls foo/.metas".

Yet another option is to standardize on a long, extremely unlikely to
clash name as the standard way to access the metadata (maybe something
like "sys.metadata"), and define a short name, which is probably defined
at compile time, which can be looked up through something like
/proc/fs/reiser4/metas_abbrev.  That way, users (and scripts) get a
consistent interface, but if they want to save typing, they can look up
the short name.

--=20
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

