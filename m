From: Valdis.Kletnieks@vt.edu
Subject: Re: What does this mean?
Date: Fri, 12 Jul 2002 09:26:55 -0400
Message-ID: <200207121326.g6CDQu3u003587@turing-police.cc.vt.edu>
References: <3D2993E5.6030707@tpg.com.au> <20020708190923.A928@namesys.com> <3D29BA3F.7010201@tpg.com.au> <200207081228.56302.kuba@mareimbrium.org>
            <3D2E6DAB.9050400@tpg.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-93303640P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Fri, 12 Jul 2002 15:48:27 +1000."
             <3D2E6DAB.9050400@tpg.com.au> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Basil Chupin <blchupin@tpg.com.au>
Cc: reiserfs-list@namesys.com

--==_Exmh_-93303640P
Content-Type: text/plain; charset=us-ascii

On Fri, 12 Jul 2002 15:48:27 +1000, Basil Chupin said:

> Please let me give a brief resume of why I am trying to find out why my 
> HD is being accessed every 5 seconds (actually it is also occurring on 
> another computer at home and a friend's machine -- and all are running 
> SuSE 8.0).
> 
>   I first asked this Q isn another forum and received the general reply 
> that it all had to do with the reiser fs -- which I didn't really 
> believe. Why? because I didn't recall having this "problem" when I was 
> running SuSE v7.2 with reiser fs. But just to be sure I started doing 
> some testing.
> 
> I have another HD which I use for testing purposes and on this one I 
> installed SuSE v7.2 undere reiserfs. There was no 5 second accessing on 
> the HD.
> 
> I then installed SuSE 8 with ext3 (because someone said that the 5 
> seconds-thingie only happened under reiser) - and I still got the 5 secs 
> access. So, it wasn't confined to reiserfs.

Note that ext3 *also* has a 'kjournald' that ticks every 5 seconds.

I'm willing to bet that the system that wasn't seeing the ticking had all
the filesystems mounted as ext2, which doesn't have a journal.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-93303640P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9LtkfcC3lWbTT17ARAhe9AJ9h4XIi9l2s3uA2S6F8DjreBojksACfYf8O
HkR1oWoM6jMXGA98e4so5Jk=
=ZSSL
-----END PGP SIGNATURE-----

--==_Exmh_-93303640P--
