From: Chris Mason <mason@suse.com>
Subject: udpated data logging available
Date: 16 Jun 2003 07:47:52 -0400
Message-ID: <1055764071.24111.650.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14559-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,

This doesn't have the data=ordered performance fixes because I got
distracted fixing io latency problems in 2.4.21.  Those were screwing up
my benchmarks, so I couldn't really tell if things were faster or not
;-)  Anyway, I'm back on track now, and since 2.4.21 is out I've just
copied Oleg's merge into my data logging directory.  I'll add the
experimental performance patches later today.

But, the code in my data logging directory now is what I would like to
see merged into 2.4.22-pre asap (pending namesys approval), so review
and testing would be appreciated.

ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21

It might take a 30 minutes or so for the rsync to complete.  

-chris




