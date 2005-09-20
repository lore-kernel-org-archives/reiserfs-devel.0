From: David Masover <ninja@slaphack.com>
Subject: Re: Compression Plugin
Date: Tue, 20 Sep 2005 16:25:29 -0500
Message-ID: <43307E49.8060404@slaphack.com>
References: <433017C1.4050408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433017C1.4050408@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clay Barnes <clay.barnes@gmail.com>
Cc: reiserfs-list@namesys.com

Clay Barnes wrote:

> Also:  Is the algorithm set in stone?  If so what is it?  If not, what
> is it now/expected to be?

Probably lzo, which is already used for other things like network
connections (ssh, openvpn, and so on).  The nice thing about lzo is that
it's fast, faster than gzip or bzip2, and gets decent compression -- not
great, but decent.  I don't usually get gzip or bzip2 to compress at
disk speed, but then, I usually crank the compression way up, so YMMV.
The point of using a fast algorithm is that you not only save space, but
when you apply it to things like text files, it can actually make things
go faster.

But I imagine it will be settable per-file.  Files can be both encrypted
and compressed, and I think (I hope) it could be with a choice of
crypto/compression algorithms.

