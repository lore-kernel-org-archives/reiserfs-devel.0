From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Fri, 23 Jul 2004 13:21:02 -0500
Message-ID: <4101570E.9080603@slaphack.com>
References: <40FE0B47.3010600@slaphack.com> <20040721063607.1A09015C92@mail03.powweb.com> <20040721083232.GA4990@nysv.org> <40FF3DAD.6020100@slaphack.com> <20040722100657.GC4990@nysv.org> <41007BC6.3060209@slaphack.com> <20040723094242.GL4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040723094242.GL4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1




Markus T=F6rnqvist wrote:
| On Thu, Jul 22, 2004 at 09:45:26PM -0500, David Masover wrote:
|
|>| UPDATE formatting SET policy=3D'never\0' WHERE policy=3D'smart\0' RECUR=
SE;
|>| instead of just
|>| UPDATE formatting SET policy=3D'never\0' RECURSE;
|>| which may break something else...
|>
|>Both should be allowed.  Can that be done now?  And with echo, not SQL.
|
|
| I can't check now but maybe:
|
| for dir in $(find . -type d); do
|   format=3D$(cat $dir/..metas/plugin/formatting)
|   if [ $format =3D=3D "smart\0" ]; then
|     echo -e 'never\0' > $format
|     for file in $(find $dir -type f); do
|       cat file > /dev/null
|     done
|   fi
| done

I was thinking a plugin.  Also, "metas" is _still_ the default on the
auto snapshots.  I change it to '...' whenever I feel like looking at
the code.

"find -type d" would most likely not work.  I'm thinking of an attribute
which would apply to every type of object, including files, also files
which are directories, and so on.  Mainly just a few flags -- right now
I'm thinking "never purge me from cache" and "I'm a stub; if something
actually tries accessing me, pull me from the network."


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQQFXDXgHNmZLgCUhAQIsSBAAiThNM1TkyvVQzkhK48RPzrAlM8T3rYTW
QWYCdY5TjIQ5svt/m+hj27HPAFh1PCU/ZtRIE3lv01eGHmlz5/560r2v3VAIHlpn
GQEJaw587hcvN+owUsj4PgajIWX1tJJ5fiyfV3Llq6QqJhb6jm8UxH9mX/03Gz0d
p76AbtBF0z8xDxt87lEwTrhxWZmgas1H+qyPnCR1F4fFEn54H7DA4Sp9e+5rqtGJ
8p9kXlYgjigfxjITkXCYlA3k/9K3+T7bWvlM16P8Buf9O4HaUKhAv/s1mAx6iJVy
FUPxzaz9hF169O89RGWAbbyxZ9k2Z7+VK9sxLoiqkTRKNqBfZv8sdQyQ9r9ZwBxc
HKfF2Ndzjd3pR/NES1ukvECHqjsSmXI3fRFBB80x+o1hM/+MvoZjtCcn3H/Aes96
yKgwR3UFYnZfBi9PHOdQn2sOfGXJaEj1n37QeuyGEAmUZb/5Zf/ukMfYyhBfgqPY
rZw7QSY71bhrbRu0k1/cZ6kkEvdyAA90+nAzwyHMqLktPZ/uZc324HfyudrAb6cy
g7x3mM8Jj5Wm7XK1lD6OU1EsJQcNNt/dsRdZgT82tX4w+ZRbedYEhWqCM1ER83OS
pwmWTiumpxbDgCWyrEDOyHtfihPJkPmz4xBHytKrX/pRKVCqNl28UPw32gJA0P4i
uwkYWv8vnDI=3D
=3D2D+S
-----END PGP SIGNATURE-----
