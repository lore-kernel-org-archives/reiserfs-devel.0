From: Brian Thomas Sniffen <bts@alum.mit.edu>
Subject: Re: reiser4 non-free?
Date: Thu, 06 May 2004 18:55:12 -0400
Message-ID: <87d65hw4hb.fsf@aule.evenmere.org>
References: <4097CCA4.4060707@namesys.com> <87fzag139k.fsf@aule.evenmere.org>
	<4099A868.9030406@slaphack.com>
	<20040506.083242.41632888.wlandry@ucsd.edu>
	<87k6zpy8ke.fsf@aule.evenmere.org>
	<20040506143643.GB25505@raptus.homelinux.org>
	<877jvpy08v.fsf@aule.evenmere.org> <409A7F98.7040609@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18515-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <409A7F98.7040609@namesys.com> (Hans Reiser's message of "Thu,
 06 May 2004 11:10:32 -0700")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

Hans Reiser <reiser@namesys.com> writes:

> I just modified the Reiser4 license to be the following:
>
> The License: The Anti-plagiarism license is the Gnu Public License
> Version 2 with the following modification: you may not modify,
> remove, or obscure any credits in the software unless your
> modification causes those credits to remain equally prominent and to
> retain their wording. You are not required to display the credits if
> the computer has no effective display mechanism, or if you do not
> distribute the software to others.

You do realize that this is not GPL compatible, and so works
derivative of the Linux kernel cannot be meaningfully licensed
under it, and works licensed under it cannot be shipped linked to any
GPL'd works, right?

That's not the end of the world, but it's worth making clear. 
There are a couple of other problems with this license.  For example,
what if there is a display mechanism but I must pay an exorbitant
amount to use it?  Say, I'm doing mkreiserfs on the London Stock
Exchange ticker's main display.  Sure, that's a ridiculous case, but
a teletype where the user pays by the byte is not.  Can you restrict
this to works used interactively?  That's an intentionally different
phrasing than the GPLv2's -- and intentionally captures programs like
mkfs, which are not themselves interactive, but which are used in an
interactive way.

Also, as written the license prohibits me from stripping the credits
out of my own copy if I also, separately, distribute the unmodified
code.  I don't think that's what you meant -- is it?

Also, I may not, as written, translate the credits into another
language, since that changes their wording.

With those serious questions about the license out of the way, I
descend to the Faq, which obscures more than it clarifies:

> FAQ:
>
> Q: Will this license lead to ads?
>
> A: No, credits describe the contribution made to a project. Ads describe a
> product someone wants you to buy. Ads are not the same as credits, and their
> preservation is not protected by this license.

Debian's going to have to look really, really closely at every release
of every piece of software under this license, then, and risk an
argument -- in a courtroom -- with a copyright holder who considers
some line to be a credit, or insufficiently prominent in its modified
form.

For example, moving a credit from mkfs to an installer reduces its
frequency, as at least one fs is made per install, but other
filesystems may be made.

> Q: Can we the distro preserve the credits but send the credits to /dev/null.
>
> A: No. How can you even ask such a question?

How about e-mailing them to root?  How about providing a --no-credits switch?
How about making it on by default?

I expect the answers to be Yes, Yes, No, but I certainly can't read
your mind.  This license is very, very vague about what is allowed and
what is not -- normally not so bad, since there's a big clear zone of
what's allowed, but the line of what's Free and what's not is right
through the middle of the murky zone.  Whether this is a Free license,
then, depends very heavily on the licensor.  That's awfully
inconvenient, from a distributor's point of view.

> Q: Can I change the font? Can I move the credits to a different moment
> in the
> user interaction to suit my installer?
>
> A: Yes, if you make sure the credits make an equally effective/frequent
> impression on the user. If you have doubts about whether your changes are
> fair, be courteous and ask the author and you'll find that most authors are
> reasonable.

> Q: What in this license prevents persons from making their name display
> excessively annoyingly throughout the running of the program? Isn't that a
> flaw in the license?
>
> A: The shovel doesn't stop the digger from creating a pit in the
> road that endangers other people. The license is a tool. Whether you
> make an ass out of yourself using it on the software you write is up
> to you. No compiler makes broken programs work....

In other words, some works under this license are free (for example,
one containing no credits but the copyright notice) and others are
non-free.


-- 
Brian Sniffen                                       bts@alum.mit.edu
