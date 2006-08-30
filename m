From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 und LZO compression
Date: Wed, 30 Aug 2006 09:55:47 -0700
Message-ID: <44F5C313.40905@namesys.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru> <20060828173721.GA11332@hello-penguin.com> <44F332D6.6040209@namesys.com> <1156801705.2969.6.camel@nigel.suspend2.net> <20060829045937.GA9181@localhost.hsdv.com> <op.te1sixuycigqcu@apollo13> <20060829143814.GA21868@hello-penguin.com> <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com> <44F4880C.3050507@slaphack.com> <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com> <44F4914A.1010005@slaphack.com> <44F4979E.9020101@namesys.com> <44F49D7F.3010403@slaphack.com> <0954BE4F-E3A4-4A59-B275-10C1D8DB5101@smartgames.ca> <44F4C2C9.3070101@slaphack.com> <op.te3aq1uwcigqcu@apollo13> <44F5C1D7.5060904@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29759-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F5C1D7.5060904@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: PFC <lists@peufeu.com>, ReiserFS List <reiserfs-list@namesys.com>

Edward Shishkin wrote:
>
> (Plain) file is considered as a set of logical clusters (64K by
> default). Minimal unit occupied in memory by (plain) file is one
> page. Compressed logical cluster is stored on disk in so-called
> "disk clusters". Disk cluster is a set of special items (aka "ctails",
> or "compressed bodies"), so that one block can contain (compressed)
> data of many files and everything is packed tightly on disk.
>
>
>
So the compression unit is 64k for purposes of your benchmarks.
