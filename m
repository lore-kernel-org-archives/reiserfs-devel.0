From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: Silly question, defrag
Date: Fri, 5 Apr 2002 09:20:59 -0500 (EST)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0204050915350.6398-100000@dragon.inside.ntisys.com>
References: <200204051404.g35E4L6H007366@foo-bar-baz.cc.vt.edu>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200204051404.g35E4L6H007366@foo-bar-baz.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>

On Fri, 5 Apr 2002, at 9:04am, Valdis.Kletnieks@vt.edu wrote:
> The biggest problem is identifying "idle" ...

  This part of the algorithm could be farmed out to a userland system call.
That is, a user process signals the kernel when to start and stop
"background maintenance" tasks.  Said userland process could be as
sophisticated as something that monitors load average and I/O load, or as
simple as a cron job that runs during off-hours.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |


