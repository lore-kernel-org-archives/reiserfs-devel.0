From: Heiko Przybyl <lil_tux@web.de>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:149!
Date: Tue, 20 Dec 2005 14:22:36 +0100
Message-ID: <20051220142236.50e7844f@tormented-soul>
References: <20051219203323.64d48641@tormented-soul>
	<43A7B080.3070603@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27457-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43A7B080.3070603@namesys.com>
Sender: lil_tux@web.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello.

what i realized yesterday, after several recompilings:

i've tested it with gcc3.3 and 2.6.14 - same problem with reiser-patch +
reiser-fix-fsync-patch. without the reiser-fix-fsync-patch, it seems to work
again, with both, gcc3.3 and gcc4.1. but this is still very strange to me,
as it worked some time ago with the same patches :/

the architecture is i368. i've forgotten to mention that in my first post
- sorry for that.


> 
> Please try
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.15-rc5-mm3/reiser4-for-2.6.15-rc5-mm3-1.patch.gz

fine, i will give it a try. what are the main changes in that patch?


> > are there any mount/compile options, which could produce better performance
> > with larger files (i.e. 2gb and more)?
> > 
> 
> What does your load do with large files?

normal cpu-load is not very high, the only thing i can see, is the wait-io on a
very high level (sometimes >90% for several seconds). the throughput is
therefore quite low - less than 1mbyte/sec.

the 2gb file i was talking about is a virtual machine's disk.

the host is running ide-disks with 40-50mbyte/s transfer rates. creating such a
large image on reiser4 is really fast, but working with them is not.



thx anyway.


	Heiko
