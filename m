From: rwhron@earthlink.net
Subject: Re: oops from 2.5.42-mm3 running lilo on reiserfs
Date: Wed, 16 Oct 2002 00:30:42 -0400
Message-ID: <20021016043041.GA10674@rushmore>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11709-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@digeo.com
Cc: reiserfs-list@namesys.com

>> While running lilo I got this oops:
>>
>>  kernel BUG at mm/highmem.c:177!
>>  invalid operand: 0000

> Just delete it I think:

Yep, that fixes it.  By the way, system responsiveness
with all this stuff running is impressive:

Linux Test Project's runalltests.sh (lots of I/O).
configure/make/make test Python-2.2.2 (all tests okay)
setiathome  (cpu bound)
mp3blaster
lilo in a loop every 30 seconds.

mp3blaster was only quiet about 5 seconds during
a point when runalltests.sh was executing 100
CPU bound threads.  (float_bessel is the test)
There was no skipping during the test that writes
to all free memory + 600 megs swap. :)

2 python audio tests block on /dev/audio, but
that's expected.

You once had a 2.4 patch so lilo wouldn't wait too
long when there is a lot of I/O going on.  A couple
of the LTP tests would make lilo pause ~ 60 seconds:
growfiles -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
growfiles -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_

Those run for 120 seconds each in sync mode.  

I can enter and exit X with no problem.
2.5.42-mm3 is comfortable on my main box.
Thanks for making it so good.

-- 
Randy Hron
http://home.earthlink.net/~rwhron/kernel/bigbox.html

