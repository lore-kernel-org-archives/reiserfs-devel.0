From: David Masover <ninja@slaphack.com>
Subject: Re: The argument for fs assistance in handling archives
Date: Thu, 02 Sep 2004 20:39:19 -0500
Message-ID: <4137CB47.1070805@slaphack.com>
References: <20040826150202.GE5733@mail.shareable.org> <4136E0B6.4000705@namesys.com> <1117111836.20040902115249@tnonline.net> <200409021309.04780.oliver@neukum.org>            <4137BE36.5020504@slaphack.com> <200409030118.i831IUc6006797@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21387-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200409030118.i831IUc6006797@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: Oliver Neukum <oliver@neukum.org>, Spam <spam@tnonline.net>, Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, viro@parcelfarce.linux.theplanet.co.uk, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Valdis.Kletnieks@vt.edu wrote:
| On Thu, 02 Sep 2004 19:43:34 CDT, David Masover said:
|
|
|>And on apps.  Should I teach OpenOffice.org to do version control?
|>Seems a lot easier to just do it in the kernel, and teach everything to
|>do version control in one fell swoop.
|
|
| Including files you didn't really want to keep version control of?

No one said you have to apply it to everything.  Only that you can.
Right now vim cannot do version control, AFAIK.  But you could do
something like:
	echo 1 > foo/version_control
	vim foo

Default would be off, of course.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQTfLR3gHNmZLgCUhAQKybRAAkF4sqLUCJEfpDNvKEyv8MJGcy0w+qV12
3Rf50OQeeurZMZrnli0vNIuSIWwIsGI+j7qbj1mlfi+Ps3dAjOlKXav3tGoGshLl
HH/Wl9XvGPOAWlIQOqqBGAyno8sDIvHAjh5lH3C7m+9/2Ao7s1G/bQ+hm/deYPJK
WPZxExd/1BdchrbjNjbfWHKrD6LdF/GBa/Vbj1F8m95WEvxsfbDnSTwb5HhvcUxD
TtqwkINmx7Tle2p9q7PcgR7y76dmcyoWw82ST3BfF/AbGauMQAr0h6jNjvzclfgJ
yrIOwGXdR3pn8ZK8dHVct79N0f+PYFdeAzLYxMZR2vefB2enQolbbs6Lf7X60g2g
5hrH/ezenFJIZMPhQtlJqBaFuA5GHw9B2An6VbOmDm7sSOFyHSlKoCUFlJ/I5nZd
Bcn46lhNxvTJhu3tvnvDqTB8f0/yVYt5QfoBFA1mzHKig2iNN6vr2xLGdWSLU6XD
vRjy+KyVC+PvjL13E0JrjXy9UuqY7CH2xAunSgLJ2cvfRmNRoVoV1hkp3McQcUqF
GiD3s0REcztlvsrP+DxKLRtPpnOJi5By5NmZpJkiPdVB9zpIsL/Ia7KL/A7IGGh3
IF3t/xSUmjgrek01SeadHqsIngeWQ+F8fiars7NtzNhrvRgPVfDVheey3vhQjFxM
3kDKH+I9rGk=
=3+nq
-----END PGP SIGNATURE-----
