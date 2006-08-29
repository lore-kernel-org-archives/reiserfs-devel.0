From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 12:38:06 -0700
Message-ID: <44F4979E.9020101@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>	 <20060828173721.GA11332@hello-penguin.com>	 <44F332D6.6040209@namesys.com>	 <1156801705.2969.6.camel@nigel.suspend2.net>	 <20060829045937.GA9181@localhost.hsdv.com>	 <op.te1sixuycigqcu@apollo13>	 <20060829143814.GA21868@hello-penguin.com>	 <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com>	 <44F4880C.3050507@slaphack.com> <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com> <44F4914A.1010005@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29744-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F4914A.1010005@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: Gregory Maxwell <gmaxwell@gmail.com>, PFC <lists@peufeu.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

David Masover wrote:
>   John Carmack is pretty much the only superstar programmer in video
> games, and after his first fairly massive attempt to make Quake 3 have
> two threads (since he'd just gotten a dual-core machine to play with)
> actually resulted in the game running some 30-40% slower than it did
> with a single thread.
Do the two processors have separate caches, and thus being overly fined
grained makes you memory transfer bound or?

Two processors tends to create a snappier user experience, in that big
CPU processes get throttled nicely.

Hans
