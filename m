From: Lutz Vieweg <lkv@isg.de>
Subject: Fragmentation / repacker / append-performance
Date: Fri, 18 Nov 2005 17:34:49 +0100
Message-ID: <437E02A9.2050107@isg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hans Reiser wrote:

 > 6% fragmentation is enormous.  You very much need the
 > repacker we have not yet written.....

There has been talk about such a feature for a long time -
did anybody already write a concept on how to do this?
Has an effort been estimated? Is somebody already assigned
to that task?

It's not too difficult for us to implement de-fragmentation
mechanisms on the application level, but if the file
system can do it - even better...

We're currently considering reiser4 for an application
that we know would suffer badly from fragmentation, as
it needs to often append small amounts of data (a few
bytes to a few kB) to lots of files (6M).

Alas, such a task does not seem to be covered by any
of the usual benchmarks, so we have to do measurements
on our own. Any suggestion for optimal configuration
parameters we should use?

As of yet, we are using XFS for this task, which is
significantly faster for that particular application
than reiser3. Alas, XFS/kernel-2.6/SMP is known to
be unstable under high load for almost a year now,
but since the problem is hard to reproduce and those
who only need a file server can live with using just
one CPU it does not seem to get fixed anytime soon.

Regards,

Lutz Vieweg

PS: I'm still glad we sponsored the 64bit-port years
     ago, as we're still using reiser3 on a lot of
     systems that can really use it - and of course
     newly bought systems are 64bit architectures... :-)

