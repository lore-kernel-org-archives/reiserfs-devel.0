From: Chris Mason <mason@suse.com>
Subject: Re: xattr
Date: 19 Jun 2003 10:55:47 -0400
Message-ID: <1056034546.5532.103.camel@tiny.suse.com>
References: <200306162226.39701.russell@coker.com.au>
	 <1056030719.6758.97.camel@tiny.suse.com>
	 <200306200046.52292.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14625-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306200046.52292.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: Stephen Smalley <sds@epoch.ncsc.mil>, reiserfs-list@namesys.com

On Thu, 2003-06-19 at 10:46, Russell Coker wrote:
> On the topic of atomic xattr operations on ReiserFS as needed for the new 
> LSM/SE Linux operations.
> 
> On Thu, 19 Jun 2003 23:52, Chris Mason wrote:
> > How big are the xattrs you have in mind?  We can get atomic writes of 4k
> > in length but beyond that things get more difficult.
> 
> Most of them will be less than 80 bytes.  They are currently of the form:
> user-name:object_r:type
> 
> The user-name is the Unix account name which usually isn't much more than 8 
> bytes.  The "type" is usually less than 15 bytes (the longest I've used so 
> far is 20 bytes).
> 
> So the longest value I've used is 38 bytes.
> 

Then data=journal mode will do what you want.  You'll get atomic writes
up to 4k.  If you really don't want data=journal for the rest of the FS,
we can make an option for using data logging on xattr files only.  Jeff
and I had wanted to avoid the complication but it is at least possible.

> Also they can't be chosen arbitarily by the user.  The user gets some small 
> control over the type within a range of types that the administrator permits.
> If the administrator permits overly long type names and has to deal with 
> non-atomicity as a result then it's their issue.
> 
> If you can guarantee atomic operations on 160 byte operations (twice what I 
> expect anyone to use) then it'll be fine.
> 
> > As for the xattr and the create in the same transaction, that's a little
> > harder.  We'd probably need a new syscall, or to change the semantics of
> > the xattr call such that creating an xattr on a file that doesn't exist
> > also creates the file.
> 
> Creating a file by creating the xattr sounds like a bad idea as you can't 
> control the Unix permissions of the file.  This isn't much of a big deal with 
> SE Linux as the security type determines who can access the file.  But for 
> other uses it may be a serious problem.
> 
> I agree that we need a new syscall and other people had the same idea before 
> either of us.
> 
> Maybe ReiserFS could be used as the first implementation of this proposed new 
> syscall...

It would be best to go through Andreas Gruenbacher for xattr API
changes.  He's quite reasonable.

-chris


