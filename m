From: Russell Coker <russell@coker.com.au>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 15:45:14 +0100
Message-ID: <200301311545.14348.russell@coker.com.au>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <200301311458.59747.russell@coker.com.au> <3E3A8628.6030102@namesys.com>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E3A8628.6030102@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

On Fri, 31 Jan 2003 15:20, Hans Reiser wrote:
> >The fact that the patched kernels shipped by distributions appear to have
> >almost totally disjoint sets of patches is also noteworthy...
>
> and truly sad....  politics determines code...  and neither side is
> especially to blame for it --- it is simply herd sociology in action....

There are plenty of good reasons for having different sets of patches as Chris 
pointed out.  Sometimes patches conflict to a degree that it's impossible to 
merge them, and you have to make a choice of which patch you want.  Sometimes 
patch conflict enough that you could merge them if you spent a lot of time 
working on it and you have to decide whether this time (and money) is 
justified.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

