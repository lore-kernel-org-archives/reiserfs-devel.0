From: Hans Reiser <reiser@namesys.com>
Subject: Re: plugin for cached network file system
Date: Wed, 12 May 2004 22:49:07 -0700
Message-ID: <40A30C53.3020607@namesys.com>
References: <200405131059.22693.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405131059.22693.Michael.James@csiro.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael.James@csiro.au
Cc: reiserfs-list@namesys.com

Michael James wrote:

>How hard would it be to write a Reiser4 plug-in
> to implement a network file system with a cache on the local disk?
>
>By caching I mean an incomplete local mirror
> of the master filesystem on the network server
> with on-demand loading and a simple flushing algorithm.
>So open calls to files in the cached area are intercepted
> and if the file isn't already in place a script is called to get it there.
>THEN the open call returns the file-handle normally.
>
>I only need the simplest case of a distributed file system:
>  - nodes are only reading the files,
>  - files only change slowly (~weekly) 
>	so cached files could be assumed fresh for a day at a time
>	or even flushed with:		rsh node 'rm -r /cache/*'
>  - any network code could be avoided by NFS mounting the master copy,
>	so fetching a new file is still just a local cp off the NFS mount.
>
>
>The situation is that CSIRO'S Bioinformatics Facility
> has two 400Gig filesystems on a server,
> that need to be available to 66 cluster nodes.
>Just NFS exporting one server to so many nodes leaves the cluster NFS bound.
>(Should I say they are Dell Perc 3 controllers and slow-as...)
>
>Jobs come in big batches each reading the same 2 - 6 Gig file.
>Each node has 27 Gig of free space so it's heaps for the working set
> I just don't want to have to groom what is in this working set for each job.
>Nor do I want to have to pre-pend an rsync to a batch.
>
>Has anyone written something that could be bent to this purpose?
>Is there template code for a Reiser4 plug-in?
>Or what would it cost to get it written?
>
>michaelj
>
>
>  
>
It is easy to do a hack, and hard to do it right so that the world would 
want to drop nfs and move to it.  We are trying to find a sponsor to do 
it right, and have a proposal called Reiser5 that costs $1.8 million, 
and provides global scalability (which nfs/afs/clusterfs/intermezzo do 
not, in my view).

Hans
