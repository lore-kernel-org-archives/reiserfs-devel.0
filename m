From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: OT: simple file operations in C
Date: 10 Mar 2003 12:47:35 +0100
Message-ID: <1047296851.1036.2.camel@kakapo.schnulli.de>
References: <1047267222.c3ecdd60teodarren@myrealbox.com>
	 <200303100802.h2A82JWS004942@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13175-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303100802.h2A82JWS004942@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: darren <teodarren@myrealbox.com>

Am Mon, 2003-03-10 um 09.02 schrieb Valdis.Kletnieks@vt.edu:
> On Mon, 10 Mar 2003 03:33:42 GMT, darren <teodarren@myrealbox.com>  said:
> 
> > I want my program to be able copy, move and delete files, but i cannot seem t
> o find any available functions or system calls to do this.
> 
> For move and delete, you want the rename() and unlink() system calls.
> 
> For copying, you might want to skip the stdio fopen() and friends, and
> use open()/read()/write()/close().  You may need chmod() and utime() if you
> want to be preserving filemode/timestamps.
> 
> Google for '+linux +programming +guide'.

That's ok. But if you want to copy big files it's a good idea to have a
look at mmap(2).


