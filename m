From: Julian Blake Kongslie <jblake@omgwallhack.org>
Subject: Re: silent semantic changes with reiser4
Date: Tue, 7 Sep 2004 18:29:45 -0700
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040907182945.6d5f5ff5@amebiasis.omgwallhack.org>
References: <200409070206.i8726vrG006493@localhost.localdomain>
	<413D4C18.6090501@slaphack.com>
	<m3d60yjnt7.fsf@zoo.weinigel.se>
	<413DFF33.9090607@namesys.com>
	<m3vfepiv7r.fsf@zoo.weinigel.se>
	<Pine.LNX.4.60.0409071528200.10789@dlang.diginsite.com>
	<413E40D1.nailFBI11XFML@pluto.uni-freiburg.de>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="pgp-sha1";
 boundary="Signature=_Tue__7_Sep_2004_18_29_45_-0700_VYW7IkN3ETwnX+Wg"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <413E40D1.nailFBI11XFML@pluto.uni-freiburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Gunnar Ritter <Gunnar.Ritter@pluto.uni-freiburg.de>
Cc: David Lang <david.lang@digitalinsight.com>, Christer Weinigel <christer@weinigel.se>, Horst von Brand <vonbrand@inf.utfsm.cl>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Tonnerre <tonnerre@thundrix.ch>, Spam <spam@tnonline.net>, ReiserFS List <reiserfs-list@namesys.com>, Hans Reiser <reiser@namesys.com>, Pavel Machek <pavel@ucw.cz>, David Masover <ninja@slaphack.com>, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>, Alexander Lyamin aka FLX <flx@namesys.com>, Chris Wedgwood <cw@f00f.org>

--Signature=_Tue__7_Sep_2004_18_29_45_-0700_VYW7IkN3ETwnX+Wg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

On Wed, 08 Sep 2004 01:14:25 +0200, Gunnar Ritter
<Gunnar.Ritter@pluto.uni-freiburg.de> wrote:
> Having a separate S_IFXXX type for streamed files would also give
> attention to portability issues easily. It might in fact be better
> to have existing applications fail explicitly with them than to
> make this as transparent as possible, but hope for good luck.
> 
> Utilities like 'tar' would just say 'Unknown file type' or the like
> and exclude such files from the archives they create. This would lead
> the user's explicit attention to the data loss. He might then choose
> to ignore the error, or to get a special version of 'tar' to handle it.
> 
> It would also be clear to programmers and users that such files are
> special things they don't normally need. Regular Linux installations
> might totally ignore them. If streamed files are only intended for
> use with CIFS or other special cases, that might be a more clean
> solution for this issue than watering down the existing portable
> file semantics.

You could actually use two S_IFXXX types - one for stream files which
should be archived by backup programs because they contain real
information, and a different one for stream files which should not be
archived because they are merely a different "view" of data from the main
file. This simplifies the archival problem because legacy programs would
complain that the file types aren't handled - alerting the user to
potential data loss, and updated programs would automatically backup only
the attributes that are required.

-- 
-Julian Blake Kongslie
<jblake@omgwallhack.org>

--Signature=_Tue__7_Sep_2004_18_29_45_-0700_VYW7IkN3ETwnX+Wg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFBPmCPuU009xtCYDURAjnEAJ9M39DH9swoWycXObvE3kYssKsnAwCgjcWc
cdDqkEpSxjBfap9yjUtgrdQ=
=Gx15
-----END PGP SIGNATURE-----

--Signature=_Tue__7_Sep_2004_18_29_45_-0700_VYW7IkN3ETwnX+Wg--
