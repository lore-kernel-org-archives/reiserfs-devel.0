From: Chris Mason <mason@suse.com>
Subject: Re: xattr
Date: 19 Jun 2003 09:52:00 -0400
Message-ID: <1056030719.6758.97.camel@tiny.suse.com>
References: <200306162226.39701.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14623-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306162226.39701.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

On Mon, 2003-06-16 at 08:26, Russell Coker wrote:
> What is the status of xattr support in 2.5.x?
> 
> How is journalling of xattr's being handled?
> 
> For correct operation of SE Linux we need to have the xattr that is used for 
> the security context be changed atomically, and if a file is created and 
> immediately has the xattr set then ideally we would have the file creation 
> and the xattr creation in the same journal entry.
> 
> Is this possible?  If doing this requires that the file system be mounted with 
> data=journal then this will be fine.

How big are the xattrs you have in mind?  We can get atomic writes of 4k
in length but beyond that things get more difficult.

As for the xattr and the create in the same transaction, that's a little
harder.  We'd probably need a new syscall, or to change the semantics of
the xattr call such that creating an xattr on a file that doesn't exist
also creates the file.

-chris


