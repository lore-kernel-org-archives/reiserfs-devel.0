From: Russell Coker <bofh@coker.com.au>
Subject: Re: extended attributes
Date: Thu, 24 Oct 2002 15:12:05 +0200
Message-ID: <200210241512.05581.bofh@coker.com.au>
References: <200210231916.18976.bofh@coker.com.au> <20021024014522.GD28822@clusterfs.com> <1035464747.28715.92.camel@tiny>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11753-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1035464747.28715.92.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Andreas Dilger <adilger@clusterfs.com>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Thu, 24 Oct 2002 15:05, Chris Mason wrote:
> We did it without changing the metadata format at all, which means
> putting each xattr into a file.  The patches are mired in dependencies
> from other parts of the suse kernel, we're trying to pull it all out.
>
> Until then you can grab the kernels/source at
> ftp.suse.com/pub/people/mantel/next (warning, these are the suse
> bleeding edge kernels).

Unfortunately that will probably conflict with the LSM kernel patch.  LSM 
touches so many things that almost any patch of moderate size will conflict.  
:(

I look forward to seeing this get extracted out in a minimal form.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

