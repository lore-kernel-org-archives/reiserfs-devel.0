From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: Silly question, defrag
Date: Thu, 4 Apr 2002 17:34:09 -0500 (EST)
Sender: bscott@ntisys.com
Message-ID: <Pine.LNX.4.44.0204041721530.1352-100000@dragon.inside.ntisys.com>
References: <20020404105440.F27377@ultraviolet.org>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020404105440.F27377@ultraviolet.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


  It occurs to me that people are treating the answer to this question as a
single binary value.  I think that is an incorrect approach.

  By definition, any filesystem which is capable of storing files in
non-contiguous allocations can become fragmented.  The questions are, how
likely and how bad will it be?  It seems likely to me that different
filesystem implementations will have different behaviors with regards to
fragmentation, and those behaviors further vary depending on filesystem
usage patterns.

  So one question becomes, "Given a particular usage pattern, how fragmented
will a given filesystem become per unit of time?"  To use everyone's
favorite example, FAT's policy of simply allocating free blocks as it finds
them is practically worst-case for fragmentation.  I imagine it likely that
a more intelligent filesystem implementation would do better at this.

  Another question is, "Once a given filesystem becomes fragmented to a
given extent, what kind of performance impact do you see?"  This seems
likely to be an easier question to answer; you can do things like calculate
average seeks given various conditions, or just plain time a benchmark.  I
think it would seem likely that, once a filesystem does become fragmented,
performance is going to suck mud.  So most of it comes back to that first
question: Just how bad will the fragmentation get?

  I highly doubt this issue can be resolved to a single "yes or no" answer.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |



