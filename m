From: bscott@ntisys.com
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: Wed, 16 Apr 2003 14:05:44 -0400 (EDT)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0304161404200.25258-100000@dragon.inside.ntisys.com>
References: <1389382.20030416185111@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1389382.20030416185111@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Mailing List <Reiserfs-List@namesys.com>

On Wed, 16 Apr 2003, at 6:51pm, andewid@tnonline.net wrote:
> You can still use the controller, but I would do the mirroring natively in
> Linux than depend on the Promise BIOS to do it.

  Yah, that too.  My motherboard at home has an HPT "fake RAID" chipset on
it.  I've never used it for RAID, but for a time I had a single hard drive
attached to one of the channels, and it worked just fine as a plain old IDE
interface.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do  |
| not represent the views or policy of any other person or organization. |
| All information is provided without warranty of any kind.              |

