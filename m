From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: OT: simple file operations in C
Date: 10 Mar 2003 17:35:24 -0500
Message-ID: <b4j3vc$adf$1@satsuki.furryterror.org>
References: <200303100802.h2A82JWS004942@turing-police.cc.vt.edu> <1047267222.c3ecdd60teodarren@myrealbox.com> <200303100802.h2A82JWS004942@turing-police.cc.vt.edu> <1047296851.1036.2.camel@kakapo.schnulli.de>
Return-path: <reiserfs-list-return-13183-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <1047296851.1036.2.camel@kakapo.schnulli.de>,
Heinz-Josef Claes  <hjclaes@web.de> wrote:
>Am Mon, 2003-03-10 um 09.02 schrieb Valdis.Kletnieks@vt.edu:
>> On Mon, 10 Mar 2003 03:33:42 GMT, darren <teodarren@myrealbox.com>  said:
>> 
>> > I want my program to be able copy, move and delete files, but i cannot seem t
>> o find any available functions or system calls to do this.
>>
>> For move and delete, you want the rename() and unlink() system calls.

You might want to try sendfile(), which is Linux-specific, but basically
transfers the contents of one FD to another FD entirely in kernel-space.
It's designed for sending files over a socket, but I see no reason why
the destination FD couldn't be a file.  On the other hand, I've never
used it myself.

>> For copying, you might want to skip the stdio fopen() and friends, and
>> use open()/read()/write()/close().  You may need chmod() and utime() if you
>> want to be preserving filemode/timestamps.
>> 
>> Google for '+linux +programming +guide'.
>
>That's ok. But if you want to copy big files it's a good idea to have a
>look at mmap(2).

mmap() can be slow, especially for reading files sequentially.  read()
usually comes with support from the OS and filesystem for read-ahead
and large I/O transfers.  These make a huge difference in performance,
and more than compensate for the extra CPU and memory overhead of copying
the data.  mmap() usually uses the same mechanism as swap, and is oriented
toward reading single pages.  mmap() is good for exectuables and shared
memory (e.g. lock tables), not for reading or writing big files
sequentially.

mmap() can be annoying to use, especially if the file might be modified while
you are copying it.  All errors are reported by your process receiving a
SIGBUS.  If the file is bigger than a few hundred megabytes you will still
need a loop to map the file in multiple small pieces.  Not all filesystems
support mmap(), which means you'll usually need to be able to fall back
to read() anyway.  read() and mmap() may also have different atomicity and
consistency characteristics.

Modern CPU's can copy data in memory in multiples of a gigabyte per
second (and five-year-old CPU's can do hundreds of megabytes easily).
If your disks are slower than this, you will probably find that read()
is so much faster than mmap() (I usually get read() about 10 times faster
than mmap()) that you'll not bother with mmap().

If you really need speed, try a few different techniques and do a
benchmark on the filesystem, OS, and hardware you will be using.

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
