From: David Masover <ninja@slaphack.com>
Subject: Re: The situation at hand and in the future
Date: Mon, 31 May 2004 10:12:57 -0500
Message-ID: <40BB4B79.8020000@slaphack.com>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <20040529154917.GW4990@nysv.org> <40B919DF.3040408@slaphack.com> <20040530122713.GX4990@nysv.org> <40BA802C.5070907@slaphack.com> <20040531083835.GB4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040531083835.GB4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Markus T=F6rnqvist wrote:

| Let's see what the Namesys guys have to say about this, but somehow
| this must be reasonably solved.
|
| Maybe they're sitting on some spec and just haven't had the time
| to tell us.

Hope springs eternal.  Namesys guys?

| Have you, by any chance, had time to look at the code?

| Maybe I should take a vacation and learn C really well and read all
| the Reiser4 code :)

I know C tolerably well, I just need to spend the time learning
reiser4's code.  This is currently impossible.  I'm in high school and
on the verge of failing math (due to laziness, not lack of ability).
However, summer vacation is in a little over a week.

| But it seems possible that you can't do both with the same plugin.
| If it's echo zlib or echo blowfish, unless there's echo zlib+blowfish,
| which would actually be much cooler with symlinks.

Easy:

$ ln -s cryptos/zlib crypto/1
$ ln -s cryptos/blowfish crypto/2

Not as graceful when only one is wanted, though.

| I heard once that using many encryptions may reduce the level of security.
| I don't know if there's any real truth behind this. But if there is,
| maybe it should be impossible to support two cryptos, only a crypto
| and a compression.

I'd rather allow people to be as stupid as they choose, but this would
make the above syntax a bit less ugly:

$ cd ..metas/crypto
$ ln -s ciphers/blowfish cipher
$ echo 256 > bits
$ cd ../compress
$ ln -s codecs/zlib codec
$ echo 9 > level

This allows us to allow things like bzip2 instead.  Default should
probably be zlib, at whatever its default compression level is, on files
which are encrypted.  (Non-encrypted files have no default compression.)

|>question -- can we as users choose what order plugins of the same layer
|>are run?  You'd have to be an idiot to want to encrypt before you
|>compress -- an idiot, or someone who's thought of something we haven't.
|
|
| I'd probably vote for myself being an idiot, but I prefer the terms
| inexperienced and ignorant ;)
|
| But people have a tendency of think of stuff that other people haven't
| so nothing should be discarded straight away.

So maybe we want some sort of way of stacking these?  I'm not sure how
to do this gracefully and still use the above syntax -- I've seen it for
less than a weekend and I'm already attached to it :D

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQLtLeHgHNmZLgCUhAQKrHw//Wnw7IBuPdPiIHpDKvMiMqqiroSnxkZ+q
oiY4zFg+0Gxtzt2+gVww0MQFH+4jjs7EgmrtJ+Bl3XbAEJDTzYADUdVVB8KlCQDa
TCyj3+xNkRLY6+D9iHUTaITnQVQYge4WNQ6QURhmmA/azrc9RvOofrCALl3oiqdG
IozXlw+fhSaSocHsrIsVf7bUB5UjQ5mRyW/y+sGYTcwxq/bw2OdVUzsHwQZ1g9Cy
9J+xqrDDmEF5uoGwXZvES7NXXxdE7N+XAhJAStEBz23PoN3JYM591WuLI18espfr
omvMmVMYFumn49e4dVIq7w0gHBseCSrjhsRTOMgnv+3hlafrjDXQswt247aAtqbY
x9J6sgqpI6tJYkbiT8AHXQHZkF0nzpyfjH2g1L+D6xRkfJsxdi6lNVUQkwwD9tNA
WltES/jbII6/Aie6VXgky3uDJNZT87oVv0mfzre4QzAWUq1XvWN1omIztODnYDpz
5Q4kPOdUT9AgkLI+dbi0l58VjSTAPhGDLIeJoZpqCLJeTP+YVZAwks96o9AqsNl2
SKAR2Ol11Xm2MlHeXeUD81Y4S0dL/wlwz2SaNgex8l2vjaMdm/RCwkyq+9FnMvR6
n5/YX2FF7/raM+T//Uq6NqDE7a6gu+AV4/FO13WNcu5DdNO1SVbH4IoTUqe1Iyxv
oKIoaUdEWY0=3D
=3DMuFR
-----END PGP SIGNATURE-----
