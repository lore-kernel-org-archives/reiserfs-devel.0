From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 10:58:59 -0500 (EST)
Message-ID: <20040331155859.5866.qmail@web25009.mail.ukl.yahoo.com>
References: <20040331084335.GE5229@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17623-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040331084335.GE5229@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-list@namesys.com

Hubert Chan wrote:

> That effectively kills all filenames that contain @,

> much worse than
> just a "metas" conflict IMHO.

I strongly agree:

- A restricted character in all names is far more
likely to impact users than a single restricted name.=20


- Different "types" of directories, and extra rules
for dereferencing their contents, are extra concepts
for users to understand... this seems to run counter
to what I see as the overarching philosophy of
ReiserFS: unifying file system semantics.

I think that the meta directory needs to be thought of
not as a special directory, but as a normal directory
that has a name that is interpreted in a special way
by the system.

Markus T=F6rnqvist wrote:=20

> I'm not sure either what Hans Reiser meant by a
> macro, does that mean
> a settable variable? It's a decent compromise, I
> think. As someone
> else stated, let's just hope for an inoffensive
> default.

I agree.  This name will be used quite frequently in
the shell, and ReiserFS will be judged based on this
name (eg. if it is too long, if it is ugly, etc.).=20
Case in point: Lisp, which is a phenomenal language
that people avoid because it has too many brackets.=20
Same with Perl, that gets complaints because of its
heavy use of funny characters.  Aesthetics matter.

No one in this thread has commented on "+" as the
default meta directory name (one of the final
contenders in our previous thread on the subject).=20
Again, the reasons:
- Short (one character)
- Makes sense in all languages (meaning "additional
information")
- Available on all int'l keyboards

Also, a question: are all meta files necessarily
pseudo files?  Should users be able to put regular
files in there to be interpreted as pseudo files?=20
This will help to clarify some things for me.

Cheers,
N. Electron

P.S. I, too, want to reiterate that everyone has done
a great job on this file system and it is a remarkable
feat of design and computer engineering, and I'm very
thankful for your efforts.  I only offer my comments
because I care!


______________________________________________________________________=20
Post your free ad now! http://personals.yahoo.ca
