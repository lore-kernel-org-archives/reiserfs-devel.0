From: bscott@ntisys.com
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Mon, 19 May 2003 15:55:53 -0400 (EDT)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0305191544380.7975-100000@dragon.inside.ntisys.com>
References: <200305172030.58775.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305172030.58775.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS <reiserfs-list@namesys.com>


  Observation: Unix and its clones (such as Linux) have, traditionally, done
poorly when the root filesystem is not safe and sane.  The stance appears to
be (have been) that, if the root is damaged, the system doesn't have enough
marbles left to reliably repair itself.  At that point, you must boot from
some other filesystem.

  That is, I think, a not entirely unreasonable stance to take.  The root
filesystem is critical to any Unix system.  System binaries, device nodes,
and essential configuration files all live there.  If any of those are
damaged, you can no longer trust the system to function properly.  Sure, it
*may* work, but you are gambling at that point.  You are hoping that nothing
you need is damaged.  You cannot guarantee it.

  Rather than trying to engineer a perfect filesystem (which, I think, may
be impossible), it would be better (and far more practical) to develop
recovery mechanisms.  For less critical systems, you can simply boot from a
rescue CD.  For systems where uptime is essential, you can look at things
like putting recovery mechanisms in the initrd, or keep a "standby root"  
available in a separate partition (or even a separate disk).

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do  |
| not represent the views or policy of any other person or organization. |
| All information is provided without warranty of any kind.              |

