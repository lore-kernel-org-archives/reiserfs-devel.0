From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 for windows
Date: Tue, 01 Feb 2005 19:18:55 -0600
Message-ID: <42002A7F.3020305@slaphack.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41ED3B39.2000702@namesys.com> <20050201085234.GV26192@nysv.org> <200502011059.37435.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502011059.37435.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Christian Iversen <chrivers@iversen-net.dk>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Christian Iversen wrote:
| On Tuesday 01 February 2005 09:52, Markus T=F6rnqvist wrote:
|
|>On Tue, Jan 18, 2005 at 08:37:13AM -0800, Hans Reiser wrote:
|>
|>>>Could reiser4 support case-crushing, so it would be more
|>>>"windows-native"?
|>>
|>>It could, as a plugin.
|>
|>Reiser4 has a sys interface already, why not add echo 1 > case_crush or
|>somesuch? Shouldn't take a long time to code, but it shouldn't be a
|>priority and no one would really want it, I guess...
|
|
| I support your idea, but keep in mind that, to make matters worse,
windows
| uses case-insentivity, not case-crushing. This means that the original
case
| has to be saved, but the crushed case has to be searched.
|
| I don't know if that's easy with a hash function, but it seems mightly
slow to
| me.

Who said anything about messing with the hash?  Why not just add
original case as metadata and feed pre-crushed case to the existing
hash?  Don't think overhead is huge if you're already creating a file.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQgAqfngHNmZLgCUhAQJXSA/8C+sgMtMZXjZBEjB0yYG/9Ccrp86vtchG
64pbwiS81p/Jy0iBGNYkYxzLav25Y7geXSaUNTjjHDyVbom4xkHdjAO6ayDzQDTw
kfiVkUVBw5Vrd99svRTHagXjm/KgijWsQD+8SUB2xy0D5qQsC49vse0u2vXHxmhU
D/XsyYp4n0f/BKcMeOtg2n+jq22m41SPbluU7DKVN3aE3bvseqCiKupWgsyLrgUy
Iyo0IB2b5cY9N2s8MhbFYgoB1HytLyw6PIOZb4gzv60Rhh4CAanScgvkACrRSRRa
uDMWgJwmnoWmcmuBlKGz8dqTpO3fwNrBdKJbhL8BWyPvgdEdlqQd+L2x2ST/YGRH
Eazd7QHBmU300jAbNMJZlViT1S2VCocnLX6K6fN/PRs1UvypNTDdEf4hoIKOGNoG
VL3c65qI02oWoRzusU11M0pfwkTrUW1aAqYUlLAuMNL4xl2+orV8OuWERdIPxm+V
widPGgfoaSBSy6orF6ywbtbwd/4PzOUF3CKYjG4mJpX9bGUtCpcBxxFGxTW3zakz
SHlaotf4G4szwxpYUSjg+iQ2yo4q/XaPVdXgRR2CaFHb0u5v2LksPltgRE/xfpYg
JCK2KBcKdkL5aF6Gkzboir+Pe6KbAjlOrgTsu9c3UvQJU2A77eEvqPDTM7rpx7XS
FvTfsqvOvG4=3D
=3D4YQD
-----END PGP SIGNATURE-----
