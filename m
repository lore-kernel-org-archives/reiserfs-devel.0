From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: Silly question, defrag
Date: Fri, 5 Apr 2002 08:50:35 -0500 (EST)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0204050850170.6398-100000@dragon.inside.ntisys.com>
References: <3CAD6508.2060308@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CAD6508.2060308@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>

On Fri, 5 Apr 2002, at 12:49pm, Hans Reiser wrote:
> There are a whole bunch of algorithms for optimizing layout for reads
> which are too expensive to do at every write.  Doing them once a week is
> an excellent way to handle them.

  That makes sense.

  What about using "idle time" to defragment the filesystem on a continuous
basis?  If the system is not doing anything else, a background daemon in the
kernel could move blocks around to optimize things.  While I expect this
would be a nightmare to implement in an existing filesystem driver, if it
were written with this in mind up-front, perhaps it would be easier?

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |

