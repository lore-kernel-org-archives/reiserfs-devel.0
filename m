From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 plugins
Date: Sun, 26 Jun 2005 20:59:27 -0400
Message-ID: <200506270059.j5R0xS3s031483@turing-police.cc.vt.edu>
References: <200506240241.j5O2f1eb005609@laptop11.inf.utfsm.cl> <42BCD93B.7030608@slaphack.com> <200506251420.j5PEKce4006891@turing-police.cc.vt.edu> <42BDA377.6070303@slaphack.com> <200506252031.j5PKVb4Y004482@turing-police.cc.vt.edu> <42BDC422.6020401@namesys.com> <42BE3645.4070806@cisco.com> <e692861c05062522071fe380a5@mail.gmail.com> <42BE563D.4000402@cisco.com> <42BE5DB6.8040103@slaphack.com> <200506261816.j5QIGMdI010142@turing-police.cc.vt.edu> <42BF08CF.2020703@slaphack.com> <200506262105.j5QL5kdR018609@turing-police.cc.vt.edu>
            <42BF3221.3000909@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1119833967_3659P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24646-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sun, 26 Jun 2005 15:54:25 PDT."
             <42BF3221.3000909@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: David Masover <ninja@slaphack.com>, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

--==_Exmh_1119833967_3659P
Content-Type: text/plain; charset=us-ascii

On Sun, 26 Jun 2005 15:54:25 PDT, Hans Reiser said:
> Valdis.Kletnieks@vt.edu wrote:
> 
> > (Hint - work out how long a kernel 'make' would take
> >if you were doing it inside a .tar.bz2).
> >  
> >
> After the first time, not very long, if you had enough ram....  the
> plugin would keep the data uncompressed until it flushed it to disk.

You're not allowed to use current existing stuff like the disk buffer cache
to weasel your way out on this one.  "if you had enough ram" has been true
for decades.  The trouble is that quite often you *don't* have enough ram....
 
> Performance might even improve since less would be written to disk.

I've worked with filesystems where performance improves due to compression
(AIX's JFS).  It's a lot harder to provide an improvement if you're writing
37 more bytes in between bytes 399457 and 399458.... (I suppose by aligning
byte 399458 so it actually is on the start of a 4K block you can do that, but
then you're losing the advantages of the compression.. ;)


--==_Exmh_1119833967_3659P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCv09vcC3lWbTT17ARAoKhAJ4qShq0+lR49kHjXmTm/sbMSFyYNwCfQtXm
HEvbkLKJcz7y0bUM+LHx0RQ=
=R6xt
-----END PGP SIGNATURE-----

--==_Exmh_1119833967_3659P--
