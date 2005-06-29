From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: reiser4 plugins
Date: Wed, 29 Jun 2005 19:29:30 -0400
Message-ID: <878y0svj1h.fsf@evinrude.uhoreg.ca>
References: <hubert@uhoreg.ca>
	<200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	<87hdfgvqvl.fsf@evinrude.uhoreg.ca>
	<8783be6605062914341bcff7cb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <8783be6605062914341bcff7cb@mail.gmail.com> (Ross Biro's
 message of "Wed, 29 Jun 2005 17:34:41 -0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ross Biro <ross.biro@gmail.com>
Cc: Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

On Wed, 29 Jun 2005 17:34:41 -0400, Ross Biro <ross.biro@gmail.com> said:

> I'm confused.  Can someone on one of these lists enlighten me?

> How is directories as files logically any different than putting all
> data into .data files and making all files directories (yes you would
> need some sort of special handling for files that were really called
> .data).  Then it's just a matter of deciding what happens when you
> call open and stat on one of these files?

Logically, I don't think there is a difference. A filesystem that
doesn't support file-as-dir could implement the same functionality that
way. [1]  In fact, that's essentially what MacOS X/NeXTSTEP does with its
bundle format -- it's just a regular directory with regular files
inside.  The Reiser4 implementation would probably look very similar to
that structurally, except that since it understands file-as-dir, it
doesn't need to use the .data name, and it should still know where to
find it.  (Of course, I'm not a Reiser4 developer, and I don't speak for
them.)

[1] (Well, except that file-as-dir as some people would like it to
operate, can do a whole lot of other magic.  (e.g. transparent compress,
etc.  In Reiser4, it's also supposed to allow an interface to filesystem
stuff so that you can manipulate parameters such as whether it should
use the cryptocompress plugin for that file.)  But I think this is a
sort of separate issue.)

> For backwards compatibility, current existing system calls have to
> treat these things as directories.  Perhaps an exception could be made
> for exec.

Which makes the system really quite ugly.  I certainly wouldn't enjoy
having to type "$EDITOR foo.txt/.data" instead of "$EDITOR foo.txt".  If
you want to introduce new system calls, you would have to patch all the
programs pretty much overnight in order for the system to be useful.  It
also makes portability a big pain if you want to support systems that
don't offer the same system calls.

You also get a chicken-and-egg problem.  Application developers don't
patch their programs because nobody's using the system.  Nobody's using
the system because no applications support it.

> But we could have a whole new set of system calls that treat things as
> magic, and if files as directories is as cool as many people think,
> apps will start using the new api.  If not, they won't and the new api
> can be deprecated.

File-as-dir doesn't require new system calls (that I know of), which is
the whole point of the idea.  Existing programs can edit the strange new
attributes without being modified.

The main thing blocking file-as-dir is that there are some
locking(IIRC?) issues.  And, of course, some people wouldn't want it to
be merged into the mainline kernel.  (Of course, the latter doesn't
prevent Namesys from maintaining their own patches for people to play
around with.)

I would like to see file-as-dir so that we can try it out to see if it's
as useful as some of us think it is.  It might be less useful than I
expect, or it could exceed my expectations and someone might come up
with some killer use for it, once we can start playing with it.  And I
think it would be nice if it was merged into mainline so that it gets
more exposure, and we have more people trying it out.

People like Horst (and probably others, who are less vocal), I think,
don't think that it's even worth trying it out because they don't see
any major advantages.  Or at least they think that the potential
negatives outweigh the potential positives.  I respect that they have
different opinions, but I of course disagree and attempt to convince
them otherwise.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

