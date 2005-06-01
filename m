From: Nikita Danilov <nikita@clusterfs.com>
Subject: Re: File as a directory - VFS Changes
Date: Wed, 1 Jun 2005 14:58:47 +0400
Message-ID: <17053.38119.167800.192791@gargle.gargle.HOWL>
References: <17052.12223.708707.757538@gargle.gargle.HOWL>
	<585501533-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <585501533-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

Alexander G. M. Smith writes:
 > Nikita Danilov wrote on Tue, 31 May 2005 13:34:55 +0400:
 > > Cycle may consists of more graph nodes than fits into memory. Cycle
 > > detection is crucial for rename semantics, and if
 > > cycle-just-about-to-be-formed doesn't fit into memory it's not clear how
 > > to detect it, because tree has to be locked while checked for cycles, and
 > > one definitely doesn't want to keep such a lock over IO.
 > 
 > Sometimes you'll just have to return an error code if the rename operation
 > is too complex to be done.  The user will have to then delete individual
 > leaf files to make the situation simpler.  I hope this won't happen very
 > often.

Huh? How are you planning to check that adding new edge to the graph
does not introduce a cycle without inspecting all nodes of that graph at
least once (note: you don't know what other objects contain references
to the given one, only out-going edges are known)?

For example: mv /d0 /d1

To check that this doesn't introduce a cycle one has to load each child
of /d0 (which may be millions) and recursively check that from none of
them /d1 is reachable. This has to be done on each rename. I believe
this is unacceptable overhead.

 > 
 > On the plus side, the detection of all the files that may be affected
 > means you can now delete a directory directly, contents and all, if all
 > the related inodes fit into memory.
 > 
 > - Alex
 > 

Nikita.
