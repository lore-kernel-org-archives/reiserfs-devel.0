From: Valdis.Kletnieks@vt.edu
Subject: Re: Processes dying?
Date: Fri, 04 Jun 2004 17:33:18 -0400
Message-ID: <200406042133.i54LXIXN031219@turing-police.cc.vt.edu>
References: <20040604203925.GF4990@nysv.org> <200406042050.i54KoDYD029229@turing-police.cc.vt.edu> <20040604210130.GH4990@nysv.org> <40C0E503.6010904@gmx.net>
            <20040604212312.GI4990@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1397250256P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 05 Jun 2004 00:23:12 +0300."
             <20040604212312.GI4990@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>, reiserfs-list@namesys.com

--==_Exmh_1397250256P
Content-Type: text/plain; charset=us-ascii

On Sat, 05 Jun 2004 00:23:12 +0300, Markus =?UNKNOWN?Q?T=F6rnqvist?= said:

> The syslog is corrupted as is always the case with reset-button boots,
> but I took a copy of the syslog file which vanished into thin air.

echo t > /proc/sysrq-trigger     (to produce a traceback)
echo s > /prog/sysrq-trigger     (to sync the disks)

Of course, if your syslogd is one of the processes wedged up, you won't get much....

--==_Exmh_1397250256P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAwOqecC3lWbTT17ARAuiZAKDOhnr1Qj1QhZml4v4EuiaYT+ArJACg+/tg
o9Ip+IPUwSf9sWRihjkTiEY=
=LmbV
-----END PGP SIGNATURE-----

--==_Exmh_1397250256P--
