From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Repacker statistic tool
Date: Sun, 17 Oct 2004 20:28:31 +0300
Message-ID: <20041017172831.GJ26192@nysv.org>
References: <200410171817.40160.sikkh@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22084-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200410171817.40160.sikkh@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Piotr Neuman <sikkh@wp.pl>
Cc: reiserfs-list@namesys.com

On Sun, Oct 17, 2004 at 06:17:40PM +0200, Piotr Neuman wrote:
>
>My stat tool is based on Markus T=F6rnqvist code. It prints out repacker s=
peed=20
>and total work accomplished along with average values at exit. Download:
>http://kem.p.lodz.pl/~peter/reiser4_repacker_stats.py

I did a little something to that code :)

I think this one is pretty far final, until I muster up the time
and feeling to do something again.

http://mjt.nysv.org/reiser/repacker_stats/reiser4_repacker_stats.py

Beside some minor cleanups, it can be ran as root to start the
repacker, which also stops it.

--=20
mjt


