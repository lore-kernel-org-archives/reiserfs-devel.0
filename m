From: Antonino Sergi <voyaser@tiscalinet.it>
Subject: Heavy performance loss after crash
Date: 01 Oct 2003 08:44:31 +0200
Message-ID: <1064990671.2161.29.camel@darwin.roma1.infn.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15755-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm new to this list and I'm not sure it is the right one.

I have a 120GB disk with only 1 reiserfs(70GB used) from 2.4.18-14
(RH8).

During heavy I/O (copy of 1GB from this partition to the same one) I
noticed that updatedb started(by anacron) and, trying to get out of an
application (in development) I caused a kernel crash (keybord leds
blinking).

After restarting the PC I found some ext3 corruption on other partitions
and:

1)it takes about 2 minutes to mount the reiserfs partition.
2)reiserfsck --check takes long time (10 minutes) and, looking at
indexes during tree scan, several times it stops for several seconds,
but it does not detect any problem.
3)during any file seek operation for some file it get stuck for several
minutes. For example: I'm trying to copy the copyable to another disk
and there are files that are copied, let's say, 5MB in less than a
second and then it wait for minutes (HD led on and no actual heads
activity, by hears and hand touch) to write another "packet".
4)I tried hdparm -T -t: after 2-3 minutes I got ~650MB/s about cache,
and I have not waited enough to see the other response

I tried --fix-fixable anyway, but not --rebuild-tree nor -S (not before
copying the copyable).

I do not understand if the problem is about reiserfs corruption or if it
is a hardware problem.

Any idea, suggestion or information is appreciated 

-- 
Antonino Sergi <voyaser@tiscalinet.it>

