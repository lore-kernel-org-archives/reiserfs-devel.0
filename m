From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: Reiser4 und LZO compression
Date: Tue, 29 Aug 2006 14:36:09 -0400
Message-ID: <e692861c0608291136j6ae2293cha230575acf6c031d@mail.gmail.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>
	 <20060828173721.GA11332@hello-penguin.com>
	 <44F332D6.6040209@namesys.com>
	 <1156801705.2969.6.camel@nigel.suspend2.net>
	 <20060829045937.GA9181@localhost.hsdv.com>
	 <op.te1sixuycigqcu@apollo13>
	 <20060829143814.GA21868@hello-penguin.com>
	 <op.te1yjbp7cigqcu@apollo13> <44F47FEB.9060005@namesys.com>
	 <44F4880C.3050507@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29741-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44F4880C.3050507@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, PFC <lists@peufeu.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

On 8/29/06, David Masover <ninja@slaphack.com> wrote:
[snip]
> Conversely, compression does NOT make sense if:
>    - You spend a lot of time with the CPU busy and the disk idle.
>    - You have more than enough disk space.
>    - Disk space is cheaper than buying enough CPU to handle compression.
>    - You've tried compression, and the CPU requirements slowed you more
> than you saved in disk access.
[snip]

It's also not always this simple ... if you have a single threaded
workload that doesn't overlap CPU and disk well, (de)compression may
be free even if you're still CPU bound a lot as the compression is
using cpu cycles which would have been otherwise idle..
