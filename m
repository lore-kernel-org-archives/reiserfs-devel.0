From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 and megaraid problems with debian 2.6.5
Date: Fri, 16 Apr 2004 23:39:37 +0300
Message-ID: <20040416203937.GY14134@nysv.org>
References: <1081987184.11193.87.camel@morsel.kungfoocoder.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1081987184.11193.87.camel@morsel.kungfoocoder.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Paul Wagland wrote:

>Bonnie: drastic I/O error (re write(2)): No such file or directory

I applied http://mjt.nysv.org/reiser/bonnie.patch which may or may
not help. Nikita gave it on IRC, but without either of us having
time at the moment to do much about it (so it'll wait until Monday,
at least).

Guess the point of this email is that I won't forget the results I
got by then :)

Nothing was logged, although I had the following on in the kernel:
mjt@shrike:~$ zgrep REISER4 /proc/config.gz 
CONFIG_REISER4_FS=y
# CONFIG_REISER4_FS_SYSCALL is not set
CONFIG_REISER4_LARGE_KEY=y
CONFIG_REISER4_CHECK=y
CONFIG_REISER4_DEBUG=y
CONFIG_REISER4_FS_SYSCALL_DEBUG=y
# CONFIG_REISER4_DEBUG_MODIFY is not set
# CONFIG_REISER4_DEBUG_MEMCPY is not set
# CONFIG_REISER4_DEBUG_NODE is not set
# CONFIG_REISER4_ZERO_NEW_NODE is not set
# CONFIG_REISER4_TRACE is not set
# CONFIG_REISER4_EVENT_LOG is not set
# CONFIG_REISER4_STATS is not set
# CONFIG_REISER4_PROF is not set
# CONFIG_REISER4_LOCKPROF is not set
CONFIG_REISER4_DEBUG_OUTPUT=y
# CONFIG_REISER4_NOOPT is not set
CONFIG_REISER4_USE_EFLUSH=y
# CONFIG_REISER4_COPY_ON_CAPTURE is not set
# CONFIG_REISER4_BADBLOCKS is not set

I ran 
while [ 0 ]; do set $( df -m | tail -1); echo $4; sleep 1; done
on one terminal and
time /usr/sbin/bonnie++ -d bonnie/ -f -s $[ $( set $( df -m | tail -1); echo
$4 ) - 128 ]
on another.

The point is that df -m | tail -1 returns my home directory and 128 should
be how much space bonnie++ should leave for me while testing.

This is the output:
mjt@shrike:~/tmp$ time /usr/sbin/bonnie++ -d bonnie/ -f -s $[ $( set $( df -m | tail -1); echo $4 ) - 128 ]
Writing intelligently...
Message from syslogd@shrike at Fri Apr 16 19:33:14 2004 ...
shrike kernel: Disabling IRQ #10
done
Rewriting...Can't write block.
Bonnie: drastic I/O error (re write(2)): No such file or directory

real    39m19.082s
user    0m2.990s
sys     28m46.480s

And this is what the while [ 0 ] loop gave me:
82
63
43
126
123
110
90
127
53185
53185

This is naturally partial, there are many entries for almost fourty minutes,
which I did not log.

As you see, the free space drops well below 128, before the error when the
space is freed again. Is this because bonnie++ does not take -s too literally 
or what?

Also, the patch seemed to have no effect and I don't think I dare have it
in for nothing, not without talking to Nik or someone about it.

So, if this is a question of bonnie++ being imprecise, it's ok, but
Paul's problem is on a much larger scale. Hopefully we will talk about
this during the weekend on IRC, but this message should suffice as a
partial status report.

-- 
mjt

