From: Jake Maciejewski <maciejej@msoe.edu>
Subject: making reiser4/AMD64 hardlock
Date: Wed, 03 Nov 2004 02:59:19 -0600
Message-ID: <1099472359.8158.36.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22259-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I've been testing reiser4 on 2.6.9 (patches from 2.6.9-mm1 and fixes
from reiser4-for-2.6.9.diff). I have reiser4progs and libaal 1.0.1.
Syslog doesn't catch any errors when I get hardlocks (haven't tried
SysRq). I figured I could at least give you guys a hint about what kind
of usage pattern kills reiser4.

One command that seems to do it every time (in no more than a few
minutes) is the following, run from a directory containing kernel
source: for i in `seq 1 20` ; do make mrproper ; zcat /proc/config.gz
> .config ; make ; echo $i ; done & for i in `seq 1 5` ; do dd
if=/dev/zero of=large_file bs=1M count=20k ; rm large_file ; echo $i ;
done

Now here's the interesting part. Other FSs on the same drive can run the
command without locking, and better yet, either component of the command
runs without trouble on reiser4! It's the combination of make and dd
that kills my system. Even stranger is that I can run the dd part of the
command on a reiserFS (v3) on the same drive and it still locks. Could
the problem be in the patches rather than the reiser4 core?

If your answer is "try -mm," I have. It kills -mm too, the only
difference being when I tried it on -mm I used make -j16. Also, -mm is a
huge pain on anything other than x86 because it usually breaks more
features than it fixes, assuming it even compiles.

Is there anything more I should try? Does anyone have reiser4 working on
AMD64? It would be a shame to make it into vanilla without support for a
significant server architecture.

-- 
Jake Maciejewski <maciejej@msoe.edu>

