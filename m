From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: plugin for cached network file system
Date: Thu, 13 May 2004 11:15:24 +0200
Message-ID: <200405131115.24866.christian.mayrhuber@gmx.net>
References: <200405131059.22693.Michael.James@csiro.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18650-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200405131059.22693.Michael.James@csiro.au>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael.James@csiro.au, reiserfs-list@namesys.com

You could try coda. http://www.coda.cs.cmu.edu/
It supports disconnected operation and network caching.
I don't know if their "venus" caching daemon blows up if you tell it=20
to cache 20Gig's. Their admin doc says max. 300Meg's for caching.

=46rom their homepage:
Coda is a distributed filesystem with its origin in AFS2. It has many featu=
res=20
that are very desirable for network filesystems. Currently, Coda has severa=
l=20
features not found elsewhere.

   1. disconnected operation for mobile computing
   2. is freely available under a liberal license
   3. high performance through client side persistent caching
   4. server replication
   5. security model for authentication, encryption and access control
   6. continued operation during partial network failures in server network
   7. network bandwith adaptation
   8. good scalability
   9. well defined semantics of sharing, even in the presence of network=20
failures=20



On Thursday 13 May 2004 02:59, Michael James wrote:
> How hard would it be to write a Reiser4 plug-in
>  to implement a network file system with a cache on the local disk?
>
> By caching I mean an incomplete local mirror
>  of the master filesystem on the network server
>  with on-demand loading and a simple flushing algorithm.
> So open calls to files in the cached area are intercepted
>  and if the file isn't already in place a script is called to get it ther=
e.
> THEN the open call returns the file-handle normally.
>
> I only need the simplest case of a distributed file system:
>   - nodes are only reading the files,
>   - files only change slowly (~weekly)
> 	so cached files could be assumed fresh for a day at a time
> 	or even flushed with:		rsh node 'rm -r /cache/*'
>   - any network code could be avoided by NFS mounting the master copy,
> 	so fetching a new file is still just a local cp off the NFS mount.
>
>
> The situation is that CSIRO'S Bioinformatics Facility
>  has two 400Gig filesystems on a server,
>  that need to be available to 66 cluster nodes.
> Just NFS exporting one server to so many nodes leaves the cluster NFS
> bound. (Should I say they are Dell Perc 3 controllers and slow-as...)
>
> Jobs come in big batches each reading the same 2 - 6 Gig file.
> Each node has 27 Gig of free space so it's heaps for the working set
>  I just don't want to have to groom what is in this working set for each
> job. Nor do I want to have to pre-pend an rsync to a batch.
>
> Has anyone written something that could be bent to this purpose?
> Is there template code for a Reiser4 plug-in?
> Or what would it cost to get it written?
>
> michaelj

=2D-=20
lg, Chris

