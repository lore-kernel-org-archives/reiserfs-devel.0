From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: Silly question, defrag
Date: Fri, 5 Apr 2002 08:50:15 -0500 (EST)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0204050840330.6398-100000@dragon.inside.ntisys.com>
References: <20020405053125.GA2724@willow.seitz.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020405053125.GA2724@willow.seitz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>

On Fri, 5 Apr 2002, at 12:31am, Ross Vandegrift wrote:
>> I think it would seem likely that, once a filesystem does become fragmented,
>> performance is going to suck mud.
> 
> I'm curious though - shouldn't the elevator read algorithms take care of
> this, for the most part?  If you wait to do a read until you have a few,
> and read sequentially across the disk, you won't be hit with any seeks.

  I am no expert, but I suspect there is only so much the elevator can do.  
For a moderately small read, I image your scenario would work.  But given a
larger read and enough fragmentation, you are going to have to seek all over
the place.  Sure, you could increase the wait time in the elevator, and use
tons of buffers to re-order reads, but you will eventually start spending so
many resources on the elevator that you are back to a performance problem
again.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |


