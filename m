From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Transactions faster than locking
Date: Tue, 11 Oct 2005 14:17:45 -0400
Message-ID: <e692861c0510111117v23b13b5ewb491d852ea7ab619@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Saw this on the Postgres list, and I thought this might be interesting
for some of the users here. Interesting in general to think about
expanding transaction orientation in software, with Reiser4 providing
efficient transactions down to the block update level.

---------- Forwarded message ----------
From: Dann Corbit <DCorbit@connx.com>
Date: Oct 11, 2005 2:09 PM
Subject: Re: [HACKERS] Spinlocks and CPU Architectures
To: Simon Riggs <simon@2ndquadrant.com>, Peter Eisentraut <peter_e@gmx.net>
Cc: pgsql-hackers@postgresql.org, Tom Lane <tgl@sss.pgh.pa.us>,
robennals@users.sourceforge.net



As an aside, here is a package that has recently been BSD re-licensed:
http://sourceforge.net/projects/libltx/

It is a lightweight memory transaction package.  It comes with a paper
entitled "Cache Sensitive Software Transactional Memory" by Robert
Ennals.

In the paper, Robert Ennals suggests this form of concurrent programming
as a replacement for lock based programming.  A quote:
"We have now reached the point where transactions are outperforming
locks -- and people are starting to get interested."

There are a number of interesting claims in the paper.  Since the
license is now compatible, it may have some interest for integration
into the PostgreSQL core where appropriate.

It would certainly be worthwhile to read the paper and fool around with
the supplied test driver to compare the approaches.

If nobody on the PostgreSQL team has time for the experimentations, it
might be a good project for a PhD candidate at some university.

> -----Original Message-----
> From: pgsql-hackers-owner@postgresql.org [mailto:pgsql-hackers-
> owner@postgresql.org] On Behalf Of Simon Riggs
> Sent: Tuesday, October 11, 2005 10:56 AM
> To: Peter Eisentraut
> Cc: pgsql-hackers@postgresql.org; Tom Lane
> Subject: Re: [HACKERS] Spinlocks and CPU Architectures
>
> On Tue, 2005-10-11 at 18:45 +0200, Peter Eisentraut wrote:
> > Tom Lane wrote:
> > > This seems pretty unworkable from a packaging standpoint.  Even if
> > > you teach autoconf how to tell which model it's running on,
there's
> > > no guarantee that the resulting executables will be used on that
same
> > > machine.
> >
> > A number of packages in the video area (and perhaps others) do
compile
> > "sub-architecture" specific variants.  This could be done for
> > PostgreSQL, but you'd probably need to show some pretty convincing
> > performance numbers before people start the packaging effort.
>
> I completely agree, just note that we already have some cases where
> convincing performance numbers exist.
>
> Tom is suggesting having different behaviour for x86 and x86_64. The
x86
> will still run on x86_64 architecture would it not? So we'll have two
> binaries for each OS, yes?
>
> In general, where we do find a clear difference, we should at very
least
> identify/record which variant the binary is most suitable for. At best
> we could produce different executables, but I understand the packaging
> effort required to do that.
>
> Best Regards, Simon Riggs
>
>
>
>
> ---------------------------(end of
broadcast)---------------------------
> TIP 4: Have you searched our list archives?
>
>                http://archives.postgresql.org

---------------------------(end of broadcast)---------------------------
TIP 2: Don't 'kill -9' the postmaster
