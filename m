From: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: BitTorrent+Reiser4: curiouser and curiouser
Date: Fri, 22 Sep 2006 11:26:45 +0200
Message-ID: <4513AC55.1080400@muenning.com>
References: <4513827A.50809@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29969-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4513827A.50809@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ReiserFS List <reiserfs-list@namesys.com>

David Masover wrote:

(snip)
> It shouldn't be touching the disk AT ALL when there's over a gig of FREE
> RAM (as in, neither buffer nor cache nor actually used yet), and the
> file I'm attempting to download is less than 200 megs.  I tried an
> strace, but as I am not at all skilled in the ways of debugging or
> reverse engineering, I got syscall spam -- a 200 meg log file, and when
> I finally found a decent way to analyze it, I found most of Azureus'
> system call wall time is spent in futex().  Huh?
>=20
> Looked up "futex" on Wikipedia, and I still have no clue how this makes
> any sense.  Either futex was somehow thrashing the disk, or Azureus has
> somehow managed to fork completely out of strace's control.  Or maybe
> it's somehow something that the kernel is doing on its own, which is
> somehow forcing azureus to block, but somehow not tripping strace's
> timers while doing so.

Have you used -f or -ff with strace? Without it you would see only the
initial process and not the forked processes. Having the futex call
indicates that there should be child processes, so -f or -ff is a must.

Just my 2 cents.
--=20
Konstantin M=FCnning
