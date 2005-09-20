From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Compression Plugin
Date: Tue, 20 Sep 2005 18:36:14 -0400
Message-ID: <e692861c05092015364a887a44@mail.gmail.com>
References: <433017C1.4050408@gmail.com> <43307E49.8060404@slaphack.com>
Reply-To: gmaxwell@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26170-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43307E49.8060404@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Clay Barnes <clay.barnes@gmail.com>, reiserfs-list@namesys.com

On 9/20/05, David Masover <ninja@slaphack.com> wrote:
> Probably lzo, which is already used for other things like network
> connections (ssh, openvpn, and so on).  The nice thing about lzo is that
> it's fast, faster than gzip or bzip2, and gets decent compression -- not
> great, but decent.  I don't usually get gzip or bzip2 to compress at
> disk speed, but then, I usually crank the compression way up, so YMMV.
> The point of using a fast algorithm is that you not only save space, but
> when you apply it to things like text files, it can actually make things
> go faster.
>=20
> But I imagine it will be settable per-file.  Files can be both encrypted
> and compressed, and I think (I hope) it could be with a choice of
> crypto/compression algorithms.

I didn't know SSH supported LZO.  Rsync does though...

Gzip compression is pretty darn quick at lower levels, though
depending on the lz77 implimentaiton it can be fairly slow at higher
compression levels.

An interesting idea:  select the algo and a range of compression
levels per file, but select the actual compression level at flush time
based on some estimate of how loaded the system is.. :)
Probably not worth it even though the amount of compression and the
speed differ greatly from -1 to -9... I hope no one wastes their time
on it until the more important things are done.. but perhaps a nice
touch.
