From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: File as a directory - back to predicates
Date: Thu, 25 Aug 2005 13:44:21 -0600
Message-ID: <87irxt94yy.fsf@evinrude.uhoreg.ca>
References: <ff80108405082323511225c1f6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25645-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ff80108405082323511225c1f6@mail.gmail.com> (Leo Comerford's
 message of "Wed, 24 Aug 2005 07:51:19 +0100")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Wed, 24 Aug 2005 07:51:19 +0100, Leo Comerford <leocomerford@gmail.com> said:

[... lots of stuff snipped ...]

> At other levels, of course, the differences assert themselves. For one
> thing, the normal Unix filesystem API doesn't have calls to, for
> instance, check the path"names" asserted of a given file. That's
> easily solved; just add the calls.

It's not so easy.  You need to determine how to figure out the
pathnames.  UN*X filesystems and filesystems for UN*X-like operating
systems don't store uplinks, so there's no quick way to figure out the
pathnames; the only way currently is to traverse the entire tree.

P.S. most of the stuff that you're saying is already in the Future
Vision paper.  At least the main idea of trying to query via metadata.
But it uses a different syntax.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

