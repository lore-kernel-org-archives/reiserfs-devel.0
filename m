From: Michael James <Michael.James@csiro.au>
Subject: Re: plugin for cached network file system
Date: Thu, 13 May 2004 16:53:52 +1000
Message-ID: <200405131653.52862.Michael.James@csiro.au>
References: <200405131059.22693.Michael.James@csiro.au> <40A30C53.3020607@namesys.com>
Reply-To: Michael.James@csiro.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A30C53.3020607@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> > Michael James asked:
> >
> >How hard would it be to write a Reiser4 plug-in
> > to implement a network file system with a cache on the local disk?

Then, On Thursday 13 May 2004 15:49, Hans Reiser wrote:

> It is easy to do a hack, and hard to do it right so that the world would 
> want to drop nfs and move to it.  We are trying to find a sponsor to do 
> it right, and have a proposal called Reiser5 that costs $1.8 million, 
> and provides global scalability (which nfs/afs/clusterfs/intermezzo do 
> not, in my view).

At this stage, I'm looking for the, "Don't worry, be scrappy" solution.

1) Just kludge the basic functionality.
	(read-only, file-fetching/flushing in sh or perl,
	 NFS mounted master, manual deletion of outdated copies)

2) Let time, necessity and the GPL refine it and add features.
	(read-write-locking, automatic updating,
	  built-in file fetching/flushing and network code)

3) Always keeping an eye on 2) during 1).

There doesn't seem to be anything like this in Linux, and having it
 would be a boon (and give reiser4 a leg-up) in the cluster community.

michaelj


-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

