From: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Subject: Re: reiser4 for windows
Date: Wed, 8 Dec 2004 08:50:20 +0100
Message-ID: <20041208075020.GA14238@melkor.dnp.fmph.uniba.sk>
References: <20041207060730.GA1344@zg.cz> <1102408162.12503.25.camel@localhost> <965622991.20041208024010@tnonline.net> <41B68530.7090807@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22716-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41B68530.7090807@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Tue, Dec 07, 2004 at 10:38:08PM -0600, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Spam wrote:
> |>On Mon, 2004-12-06 at 22:07 -0800, Jiri Klouda wrote:
> |>
> |>>>Also, is it a given that reiser4 for windows would work without help
> |>>>from MS?  I've just never seen a third-party filesystem driver for
> |>>>windows.  You'd think that at least one other filesystem, one of the
> |>>>Linux/BSD/etc ones, would have done this, if it was feasable.
> |
> |
> |   Aren't there? Isn't there various compression systems, not to
> |   mention PGP disk? Maybe it is not the same thing...
>=20
> Not exactly.  Is there an XFS for Windows?  What about JFS?  What about
> Minix?  Sure, some filesystems have apps that allow access, but I don't
> think I've seen one that provides an actual filesystem driver (not
> plugin).  I do occasionally hear of them, though.

There is an ext2 filesystem for Win98. I used it extensively some time
ago. It had reliable read-only support and an experimental read write
one (which I did not try).
However, I do not remember if it supported symlinks (it for sure did not
support unix permissions - it could not, if you think about it)


--=20
 -----------------------------------------------------------
| Radovan Garab=EDk http://melkor.dnp.fmph.uniba.sk/~garabik/ |
| __..--^^^--..__    garabik @ melkor.dnp.fmph.uniba.sk     |
 -----------------------------------------------------------
Antivirus alert: file .signature infected by signature virus.
Hi! I'm a signature virus! Copy me into your signature file to help me spre=
ad!
