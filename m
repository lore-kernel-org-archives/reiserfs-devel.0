From: Russell Coker <russell@coker.com.au>
Subject: Re: [OT] Re: ReiserFS problems
Date: Fri, 8 Aug 2003 22:59:05 +1000
Message-ID: <200308082259.05512.russell@coker.com.au>
References: <20030806182055.A28562@bitwizard.nl> <200308081018.31525.russell@coker.com.au> <3F338990.3040506@g-house.de>
Reply-To: russell@coker.com.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15249-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F338990.3040506@g-house.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Kujau <evil@g-house.de>, reiserfs-list@namesys.com

On Fri, 8 Aug 2003 21:29, Christian Kujau wrote:
> Russell Coker wrote:
> > system for storing a file-system image.  If you use an XOR encryption
> > method it won't even hurt performance either.  :-#
>
> sorry to hop in here, but i don't understand why an algorithm like "XOR"
> is named "encryption" at all. isn't it that another XOR operation just
> delivers the cleartext again?

It is encryption just as is the "Caesar cipher" (of which ROT-13 is a 
sub-set).  It is not very good encryption, but it's enough to stop reiserfsck 
from doing the wrong thing as it will defeat magic number detection.

Of course a magic number can be hit by chance given a sufficiently large 
amount of input data.  I imagine that a gzip file could have the ReiserFS 
magic data if given the right/wrong input and thus could be munged through a 
fsck.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

