From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Performance Impacts of Graph Cycles due to Multiple Parents
Date: Mon, 06 Jun 2005 22:04:35 -0400 EDT
Message-ID: <14167162600-BeMail@cr593174-a>
References: <17056.15292.35169.504578@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24329-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17056.15292.35169.504578@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: reiserfs-list@namesys.com

Nikita Danilov wrote on Fri, 3 Jun 2005 15:15:08 +0400:
> This is exactly what some application do. Here is how transactions can
> be implemented in the POSIX file system:
> 
>  - you have a symlink ./d.active pointing to the "current" directory
>  under which some sub-tree of interest is located;
> 
>  - to start new transaction create directory ./d.new and populate it
>  with hard-links to ./d.active content exactly replicating its
>  structure;
> 
>  - perform in ./d.new compound operation that you want to be atomic:
>  when file in ./d.new is to be modified, hard link is broken, and new
>  file created;
> 
>  - mv d.new d.committed.$(date +%s.%N);
> 
>  - when system is initialized (possibly after a crash), re-target
>  ./d.current to the latest ./d.committed.*, remove uncommitted ./d.new
>  if any.
> 
> This mechanism, known as "phase trees", obviously depends on rename(2)
> atomicity. (While this is not relevant to our discussion, a by-product
> advantage of phase-trees is that they also provide some form of
> isolation for free: read-only queries run through ./d.current and see
> only committed data.) Note that I-AM-A-TREE optimization you proposed
> doesn't work here.

Yes, with the hard links, the multi-parent file system would need to do
slightly more checking, well, only slightly more since the hard links
are to files that have no children.  Still, it would have to lock all
the children of the moving directories.  Actually, it would be one step
better in another sense - you could move the whole directory over your
current directory and have it replace "current" and all its children with
the new versions, since it can understand deleting children of a directory
that's become nonexistent, while keeping the ones which are linked elsewhere.

Also, just double checking my understanding, but is that single
threaded?  I'd expect it to break if you had more than one ./d.new
directory.

- Alex
