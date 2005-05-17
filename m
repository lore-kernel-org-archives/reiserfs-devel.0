From: David Masover <ninja@slaphack.com>
Subject: Re: file as a directory
Date: Tue, 17 May 2005 17:51:20 -0500
Message-ID: <428A7568.6080509@slaphack.com>
References: <92232506676-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24069-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <92232506676-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: Leo Comerford <leocomerford@gmail.com>, sean.mcgrath@propylon.com, reiserfs-list@namesys.com, Peter.Foldiak@st-andrews.ac.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alexander G. M. Smith wrote:
[...]
>>On the other hand, garbage collection will be a significant hurdle,
>>for two reasons. One is cycles. [...]  The other is more
>>sophisticated needs for automatic deletion.
> 
> 
> Neither are impossible, we just have to pay the performance price
> for the luxury features.

How much of a price do I pay?  And could that price be avioded by only
enabling those features for directories where I want them?  Could that
be done easily in Reiser4?

My mind isn't able to easily wrap itself around the point of having this
strange new kind of hard-links, but I'm willing to try it if there's no
performance hit for the rest of my system.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQop1aHgHNmZLgCUhAQJX6RAAgfnqnGGHRt+tzYNct9PfilJisPsOMwNV
EjH9dBvoU0e5WpNmFKAuwfzwscWZzLaPC/qyucKPWnr02AdroklGtId8DQdy9QWh
fYKc8/fFzDwwMyAu1r2vHNTbERBUX8GrKIMCeLRFnOLkgHdNDZ5vpn/bbWLZh0Tc
gMt6+qw8QU0qowWCoGtPadxR00C388Cc4QWiZAdaZhEF89gWX+Zhnwuhqtsni0aN
/h0gfXNArv3GgCefwG3WX+NDeikWLrZodpg9L3swJ2lWzVrikZ6yMET08NiG39Ih
iWLwrd5DCR8fIXir+jYeJBRCenoqx/LbqJmXkc7TengiddAob9WCFgcWYPbF4Mlv
vNBy/k9O+S8ds89GZwJAiaw/NO3YNuvf0I8SGo94KGlYhoVPPEq/lEZ2t0o5EiXn
nFyHYVhPSH9UG4ttGXDSuMiOikCbmeF1J9oLWhmnLoIXQ93kk6NOQYl4DgXGdOwD
QUM/xOPex69RW9RkNx8c4LygHssJeIAxxc6jhginWW+O/1Vgt6lfG1zlb22BXjls
n8Yi83gPn5d0fUGy+ss6xLIION6M9aWGpIxB/IMLjEV8Fwy+YR1qZqrSLJkVECZ1
oHtVq5A2uKDLr0xVZHdbxWyefFcSk73DkINBqDC6Vt8a+HCx/dqNHI3a1x2oaoR2
7ip1veAMiaI=
=DNyQ
-----END PGP SIGNATURE-----
