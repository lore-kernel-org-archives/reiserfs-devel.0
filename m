From: David Masover <ninja@slaphack.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Sun, 06 Feb 2005 23:33:56 -0600
Message-ID: <4206FDC4.1060401@slaphack.com>
References: <20050206034102.3956432d@polo.concept-micro.com>	<42066D9C.8030908@slaphack.com> <20050206225539.0c2d0c10@polo.concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050206225539.0c2d0c10@polo.concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pierre Etchemaite <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pierre Etchemaite wrote:
| Le dim 06 f=E9v 2005 13:18:52 CET, David Masover <ninja@slaphack.com> a
=E9crit
| :
|
|
|>Go to XFS or Reiser4.  Unless someone is about to correct me, reiserfs3
|>still has problems with hash collisions.  The rest of it *should* be
|>stable.... ;-)
|
|
| I read this recently, but never had problems with hash collisions since I
| use reiserfs 3 (don't remember the exact time, but probably around
'98), as
| far as I can tell.

There was a debian package which caused a hash collision.  Every time.
Not even something obscure; I think it was some piece of X.

|>If it's mission-critical, you probably want XFS -- reiser4 still has at
|>least one performance issue to iron out, and it doesn't have the years
|>of public testing that XFS does.
|
|
| I use reiser4 on my home box, it's fine, but I won't use it for that
| server... yet, at least.
|
| Because trustiness isn't the only parameter. The problem with either
XFS or
| Reiser4, is that they're probably more CPU intensive than reiserfs 3,
and on
| that server that's starting to age, it could be a problem.

Think I remember some other filesystem being really lightweight CPU.
UFS or something.  But XFS shouldn't be too bad.  Where does your
"probably" come from?

| So, no solution with reiserfs 3 ?

Don't know.  I don't work here :P
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQgb9w3gHNmZLgCUhAQL9ZA/8DzKOqj+4xcNmp6xaqdLZOounaaO1dImK
9YSyE7VBtQkE23CpRS/SdFe17ZjVmlgbho93r7BGnuMr4BrctInd+B7V4GwBXPvx
MUiC08lJztwL2JMY2yeN5dzkYbSUjnt4jhDmy8/XHH5MUTFzwH5vtZzXzhaQYbZ5
gWurzJdMj8l0pHUlCZUTLUO7i6yiuD4lh20QZaX2pe3tbQ1jfPKJTGw+o7OFm8GY
vcQCe8JUCTkfpt+bROqcnPWT15Al1cxzRzEocuBvToDfiJlBjuWK9m+QYnuBMaCC
gmy5z5MHE3Jak3bM+kADvtdmnuP2OAZ+SFWTDXQOVuD94dGa7Qpsa2HjpQj8cMsk
w8FNO1nqEYtqWghA0k/97U2cfhkXUlSoxZ+Ud5xyIqy4R1463NziQwIHXryF32cN
alg2ja6yO+4d4UuhgaMxw6uqWIk7ZBDsnrq93qEBi0J+MWXzLlQRKQZyg0dVEdyZ
nRoDMYKP2JkKcx8/2RmJjNlKa9uiyoy0/jb8F+wquAObBzUZOpMxuPVogsvMlo69
95mu2OgCLfr+NY7GWL/iIqbKj9R8nvX2NiSdN+nlrPu4ODCrb1ce2PbtGEuIEbhg
KlcgyZiFDY90Uq/YOOyx4yacdYOykTjQKzDfeAwbUkgEdd8kllYSzkC2rmA1m+wu
xkHMdj3UHu4=3D
=3D8vLa
-----END PGP SIGNATURE-----
