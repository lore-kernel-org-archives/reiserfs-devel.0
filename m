From: bscott@ntisys.com
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Fri, 16 Aug 2002 10:42:11 -0400 (EDT)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0208161041230.28115-100000@dragon.inside.ntisys.com>
References: <3D5D0B24.2030806@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D5D0B24.2030806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

On Fri, 16 Aug 2002, at 6:24pm, Hans Reiser wrote:
> A colleague of mine back when I was part of a sysadmin department used to
> write to every block on the drive before installing the OS on it.  I think
> he was right to do so.  I have considered having mkreiserfs ask the user
> if he wants to do that.

  I usually do a "badblocks -w" on any new disk before putting it into
production for that reason.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |

