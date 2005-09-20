From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: Compression Plugin
Date: Tue, 20 Sep 2005 17:53:01 -0400
Message-ID: <e692861c05092014534d9bf66c@mail.gmail.com>
References: <433017C1.4050408@gmail.com>
Reply-To: gmaxwell@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26167-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433017C1.4050408@gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: reiserfs-list@namesys.com

On 9/20/05, Clay Barnes <clay.barnes@gmail.com> wrote:
> Forgive me if this has been answered recently, but I haven't gotten my
> last two dozen e-mails for today yet.
>=20
> Regarding the compression plugin, what sort of compression can one
> expect from it?=20
[snip]

Just a general, no reiser4 specifc answer since because the
compression isn't done yet I don't know the details on reiser4's
performance....

It is generally the case the disk based compression performs somewhat
worse than normal file based compressors. This is because every block
of data must be compressed alone in order to preserve the random
access semantics of the file system.

This also means that there is less to be gained by using alternative
compression systems (such as bzip2 or better LZMA) because most only
pick up their impressive performance as a result of having a much
larger context and at a greatly increased cost in memory usage.

For disk based compression Lz77 is pretty good and is so widely used
that people feel comfortable implimenting it in kernel space. Another
interesting player is LZO because decompression requires very little
memory and is VERY VERY fast (I think someting like 8x faster than
gzip in my testing). This means that decompression  is effectively
free. However compression is perhaps 10% worse than LZ77 ... on most
hardware the disk is so slow that the decrease in compression
outweighs the improvement in decompression performance. But on systems
with a fast disk array, LZO may be a welcome tradeoff.
