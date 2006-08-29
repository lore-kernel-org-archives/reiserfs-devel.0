From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 10:42:12 -0700
Message-ID: <44F47C74.9000406@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <44F322A6.9020200@namesys.com> <20060828173721.GA11332@hello-penguin.com> <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net> <20060829045937.GA9181@localhost.hsdv.com> <op.te1sixuycigqcu@apollo13>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29737-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.te1sixuycigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: PFC <lists@peufeu.com>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

PFC wrote:
>
>     I made a little benchmark on my own PC (Athlon64 3200+ in 64 bit
> gentoo)
>
> http://peufeu.free.fr/compression.html
>
>     So, gzip could be used on PCs having very fast processors and very
> slow harddrives, like Core Duo laptops.
>     However, lzo compresses nearly as much and is still a lot faster.
> I don't see a reason for gzip in a FS application.
>
>     Anyone has a bench for lzf ?
>
>
Yes, Edward did equivalent tests, and thus we selected LZO.
