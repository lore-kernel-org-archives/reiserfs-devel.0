From: David Masover <ninja@slaphack.com>
Subject: Re: reiser acceptance (was Re: Atomic filesystem or not)
Date: Tue, 20 Jul 2004 02:39:59 -0500
Message-ID: <40FCCC4F.6040709@slaphack.com>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> <40F6E06B.1080505@namesys.com> <40F73370.2090600@slaphack.com> <40FB876E.1050200@namesys.com> <40FC3730.80908@slaphack.com> <20040720065253.GW4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040720065253.GW4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Hans Reiser <reiser@namesys.com>, Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Markus T=F6rnqvist wrote:
| On Mon, Jul 19, 2004 at 04:03:44PM -0500, David Masover wrote:
|
| But hopefully sys_reiser4 will be the standard, yes?
| (Also, rename it to sys_reiser, the number makes it a bit more unclear,
| more bound to the fs, not to the guy behind it)

How many versions of Reiser will there be?  If you can get a separate
system call for each one, go for it.  Then you can always support
sys_reiser4 on newer versions, and people use sys_reiser5 and so on to
support newer features.

Unless, that is, you've already made it so modular that people who call
sys_reiser on reiser4 won't find it broken on reiser5.  If you can do
that without cruft, you are amazing, and the number should go.

|>Being right isn't enough -- being right makes you Tesla, not Edison.
|
| I remember hearing this story in school, but it was four years ago :)
| Was it something about Edison being the ultimate asshole who sabotaged
| Tesla all the way for his own fame, and he won in the end?

Possibly.  My point is Tesla was a genius who died poor and Edison was a
hard worker who won.  My guess is that Edison understood business and
people a bit better than Tesla, who understood electricity a bit better
than Edison.

| Also, I think Debian inclusion is a bad target, you have to hit upstream
| first. Debian maintainers are probably more difficult people than
| the upstream maintainers ;)

What about Gentoo?  (I just mentioned this in an email, probably sent
exactly the same time as yours.)  Gentoo maintainers welcome new,
unstable stuff, as long as it's well isolated -- use the ~x86 flag if
it's a package, or a USE flag if it's a patch.  So we just add a reiser4
USE flag.  As long as they can warn users away from it because of
possible instability (as they did with the gtk2 flag), we're fine.

What one distro does, others are more likely to do.

| Anyway, a patch repository is a good idea. Maybe one entirely open to
| the public as well, to begin with. Anything that brings forth easy

Not really.  Best thing?  A Gentoo SYNC mirror or a Debian source, or
the Fedora equivalent (if there is one).  That is, the next best thing
to a Gentoo USE flag.  A lot of work for us, but users who want the
latest reiser4 can get it, using a package manager, not patch and make.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQPzMT3gHNmZLgCUhAQI3oQ/+N0lxb2P2FJgkNeCJYaLiSXGlVac42XdE
Ei3bR+wq4VXdQef7CqoI/38eljiI8wtZQgchlguSsG5DGp+NVquPnGYNXsX8/Lys
TDsb3I8iE5tXLEHjA7W8LS83TEZVQVWNsoAIRru565dqIuNrySOAdM4zeG4OtBvn
xwZ3E3qWv3VfQCz9t4xty/NsMa8CIuRr+ceF+nBp6UCqTRax2sT5J8VT9fA73hCq
OkN6au90/qmQBVnW8MgVjZCkKiHan7UNqBduaJ+YjxDUfyRJcb4cNaygSNxZ0idp
tdriYR2f+0IbJcBSxe3lqaKLhQxhM6iZJDNsGsA8Dorqv7dx/icMxBABkf24rRyg
oPpwtFal7WEOt9ENZyuMmLXVT4m8gOHshhu+FmyHFbuuvDPE2fJZIgerh/tqt/QH
FfIgrAuQFA64mHCGXmPdZuh6S3xPGlVSxM0vLpclvI8ZT69/lATL66GQ7d7ZZ4id
t75VnQc2LwRk013BTn027840FdExS6q5/QG7ikwIDKAPUcv/Ze5H08Skt5RnN4ca
iPyRXohKB6Wce40w4UekaJievKN91kD5HTh+suyEjfPZtqKXpRjtQj1kb2Z80zXj
/MWfvhY1xQUgG8IBiqqd1+BuHBLTKx3B9SdSnWik/RrM1Q55ucajoR0D3dSCNFPk
tL/mhlt0KtE=3D
=3DskcC
-----END PGP SIGNATURE-----
