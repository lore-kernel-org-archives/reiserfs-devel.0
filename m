From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Fri, 4 Jul 2003 09:40:06 +0400
Message-ID: <20030704054005.GB6309@namesys.com>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org> <200307031516.44549.vitaly@namesys.com> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <pan.2003.07.03.11.46.40.824752.5077@umail.hungrycats.org> <200307032210.03901.vitaly@namesys.com> <pan.2003.07.03.17.18.22.88001.5077@umail.hungrycats.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <pan.2003.07.03.17.18.22.88001.5077@umail.hungrycats.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Jul 03, 2003 at 05:18:23PM -0400, Zygo Blaxell wrote:
> > If you check you RAM and find no problems
> I've tested the RAM and moved the disks to another machine...no hardware
> problems so far.
> Also, the successive runs of reiserfsck (two more since I posted my
> original message) are producing lower and lower pass0 stats, and getting
> further through pass1, about 3000 blocks at a time.  Each run takes about
> 20 hours before it dies (normally reiserfscks on this size of filesystem
> take 3-4 days).

Wow. Do you have large number of files there?
Want to try our new version that considerably speeds-up this case? ;)

> > could you run
> >     debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
> > and make it available for downloading.
> That command will take a while...based on the current rate, it will finish
> sometime in the morning on Tuesday, or maybe Monday night.

Hm. Is there a possibility to aattache the drive to some faster interface?

Bye,
    Oleg
