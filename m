From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: File as a directory - file-as-dir vs. link-dirs (again) - 2/3
Date: Fri, 18 Nov 2005 22:07:17 -0500
Message-ID: <87fyptqqsa.fsf@evinrude.uhoreg.ca>
References: <ff8010840511171929y2f8cbd1bpd1b703003f10bc56@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ff8010840511171929y2f8cbd1bpd1b703003f10bc56@mail.gmail.com>
	(Leo Comerford's message of "Fri, 18 Nov 2005 03:29:37 +0000")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Fri, 18 Nov 2005 03:29:37 +0000, Leo Comerford <lrc1@st-andrews.ac.uk> said:

> (This long essay has been posted in three parts. In order to keep any
> replies together, I suggest that people reply to the third part unless
> the reply is very specific to one of the others. This is part two, in
> which I criticise file-as-directory some more - far from exciting, but
> apparently still necessary. Things should pick up in part three.)

(Just briefly skimmed through these overly long posts.)

> But now let's try to express the father's/son's-photo relationships
> between the /(whatever)/portrait photos using subfile metadata instead
> of link-directories. /(whatever)/portrait/Mike is (the photo of) the
> father of (the man pictured in) /(whaterver)/portrait/Bob - how to
> express that using "files as directories"? We could decide that
> /(whatever)/portrait/Bob should have the additional path"name"
> /(whatever)/portrait/Mike/son-photo . But that would mangle the
> filesystem semantics: /(whatever)/portrait/Mike/son-photo isNotA
> /(whatever)/portrait/Mike . ...

What filesystem semantics are you talking about?  I don't see that this
would cause any duress for the filesystem.  Please explain in more
detail.

[...]

> Problem one: We can assume that the partial pathname after the ';' ,
> from the "file-as-directory" to the "metadata file", describes the
> type of relationship between the two files. So, for example,
> ';son-picture' describes one type of relationship, while others could
> be ';friend-picture', ';thumbnail' or ';social-sec-no'. So are all
> files in the same namespace as regards these relationship-names or
> not? In other words, if I see /(whatever)/foo;aardvark and
> /(something)/bar;aardvark , can I always safely assume that
> /(something)/bar;aardvark is to /(something)/bar as
> /(whatever)/foo;aardvark is to /(whatever)/foo ? If so, then there
> will be substantial risk of namespace collisions. ...

freedesktop.org is doing a good job of standardizing things that are
common to many programs.  For application-private things, those by
nature should have slightly-longer names.  For user-defined things, you
should let the user decide what he wants.  If he wants ;aardvark to mean
one thing in relation to foo, and another thing to bar, that's his
choice.

[...]

> Problem two: consider that you discover Mike's photo-of-son by looking
> into its "subfiles" and seeing /(whatever)/portrait/Mike;son-photo ,
> while you discover Bob's is-son-photo-of (in effect, its
> photo-of-father) by looking through its path"names" and also seeing
> /(whatever)/portrait/Mike;son-photo .

[...]

> But creating both /(whatever)/portrait/Mike;son-photo and
> /(whatever)/portrait/Bob;father-photo means having a cycle in the
> representation of some simple non-cyclic data. ...

Not a problem if you use symlinks.

[...]

> And what about the relations we don't duplicate? Saying that one
> "direction" in a given two-part relation will never be important to
> anyone is begging to be proven wrong; it amounts to speaking the fatal
> words "no-one will ever want to ...". ...

Let the user decide what relations he wants to duplicate.

[...]

> Problem three: the interaction of relations of different types can
> easily create cycles even when both relations describe simple acyclic
> data.

Again, not a problem if you use symlinks.

> If I give /(whatever)/portrait/Mike the pathname
> /(whatever)/portrait/Bob;employs , asserting that Bob employs Mike,
> then I have created a cycle. Once again subfile metadata creates a
> cycle in the base filesystem representation where none exists in the
> data being expressed. ...

And that is a problem, why?

[...]

> Problem four: without the ability to list pathnames of a file, our
> problems with pathnames worsen. How to tell that
> /(whatever)/portrait/Mike;son-photo is /(whatever)/portrait/Bob ? ...

symlink


With all due respect, Leo, your ideas seem extremely complicated, and
I'm not entirely sure what problem you're trying to solve.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

