From: David Masover <ninja@slaphack.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Wed, 19 Jan 2005 16:41:02 -0600
Message-ID: <41EEE1FE.9050100@slaphack.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>	 <m38y7gx8kq.fsf@merlin.emma.line.org>	 <20041230235911.4911a20c.hihone@bigpond.net.au>	 <m3sm5nj2ef.fsf@merlin.emma.line.org> <41D42F93.9060107@namesys.com> <2f4958ff050118131714f5411c@mail.gmail.com> <41EE859D.3020305@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41EE859D.3020305@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gryzman@gmail.com>, Edward Shishkin <edward@namesys.com>, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| Grzegorz Ja=C5=9Bkiewicz wrote:
|
|> On Thu, 30 Dec 2004 08:40:51 -0800, Hans Reiser <reiser@namesys.com>
|> wrote:
|>
|>
|>> Fixing hash collisions in V3 to do them the way V4 does them would
|>> create more bugs and user disruption than the current bug we have all
|>> lived with for 5 years until now.  If someone thinks it is a small
|>> change to fix it, send me a patch.  Better by far to fix bugs in V4,
|>> which is pretty stable these days.
|>>
|>
|>
|> As I understeand, tea hash is based on tea (tiny encryption aglo),
|> which was the cause of xbox-linux sucess, and few others.
|> Pleas consider updating it to use xxtea algo. I know, it won't be
|> backward compatbile, but well.
|> Where is about all the others, I don't use them, and for me tea is the
|> only resonable hash to use on systems where I have very much great
|> number of files per directory (to name it, Maildirs).
|> Never had such problem myself, every hash function has a weaknes.
|> Nothing new. But providing another, much stronger hash, or correct tea
|> hash to use xxtea, would be something good indeed.
|>
|>
|>
| Edward, please look into whether we should use xxtea in Reiser4, and
| make a recommendation to me.  We aren't changing V3, it is stable and I
| want to leave it that way.

You don't change, it gets forked.  You have a strange definition of
"stable".
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQe7h/HgHNmZLgCUhAQL5OA//TencDKPIk4QR8u3GIJC0gUp2vF+eS3H7
IQTZTufZqXTHhEP3n6ySNied7jeGi7BHL2Oxk2wY+nXWCY5mLGtvBHyOvWaP8oBF
sL7lNqhifljwJkA3yvqSFl7d5BUF3bTZTQ83BYnAPYdZccL4WRuFtxS7jH4xdK0g
lJV7w0x2nNkboy/GWRlqXE1GauBzoLBVJ9twsplxX5RSbHuPECGKZBs/fx2yNN5Y
zkqWxRpRWKIUgkiH/ziE/amAe1BHbV3ZkPx2VE54lbrz1TQox2qEHzOFW9ABQTUh
Nu+W3omw/1OGmZ2sF9X3kBIUhEz3/VK/wk1fG1dKAuhPMfVmjVTVCAyYiRPqZHsC
ZWwKrHxqMbTBvOYHHN8KAyChSLU1Qi2Lm5BnncfdUZ2hM5nQqOBoajX1ymSNiq5f
ykww8P02tJobX9u0UncMfi7wGsA/jW3k7GgWPjHM4A+wxACSiVIWRhR4gcqMFFsc
9nobQSiIiENpeAP6wmJrupPRMPcLUQUGZe+UBjyCHTo9ygAWngBqByTR+74tRrz+
OBcL1WforIOHS6FEHLGyEJVmsjz/0ibOuM6PAUHuNcrDlfa2dMc09Y1YPLXjvCjl
TPRh0OKel3vqq+tFFuh8Xvl/rD4BBM+eUxDjgpqH2NT9DbisYbDpkx+5WwSQMUqk
Z9kOPizEF7o=3D
=3DMxVy
-----END PGP SIGNATURE-----
