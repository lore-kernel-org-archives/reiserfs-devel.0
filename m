From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Reiser4 status as of this weekend
Date: Thu, 20 May 2004 11:45:56 +0200
Message-ID: <m3d64zzb1n.fsf@merlin.emma.line.org>
References: <003a01c4377d$d653eac0$7d02a8c0@toronto.chantrynetworks.com>
	<40A68F75.2030306@namesys.com> <20040515221017.GL1232@nysv.org>
	<40A7A553.2020901@namesys.com> <20040519195056.GM24604@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18781-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040519195056.GM24604@nysv.org> (Markus
 =?iso-8859-15?Q?T=F6rnqvist's?= message of
	"Wed, 19 May 2004 22:50:56 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-15?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Hans Reiser <reiser@namesys.com>, Russell Treleaven <rtreleaven@chantrynetworks.com>, ReiserFS List <reiserfs-list@namesys.com>

mjt@nysv.org (Markus T=F6rnqvist) writes:

> I'm trying BK pulls. Yesterday it didn't compile, xfs seemed broken.
> Retrying now, after bk -r get.

Try "bk -Ur get -S". That's a bit faster and doesn't check out BK stuff,
only the actual user data (read: source).

--=20
Matthias Andree

Encrypted mail welcome: my GnuPG key ID is 0x052E7D95
