From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: NFSv2 problem? initctl problem?
Date: Wed, 18 Aug 2004 17:51:03 +0300
Message-ID: <20040818145103.GE1284@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-fai@rrz.uni-koeln.de, reiserfs-list@namesys.com

Hi!

I've been trying, quite desperately, to get FAI working but there appears
to be some bad karma.

The server exports /usr/local/share/fai with async,rw and
/usr/lib/fai/nfsroot with async,rw,no_root_squash
Originally I had ro, but that did not seem to matter.

I get to the point where the 2.4.24-fai kernel of Debian boots, but it
stalls after the FAI_FLAGS: syslogd=1 line.

According to Ethereal, the big problem is in getting a getattr response
from the server. It looks like this:

mount: RPC: Remote system error - Connection timed out
/fai/class not found. Aborting.

It did not abort, though; it still sends out the getattr query
and gets a response.

According to the tcpdump, the file id in question is 147491.

mjt@hinkistan:~$ find /usr/lib/fai/nfsroot/ -inum 147491 | xargs file
find: /usr/lib/fai/nfsroot/var/spool/cron/crontabs: Permission denied
find: /usr/lib/fai/nfsroot/root/.ssh: Permission denied
/usr/lib/fai/nfsroot/dev/initctl: fifo (named pipe)

On the server side I'm running Debian Sarge with 2.4.18-bf2.4, all
clear, and trying to use 2.4.24-fai for the installer, which should
be clear as well.

It doesn't matter whether I use the kernel- or user-space NFS implementation,
it still dies on me, except that I'd rather use the kernel-space one.

Now what I'm wondering about is where is the error?

Is it possible there's some issue with NFSv2; should I use NFSv3 instead?

How can I force the client to use only NFSv3? rpc.mountd -N2 -V3 should
work, right? But it still speaks v2 according to the traffic AND affects
only the server-side, in theory, if not in practice apparently.

The underlying filesystem is ReiserFS, so I'm sending a copy of this
mail to the ReiserFS list as well, to see if anyone over there knows
anything about this. If need be, I can reinstall the FAI server to use
some other FS, but I would not like to do that.

With the user-space NFS implementation I got the file id of 1476542499
which does not have a file in the file system at all. Might this be
because of ReiserFS? An ancient curse? NFS just being broken?

Any help is greatly appreciated here, I have a deadline coming up for
this installation and just out of principle I would dislike doing it
from a CD as I'm going to install a lot more of these Debians and need
FAI working...

PS.
Semi-off topic, what's the status of NFSv4? rpc.mountd supports something
like it but is it in Linux already?
Should I seek answers elsewhere than in 0d NFS protocols?

Thanks a million!

-- 
mjt

