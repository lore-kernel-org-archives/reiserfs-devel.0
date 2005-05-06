From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 repackers
Date: Thu, 05 May 2005 21:47:00 -0500
Message-ID: <427ADAA4.8000407@slaphack.com>
References: <427A0834.7080201@futuretg.com>  <427A99C0.2000105@slaphack.com> <1115335902.24839.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1115335902.24839.4.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Jonathan Briggs wrote:
> On Thu, 2005-05-05 at 17:10 -0500, David Masover wrote:
> 
>>This would, I think, involve creating a fully functional
>>resizefs.reiser4 -- something I distinctly remember Hans telling me not
>>to do, because my approach also created (most of) an online repacker,
>>which is something Hans wants to do for money.
> 
> 
> I am not certain this plan to make money from a repacker is going to be
> a workable idea.
> 
> Reiser4 starts off being very nice and fast, but I have been using it
> for a /home partition for almost a year now, and the performance has
> dropped significantly.

Mine is still about as fast as it ever was.  The performance plateaued
(how DO you spell that?) after a month or so.

> Once this happens to enough people using Reiser4, one of them is going
> to write a free repacker.

Like me.  I was making a lot of noise about that on this list some time
ago, until Hans told me to work on something else, and spend some
percentage of storage cost on a repacker.  For me, this would be a fair
price, considering 99% of the software on this box is free.

> Perhaps it would be a good idea to release at least an offline repacker.

To be able to resize.  That is the crucial feature.  Performance isn't
quite so huge, although Hans may start squirming when someone benchmarks
performance before and after a year of normal use -- but asking users to
back up, recreate, and restore -- that's a bit much.

But, looking at the whitepapers, an online repacker seems dead simple,
if you don't mind your box slowing to a crawl.  I can't imagine someone
doing an offline one before the online one.  They even had one that was
close to working, only it got itself into some sort of infinite loop
(not deadlock)...

So basically, unless Namesys does the offline one, someone's probably
going to do an online one.  Not me (yet), but someone.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQnrao3gHNmZLgCUhAQJDUBAAhmpwe8rB/vsnbBvtV9rVUqp0fVlrrLyF
yVmViDHCGaEkImEOszzaX16TLOOMY14yHvuCpdURzrOj2Sa31l3qWkcdqFwT/tZN
J9dYfTr7FxV2DJU0urgJv0QaFSwWY0Wr8D+n2A3LoyOGLM8fHtj8J3VEUVWUNqOt
5N1YNqtvIN+Or8PQZ9BA5k0OFR5d/rMEcnvJEEo+J0KCYtMd30eAwi+4mpKoL6t7
r1/J3bdaaIh0716vK5CFUu9vPItknpkEy+2Cqv3KPOXMn5GS1MXfsjEWeI97HmRR
hfCpE8pQXbkc9ItL7EgiarfSWVtGVk6QzGTES3S+okQCZeg5xLhDORm8hLpHBxjX
M+CFCX5F0y1EEaQkB91gdAKKGmP7Ah2FSWTxqRyYWMkL3LnPgDEVa6bxG7BiQoi/
Tm/V5rbOMr3BV+dqfTSEIh902BzL4yRs5dnKygDaPbzCNES066UYAL7vX7zhmN9S
AaWuhIh2eg9yRBjKhizB0xyeobym77ezMHmf8eJubGfvo69boba6EBB3KnISqz93
UKpfh27+DfSVsXqYSkMyDVs7WNjbEIjoVNgMeXdMmP9Le/7bDbz/SX0suND+mfLa
FznujIbymWlCkluSWfMGKW9eR1lkcyQiWCZmKCDVJuotGnAnAJPMMOnfSu2l3Kv9
Op0JKRDeGXo=
=94a2
-----END PGP SIGNATURE-----
