From: Russell Coker <russell@coker.com.au>
Subject: Re: xattr
Date: Fri, 20 Jun 2003 01:12:43 +1000
Message-ID: <200306200112.43405.russell@coker.com.au>
References: <200306162226.39701.russell@coker.com.au> <200306200046.52292.russell@coker.com.au> <1056034546.5532.103.camel@tiny.suse.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14627-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056034546.5532.103.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: Stephen Smalley <sds@epoch.ncsc.mil>, reiserfs-list@namesys.com

On Fri, 20 Jun 2003 00:55, Chris Mason wrote:
> > So the longest value I've used is 38 bytes.
>
> Then data=journal mode will do what you want.  You'll get atomic writes
> up to 4k.  If you really don't want data=journal for the rest of the FS,
> we can make an option for using data logging on xattr files only.  Jeff
> and I had wanted to avoid the complication but it is at least possible.

OK.  Initially just using data=journal should be fine, and even for 
wide-spread use, forcing everyone to use data=journal shouldn't be too much 
of a hardship - although I'm sure that some people will prefer to journal 
only the xattr's.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

