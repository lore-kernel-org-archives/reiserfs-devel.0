From: Chris Mason <mason@suse.com>
Subject: Re: Writeback cache, SCSI, and ReiserFS
Date: 16 Oct 2002 08:52:02 -0400
Message-ID: <1034772722.18459.31.camel@tiny>
References: <20021016053312.CCE9A1AEC187@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11716-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021016053312.CCE9A1AEC187@server5.fastmail.fm>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JP Howard <jh_lists@fastmail.fm>
Cc: ReiserFS List <reiserfs-list@namesys.com>, Rob Mueller <robm@fastmail.fm>

On Wed, 2002-10-16 at 01:33, JP Howard wrote:
> Here's a little program to test fsync() performance--if you run it with
> the parameter '1' it does 10000 write/fsync combinations, with the
> parameter '0' it does 10000 writes, followed by a single fsync:
> ----
> int main(int argc, char **argv) {
>   int i, fd, mode;
>   mode = atoi(argv[1]);
>   fd = open("/some/path", O_CREAT | O_RDWR);
>   for (i=0; i<10000; i++) {
>     if (i%10 == 0)
>       lseek(fd, 0, SEEK_SET);
>     write(fd, buf, 8192);
>     if (mode == 1) {
>       fsync(fd);
>     }
>   }
>   fsync(fd);
> }
> ----
> 
> Now, according to our RAID controller (MegaRAID Series 475), we have
> writeback cache turned on. Therefore, I would have thought that the above
> program would run at the same speed regardless of using parameter '1' vs
> '0', since fsync should return immediately when using a writeback cache.

This is one of the things the data logging patches were optimized for. 
If you fsync after every write, the average transaction size is going to
be about 4 or 5 blocks.  If you fsync at the every end, the average
transaction size will be a few hundred blocks at least.

The data logging patches make small transactions much faster (even
without data=journal), and with data=journal the difference is huge.

Not 30x faster though.  You see that difference because of the lseek
back to zero, which means you are overwriting the same blocks over and
over again.  With fsync on, you wait for each write to hit the
controller's cache.  With fsync at the end, you wait for each write to
hit the page cache, and then wait for 8192 * 10 bytes to hit the
controller's cache at the end.

Even if the controller is writeback caching, fsync=1 sends many more
commands down the pipe, and each one has to be processed.

So, if you really want to test your writeback cache on the controller,
run your test with fsync = 1 with the writeback on, the run with fsync =
1 with the writeback off.

If you get the same numbers both ways, you don't have writeback on.

-chris


