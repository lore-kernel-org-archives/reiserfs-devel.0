From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 13:46:56 -0500
Sender: news <news@sea.gmane.org>
Message-ID: <878yhgrh0f.fsf@uhoreg.ca>
References: <87y8phtxk6.fsf@uhoreg.ca> <200403310620.i2V6K7D9018881@sirius.cs.pdx.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

>>>>> "Elliott" == The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu> writes:

[...]

Elliott> Though you do have a point that the GUI tools filenames with
Elliott> '&' or '!'  becomes more common. '\' does have the advantage of
Elliott> simply needing to by typed twice (rather than one key followed
Elliott> by shift-number combo). Useful if you need to tell the tell the
Elliott> GUI what the file actually is.

Yes.  I think that \ is nice because you just have to type it twice in
the shell.  It is also a reserved character in DOS/Windows, so at least
Windows users won't be in the habit of naming their files with \.  (It's
also an uncommon character to begin with.)

One other problem, though, that I forgot to mention in my last post, is
that in the shell, or in a script, you would have to type it twice,
whereas in a GUI, you only have to type it once, which may lead to
confusion.

Overall, I in general don't like the idea of adding a new separator
character, but if we did, I think \ would be the way to go.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

