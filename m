From: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Thu, 03 Jul 2003 17:18:23 -0400
Message-ID: <pan.2003.07.03.17.18.22.88001.5077@umail.hungrycats.org>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307031516.44549.vitaly@namesys.com> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <200307032210.03901.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-14824-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 03 Jul 2003 14:10:03 -0400, Vitaly Fertman wrote:
> If you check you RAM and find no problems

I've tested the RAM and moved the disks to another machine...no hardware
problems so far.

Also, the successive runs of reiserfsck (two more since I posted my
original message) are producing lower and lower pass0 stats, and getting
further through pass1, about 3000 blocks at a time.  Each run takes about
20 hours before it dies (normally reiserfscks on this size of filesystem
take 3-4 days).

A lot of the pass0 messages are the same on each run, which suggests that
some writes are not being done, or being done in the wrong place.  Odd.

> could you run
>     debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
> and make it available for downloading.

That command will take a while...based on the current rate, it will finish
sometime in the morning on Tuesday, or maybe Monday night.
