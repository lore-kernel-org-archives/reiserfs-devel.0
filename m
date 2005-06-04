From: David Masover <ninja@slaphack.com>
Subject: Re: File as a directory - VFS Changes
Date: Sat, 04 Jun 2005 15:13:07 -0500
Message-ID: <42A20B53.8090807@slaphack.com>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>	<429C7D0A.6040200@namesys.com>	<200505311630.j4VGUeIt007432@turing-police.cc.vt.edu>	<1117558515.13252.21.camel@localhost>	<429C97F9.8000009@namesys.com>	<1117559594.13252.26.camel@localhost>	<429CAC86.3080308@namesys.com>	<1117573285.13252.63.camel@localhost>	<1117573714.13252.69.camel@localhost>	<17052.59096.785042.935234@gargle.gargle.HOWL>	<1117580508.25017.21.camel@localhost>	<17053.36948.892227.432434@gargle.gargle.HOWL>	<17053.37172.885941.857716@gargle.gargle.HOWL>	<1117634812.26560.33.camel@titania.zlynx.org>	<17053.51551.825703.450388@gargle.gargle.HOWL>	<1117640452.12866.9.camel@localhost>	<17053.61465.359382.791640@gargle.gargle.HOWL>	<1117652606.28827.7.camel@localhost>	<17054.57795.295945.256623@gargle.gargle.HOWL>	<1117737334.9224.51.camel@localhost>	<17055.39986.10130.284697@gargle.gargle.HOWL>	<42A099F6.20208@nam
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17058.1217.672209.187032@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, Jonathan Briggs <jbriggs@esoft.com>, Valdis.Kletnieks@vt.edu, "Alexander G. M. Smith" <agmsmith@rogers.com>, leocomerford@gmail.com, reiserfs-list@namesys.com, Nate Diller <ndiller@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nikita Danilov wrote:
[...]
> It seems to me that in the domains where proposed designs are
> applicable, symlinks already provide viable solution.

It's a little late in the game for me to jump in, but can someone else
comment on this?  Is this a "viable" solution in the same way that gnome
VFS is a "viable" solution to the problem of transparently handling
zipfiles and such?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQqILU3gHNmZLgCUhAQLJKg//a+czcmSVqsDXcDKgAJx+3iCfsDeJRmKd
sZJt0vIBD6EEOQLrx7dnADkPiSg5KBY/6fJCq4eb/1PyugO61iDFavoMW13gztJ3
WuodCrni3OPgzQhU640rkURGR5RcM9efd0pdG/9gA6jQrjGt5B/UYdL7cZOa5PAa
yb6+SdfQXqyi2cwpzWY3glZy8260Lk/J910j16a2IwugG9jC+q2YXmEfuaM4feib
rgE+79a9a54FnxGsn+KYcHvRbQyxT6FrDhA5G6TN5KXyduqgi5CWyY1Fu44tOnwR
P5Css4se/fY7vguBaebzF/qcGNZ3R8YqQbimdgmxgycrbFoz4sKX/IO3uPKXu9AO
yK8YHmutPBxs9O1iorz3niX0KA9OE26IGb0TmOea97p5dyGG3LKqDIDj2RaCzr4O
D2t1ErMlJQhSO5TevzVLMWrBVsS8B845ML2DrJMS0M0gaAZ9KRqKHo2vL3rpKl+R
oUukFEnfi7anIClMc1TNkycRYJfOUlvPkjHEoPXrgLyjlbJ2raPBzTSSEO02dNgm
eITAKAKCY8PQDeUnB1omCAER3mbNTBwi+f1F0UiQZzUcLJNAVyNyuSzCCJHoRoO3
39kmTgv0E3lh8tcsplMIysCWTTSqQUPbF/N07u/B20oqQ47Nd6Ttt6kADNNvjXP6
2+4158WYoxc=
=Vc/s
-----END PGP SIGNATURE-----
