From: Todd Lyons <todd@mrball.net>
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Thu, 7 Nov 2002 01:02:56 -0800
Message-ID: <20021107090256.GC11974@mrball.net>
References: <9918235451.20021106132043@kgpa.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yVhtmJPUSI46BTXb"
Return-path: <reiserfs-list-return-11940-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <9918235451.20021106132043@kgpa.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS-List <reiserfs-list@namesys.com>


--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Oleg O. Ossovitskii wanted us to know:

>BTW: is anywhere diff to apply Reiser4 to plain 2.5.x (not bk tree) or I h=
ave to made this
>manually (by hands)?

It applied for me to the 2.5.45 tree with only one reject, mm/swap.c.
It wants to add a #include, but what's there is not quite like what the
patch expects.  You'll actually have to add two lines, not just one.

Still compiling.  In the reiser4 code right now....well, it built and
linked.  That's a good sign.

Here are the .config settings that I used:
CONFIG_REISER4_FS=3Dm
CONFIG_REISER4_CHECK=3Dy
CONFIG_REISER4_DEBUG=3Dy
CONFIG_REISER4_CHECK_STACK=3Dy
CONFIG_REISER4_DEBUG_MODIFY=3Dy
CONFIG_REISER4_DEBUG_MEMCPY=3Dy
CONFIG_REISER4_DEBUG_NODE=3Dy
CONFIG_REISER4_ZERO_NEW_NODE=3Dy
CONFIG_REISER4_TRACE=3Dy
CONFIG_REISER4_STATS=3Dy
CONFIG_REISER4_DEBUG_OUTPUT=3Dy
# CONFIG_REISER4_NOOPT is not set

Curious if anybody feels that I should have chosen different values for
any of the options.
--=20
Blue skies...		Todd
| Get a bigger hammer!   |  Normal?  Normal is a setting on       |
| http://www.mrball.net  |  my dryer.                             |
| http://faq.mrball.net  |     BayCon 2001 http://www.baycon.org  |
   Linux kernel 2.5.45   1 user,  load average: 1.19, 0.88, 0.40

--yVhtmJPUSI46BTXb
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9yixAIBT1264ScBURAjTUAJ9gkleVQpBLBkQTVtrp8nqwVcY8VwCcCyqm
Io75H4P6lAVxpqKPLtfHde4=
=XXsy
-----END PGP SIGNATURE-----

--yVhtmJPUSI46BTXb--
