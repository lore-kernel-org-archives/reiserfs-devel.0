From: David Masover <ninja@slaphack.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 20:00:22 -0500
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4133CDA6.4060105@slaphack.com>
References: <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <20040826100530.GA20805@taniwha.stupidest.org> <20040826110258.GC30449@mail.shareable.org> <20040827210638.GE709@openzaurus.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040827210638.GE709@openzaurus.ucw.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pavel Machek <pavel@ucw.cz>
Cc: Jamie Lokier <jamie@shareable.org>, Chris Wedgwood <cw@f00f.org>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pavel Machek wrote:
[...]
| uservfs does
|
| cd foo.deb#uar
cd foo.deb/ar
| vs.
| cd foo.deb#udeb
cd foo.deb/deb

and why would you want that, instead of just:
cd foo.deb	# for the ar
dpkg -i foo.deb	# for the deb

|
| and
|
| cd foo.tgz#utar
cd foo.tgz
| vs.
| cat foo.tgz#ugz
cat foo.tgz

Just want to extract the tar file?  Maybe something like
cat foo.tgz/gunzip
In which case (of course) foo.tgz/gunzip has exactly the same directory
contents as foo.tgz

Looks different, that's all.

In fact, for just about any syntax anyone could suggest, I can't really
see why you can't just replace all weird symbols with a slash and a
symbol.  Instead of
	foo.tgz#utar
you have
	foo.tgz/#/utar
Only difference is, some things which used to require special tools can
now be serviced by less than what's in busybox.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTPNpngHNmZLgCUhAQJ0PA//RmPgHL4MgiQn7Li5b52DI/0p+Zp9JUs7
OaA+k4wHeXEIdBProtBQ+3541noEg086bVriYRnajsA9xgd/P9ncE7ci/d9Kagdl
8KmH4eWnCjNkL4x8GnDeR+EM5EfcgoSxR7ezO1KO9uMMcPFnCvmeB1yB5U+Fr9Q1
HVPHfGsh+ZWU2CFJHoJx27Q07UK+bFvzGr4JkhLbRMbPeEROrkHJHp3wj/N2yXXb
5icLgFa0g/b6wM8SuBAaO5xVM8jkmECI/P5Jo3n/d/CTUumb/BoKMIgbMurR61CG
hrZ40mizpCMFAnLrgm9FIvjKtZUsigG+oM/2xTtku2Z2nSM16/ChKtJOAj6MoMGT
xvWzLdTY6kEL30VDaHtcVvIyUFtUe5oYxEasnrcKseV7hJtccgjTYKB21PnWyZFz
/KIdh8sBg6i1nuYOtHncL6agD1M2bg1vBYwbMvIRfa1YbAFUbW1A6hDTftxJIhLn
Beso6d68SyfNMdQ8yWloR7sIufmbDut2fx1SHS3wPt2Z5W1e0XBexcpSqdD8KPns
lvmC0ggPDuQzXjPCIsS17Uk5vrCtVEdrsCCaj62a8UE2d1mCqu4CyLwMYCFv3Sve
SwZ36iOv4fzdvgjPOUg27tMwbpa/WiDAcZJ/31BfZfTDl4E9LbkQjWYT/YgsJuaQ
wp3Hi/Cgh/4=
=8YVp
-----END PGP SIGNATURE-----
