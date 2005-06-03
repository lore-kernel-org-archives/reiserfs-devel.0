From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: Performance Impacts of Graph Cycles due to Multiple Parents
Date: Fri, 3 Jun 2005 15:15:08 +0400
Message-ID: <17056.15292.35169.504578@gargle.gargle.HOWL>
References: <17054.55690.677507.949191@gargle.gargle.HOWL>
	<11655571087-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11655571087-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

Alexander G. M. Smith writes:
 > Nikita Danilov wrote on Thu, 2 Jun 2005 14:03:54 +0400 in the

[...]

 > > That is, how atomicity guarantees of rename will be preserved? Note that
 > > many applications, like some mail servers crucially depend on rename
 > > atomicity to implement their transaction mini-engines.
 > 
 > Same as before.  Grab locks on all the children affected before doing
 > any work.  If there's a deadlock, or memory shortage, just report an

And how do you find that deadlock happened? By... wait, by finding a
cycle in the graph, right? Deadlock detection requires exponential time,
so even with few thousand locks, it's intractable within timing
constraints of interactive file system usage.

 > error back to the caller and don't change anything.  For the typical
 > mail server use, don't they just rename one file at a time?  If they
 > are moving whole large directories around, then it would be a problem.

This is exactly what some application do. Here is how transactions can
be implemented in the POSIX file system:

 - you have a symlink ./d.active pointing to the "current" directory
 under which some sub-tree of interest is located;

 - to start new transaction create directory ./d.new and populate it
 with hard-links to ./d.active content exactly replicating its
 structure;

 - perform in ./d.new compound operation that you want to be atomic:
 when file in ./d.new is to be modified, hard link is broken, and new
 file created;

 - mv d.new d.committed.$(date +%s.%N);

 - when system is initialized (possibly after a crash), re-target
 ./d.current to the latest ./d.committed.*, remove uncommitted ./d.new
 if any.

This mechanism, known as "phase trees", obviously depends on rename(2)
atomicity. (While this is not relevant to our discussion, a by-product
advantage of phase-trees is that they also provide some form of
isolation for free: read-only queries run through ./d.current and see
only committed data.) Note that I-AM-A-TREE optimization you proposed
doesn't work here.

Nikita.
