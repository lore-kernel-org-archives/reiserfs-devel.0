From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: knfsd and append-only attribute:  "operation not permitted"
Date: Fri, 21 Jan 2005 10:53:07 -0500
Message-ID: <1106322787.30627.5.camel@lade.trondhjem.org>
References: <8381054C-6B13-11D9-BFA6-000D933B35AA@bdi.com>
	 <1106318654.3200.38.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1106318654.3200.38.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: "Aaron D.Ball" <adb@bdi.com>, reiserfs-list@namesys.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

fr den 21.01.2005 Klokka 17:44 (+0300) skreiv Vladimir Saveliev:
> Hello
> 
> On Thu, 2005-01-20 at 21:45, Aaron D.Ball wrote:
> > When I use the kernel-based NFS server to export directories on 
> > ReiserFS that have the append-only attribute set, I can't access the 
> > files from the client machines at all:  for example, "ls" returns 
> > "operation not permitted".  Is this a known bug?  Is there a good 
> > workaround?
> > 
> 
> It looks like the problem is not in reiserfs, but in nfsd.
> fs/nfsd/vfs.c:nfsd_open() refuses to open append only files.

Append-only is an unsupported concept in the all existing revisions of
the NFS protocol. In fact, NFS has no support for append writes at all:
they have to be emulated by the clients.

Cheers,
  Trond

-- 
Trond Myklebust <trond.myklebust@fys.uio.no>

