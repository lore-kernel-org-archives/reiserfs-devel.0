From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: reiser4 and bonnie problems
Date: Tue, 20 Apr 2004 11:51:51 +0400
Message-ID: <16516.54935.159587.423283@laputa.namesys.com>
References: <20040416203937.GY14134@nysv.org>
	<26F302F3-9042-11D8-8B4A-000A95CD704C@wagland.net>
	<2EB65FD6-924A-11D8-8B4A-000A95CD704C@wagland.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18073-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2EB65FD6-924A-11D8-8B4A-000A95CD704C@wagland.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Wagland <paul@wagland.net>
Cc: reiserfs-list@namesys.com, Markus TXrnqvist <mjt@nysv.org>

Paul Wagland writes:
 > 
 > On Apr 17, 2004, at 9:38, Paul Wagland wrote:
 > 
 > >
 > > On Apr 16, 2004, at 22:39, Markus TXrnqvist wrote:
 > >
 > >> Paul Wagland wrote:
 > >>
 > >>> Bonnie: drastic I/O error (re write(2)): No such file or directory
 > >>
 > >> I applied http://mjt.nysv.org/reiser/bonnie.patch which may or may
 > >> not help. Nikita gave it on IRC, but without either of us having
 > >> time at the moment to do much about it (so it'll wait until Monday,
 > >> at least).
 > 
 > OK. I have updated the above patch so that instead of only calling 
 > report_err() on ENOENT, it calls report_err whenever an error happens. 
 > I then re-ran my test:
 > 
 > tidbit:~# df /mnt/sdr
 > Filesystem           1K-blocks      Used Available Use% Mounted on
 > /dev/sdr1              3984228       296   3983932   1% /mnt/sdr
 > tidbit:~# bonnie++ -r 1736 -d /mnt/sdr -u 0:0
 > Using uid:0, gid:0.
 > Writing with putc()...done
 > Writing intelligently...Can't write block.
 > Bonnie: drastic I/O error (write(2)): No space left on device

Err.. this is completely different from what we had previously: "No
space left on device" is understandable where not reasonable. What is
completely mysterious is "No such file or directory" error that you
reported before.

 > 
 > 
 > Note, that bonnie tries to create 3.5 GB worth of files on a 4GB 
 > filesystem... this should not be causing a problem. Also, the "Writing 
 > intelligently" test tries to write out the same amount of information 
 > as the "Writing with putc()" test. After each test all the files from 
 > that test are deleted, so this really should not be causing a problem. 
 > Further, while running the test, I was also running a df loop, as can 
 > be seen below:
 > 
 > tidbit:~# while true; do sleep 1; echo `df /mnt/sdr | tail -1` `du -s 
 > /mnt/sdr`; done
 > /dev/sdr1 3984228 3496804 487424 88% /mnt/sdr 3499521 /mnt/sdr
 > /dev/sdr1 3984228 3523684 460544 89% /mnt/sdr 3523393 /mnt/sdr
 > /dev/sdr1 3984228 3547620 436608 90% /mnt/sdr 3547329 /mnt/sdr
 > /dev/sdr1 3984228 410136 3574092 11% /mnt/sdr 1 /mnt/sdr
 >    < more or less here is where the intelligent write starts >
 > /dev/sdr1 3984228 84768 3899460 3% /mnt/sdr 84417 /mnt/sdr
 > /dev/sdr1 3984228 164624 3819604 5% /mnt/sdr 164273 /mnt/sdr
 > /dev/sdr1 3984228 246664 3737564 7% /mnt/sdr 246309 /mnt/sdr
 > /dev/sdr1 3984228 321952 3662276 9% /mnt/sdr 321601 /mnt/sdr
 > /dev/sdr1 3984228 404832 3579396 11% /mnt/sdr 404481 /mnt/sdr
 > /dev/sdr1 3984228 477264 3506964 12% /mnt/sdr 476913 /mnt/sdr
 > /dev/sdr1 3984228 527404 3456824 14% /mnt/sdr 1 /mnt/sdr
 >    < there is quite a long pause here, around about 5 seconds >
 >    < and in the meantime, bonnie has failed with a "no space left on 
 > device" >
 > /dev/sdr1 3984228 296 3983932 1% /mnt/sdr 1 /mnt/sdr
 > 
 > 
 > With the modifications that I made above, the following lines are spat 
 > out into the /var/log/kern.log:
 > 
 > Apr 19 23:20:44 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:20:57 tidbit last message repeated 3 times
 > Apr 19 23:21:02 tidbit kernel: code: -503 at fs/reiser4/seal.c:170
 > Apr 19 23:21:02 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:21:17 tidbit last message repeated 3 times
 > Apr 19 23:21:22 tidbit kernel: code: -503 at fs/reiser4/seal.c:170
 > Apr 19 23:21:22 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:21:37 tidbit last message repeated 4 times
 > Apr 19 23:21:42 tidbit kernel: code: -503 at fs/reiser4/seal.c:181
 > Apr 19 23:21:42 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:21:57 tidbit last message repeated 3 times
 > Apr 19 23:22:02 tidbit kernel: code: -503 at 
 > fs/reiser4/plugin/file/file.c:791
 > Apr 19 23:22:02 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:22:32 tidbit last message repeated 7 times
 > Apr 19 23:22:51 tidbit last message repeated 4 times
 > Apr 19 23:22:56 tidbit kernel: code: -503 at 
 > fs/reiser4/plugin/file/file.c:791
 > Apr 19 23:22:56 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:23:12 tidbit last message repeated 4 times
 > Apr 19 23:23:16 tidbit kernel: code: -503 at 
 > fs/reiser4/plugin/file/file.c:791
 > Apr 19 23:23:16 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:23:30 tidbit last message repeated 5 times
 > Apr 19 23:23:30 tidbit kernel: code: -503 at 
 > fs/reiser4/plugin/file/file.c:791
 > Apr 19 23:23:30 tidbit kernel: code: -503 at 
 > fs/reiser4/plugin/file/file.c:791
 > Apr 19 23:23:30 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:23:32 tidbit kernel: code: -503 at 
 > fs/reiser4/plugin/file/file.c:791
 > Apr 19 23:23:32 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:23:34 tidbit kernel: code: -503 at fs/reiser4/seal.c:170
 > Apr 19 23:23:34 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:23:36 tidbit kernel: code: -503 at fs/reiser4/seal.c:170
 > Apr 19 23:23:36 tidbit kernel: code: -2 at fs/reiser4/search.c:1204
 > Apr 19 23:23:37 tidbit kernel: code: -28 at fs/reiser4/block_alloc.c:319

That looks ok, -28 == -ENOSPC.

 > 
 > 
 > I really hope that this helps someone out there who knows more about 
 > the code internals than I. As always, if you would like me to run some 
 > more tests, please let me know!
 > 
 > Cheers,
 > Paul

Nikita.
