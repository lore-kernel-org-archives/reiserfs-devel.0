From: bscott@ntisys.com
Subject: Re: Raid5, LVM and Reiserfs
Date: Mon, 21 Oct 2002 11:44:53 -0400 (EDT)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0210211132420.14076-100000@dragon.inside.ntisys.com>
References: <3DB392F6.3000603@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11732-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DB392F6.3000603@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs mail-list <Reiserfs-List@namesys.com>

On Mon, 21 Oct 2002, at 9:39am, reiser@namesys.com wrote:
> It would be surprising if any hardware RAID controller was as bad as 
> software RAID.

  Funny you should mention that.  I was just discussing this last week on
the <poweredge-linux@dell.com> mailing list.  Apparently, not all RAID
controllers are created equal.  In particular, the design of the integrated
Adaptec RAID controller used in many Dell servers apparently sucks mud when
it comes to performance.  The AMI/LSI MegaRAID controllers that Dell uses as
add-in cards do much better.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |

