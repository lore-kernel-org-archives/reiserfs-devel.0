From: Russell Coker <russell@coker.com.au>
Subject: Re: ReiserFS problems
Date: Fri, 8 Aug 2003 10:18:31 +1000
Message-ID: <200308081018.31525.russell@coker.com.au>
References: <20030806182055.A28562@bitwizard.nl> <3F3252A4.4010104@namesys.com> <20030807181227.GA23303@matchmail.com>
Reply-To: russell@coker.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15242-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030807181227.GA23303@matchmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: reiserfs-list@namesys.com

On Fri, 8 Aug 2003 04:12, Mike Fedyk wrote:
> But if there was at any time an uncompressed reiserfs image within the
> outer reiserfs filesystem you're fscking, won't that screw it up too?
>
> So you can compress it, but if you uncompress it to work with it, it still
> fscks fsck...  Right? :-/

Fortunately the crypto support in the kernel is getting good now.  So you 
could just use a crypto-loopback device from a file on the ReiserFS file 
system for storing a file-system image.  If you use an XOR encryption method 
it won't even hurt performance either.  :-#

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

