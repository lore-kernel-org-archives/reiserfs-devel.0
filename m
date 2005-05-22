From: Valdis.Kletnieks@vt.edu
Subject: Re: Re[2]: Reiser4 O_DIRECT
Date: Sun, 22 May 2005 18:47:51 -0400
Message-ID: <200505222247.j4MMlr85008867@turing-police.cc.vt.edu>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com>
            <1695540869.20050521234900@wp.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1116802070_3542P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24111-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 21 May 2005 23:49:00 +0200."
             <1695540869.20050521234900@wp.pl> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: reiserfs-list@namesys.com

--==_Exmh_1116802070_3542P
Content-Type: text/plain; charset=us-ascii

On Sat, 21 May 2005 23:49:00 +0200, Pysiak Satriani said:

> I remember Hans saying that r4 is so stable that the developers themselves
> can not find any more bugs.

Which in reality probably means "It *probably* won't eat your data".

Remember that the developers have a limited number of different hardware
configurations, and a limited number of test tools, and a limited number
of ways they use the file system.

So there's probably *plenty* of bugs still to be found - most of them the sort
that nobody will expect, and won't be found until some user's creeping-horror
database application that's written half in Cobol and half in Python does something
totally stupid but legal.....

I've been on both ends - beta tester for software the developers weren't
finding any more bugs in (I filed over 300 bug reports against the product
anyhow), and had users find fatal bugs I couldn't find (my favorite had to be a
user who managed to crash software I wrote by entering a backspace character.
On an IBM 3270 terminal. Which doesn't *HAVE* a transmittable backspace
character - backspace is handled locally in the terminal....)


--==_Exmh_1116802070_3542P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCkQwWcC3lWbTT17ARAplnAKD07CrULxakhjueJr9miANWv7SgUACfeTT6
fmcZqWYb7r94k59MqOVjZmk=
=w5ge
-----END PGP SIGNATURE-----

--==_Exmh_1116802070_3542P--
