From: "Burnes, James" <james.burnes@gwl.com>
Subject: FOSS Developer Attribution/Notoriety
Date: Tue, 4 May 2004 19:36:03 -0600
Message-ID: <3DF9165145FACB4C96977FF650C1E9040C469F3A@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18452-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I read one of Hans' older postings on this issue and I think I now know
what he wants.

"It seems V3 of the GPL only protects credits in the source code, and
does nothing to guarantee that users actually see the credits of the
authors instead of the credits of the marketeers."

Well, promoters promote.  They usually promote themselves.  If you want
to promote developers, you have to take a different path.  You can't
force users to watch credits like the FBI forces people to watch the
silly notice at the beginning of a DVD. That tactic is unlikely to
promote freedom or good will.  Just ask the FBI.

"Fewer than 100 people have read the source code to reiserfs, and while
those 100 are important, they aren't as important as 99% of the public."

Not necessarily true.  Those "fewer than 100" people that analyze
reiserfs may be much more important to reiser's success than 99% of the
public.  Very few end users will ever choose their own custom
filesystem.  As for notoriety for that *very* important piece of
software, read on...

"Nobody responsible for deciding whether to sponsor us has ever read the
source code that I know of."

Maybe a lesson there.

"Protecting credits only in the source is inadequate."

That which is to be proven.  Maybe developers only need egoboost in
proportion to the importance of their "value add".  Perhaps there are
many paths to this goal.

"If you agree, perhaps you can help me influence V3's authors to provide
relevant protection from plagiarism. If that doesn't happen, I will try
to    convince the community that we need to move to an anti-plagiarism
license instead."

Careful there.  Plagiarism has a very specific legal definition.  Using
a tool without broadcasting credits to the world definitely does not
qualify.  Even in the CS academic world you don't credit Erosthenes when
you use his algorithm for sifting primes.  Or Newton when using
Newtonian approximation in Operations Research. =20

You might have a comment in your code if you are writing a prime sifter
or working on a homework project -- something like "/* here comes sieve
of erosthenes */".  Well maybe if you were bored. =20

If you presented their discoveries as some marvelous discovery of your
own, then that would be blatant plagiarism.  We have to be careful with
our analogies or they will be our undoing.=20

So anyway, releasing a linux distro is not synonymous with writing a
peer reviewed research paper.

I believe it can be done without using the GPL for something it was
never meant to accomplish.

You want publicity or notoriety for the developers.  I agree.

Copyright licenses are a *poor* vehicle for that.  The distros are going
to want to use branding to push their own agenda (selling support
subscriptions for your software. Could that be what irks you?) Any bit
of DNA that is included with the software which might identify the
developers has a chance of being removed by the marketers as a
disturbance of their "branding effort".  Probably the smaller and more
inconspicous the DNA, the less likely that it will be removed.

Except for my grandfather and I, the rest of my family are all in the
communications, public relations, advertising or promotions business so
I'd like to think I have some perspective here.

Question 1: In what community do you wish the developers to be known?

Question 2: How do you reach that community?

Question 3: How do you do it efficiently, inexpensively and use the
right vehicle that doesn't alienate other developers, systems people and
users? (ever read Guerilla Marketing?)

Question 4: How do you create "DNA" for a piece of software that
reliably ties it back to its creators?

Question 5: Can this DNA be flexible enough so that it allows:

1. The current GPL to remain in force
2. Meaningful patching etc to be applied
3. Software to be forked etc.

If everyone got the correct amount of egoboo from this technology, would
it be possible to leave the licensing alone?

Solution: Before release have the team members sign the modules they
worked on.  Have the team lead sign the signatures on the full sources
and possibly some mechanism to build a signed binary in the Makefile.
When the sources are eventually compiled, the developer signatures are
embedded into a data segment.  I don't think anyone would care about an
extra couple K bytes in a multimegabyte binary.

Take an MD5 or something appropriate of this whole batch and register it
with a website that does stories on the developers and teams.  he
website would be a more technical version of Wired.  Then you have to
figure out how to get the John Q User to care who the developers are.
They only have so much time to really *know* someone. =20

When interest in a certain project reaches a threshhold (extra credit:
can this be automated?), you publish human interest stories on the team
and/or individual developers.  The KDE project already does this to some
extent.

This website could be constructed as an add-on to an already existing
website (maybe sf.net?), or created from whole cloth.

A truly motivated site might do video and/or radio interviews of the
developers etc.  Maybe you could fund projects by selling developer
information to recruiting companies, but respecting developer nyms,
privacy etc.  Perhaps you could try experimental funding models like
street performer, hostage ware etc.

How to pay for it?  The incremental cost shouldn't be too bad, if this
was done on a currently existing site.  You would still need volunteer
developers and artists to hack it together.  Pretty insignificant when
compared to the vast efforts expended on developing the software itself,
besides their names would be in there too.

So rather than fight the marketroids for ad space on their vehicles, why
not innovate and make your own?  Better than tearing apart the GPL
community for something the GPL (nor any license as far as I can tell),
was ever any good at doing.

For what it's worth.

Cheers,=20

j.burnes

