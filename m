From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 17:44:05 +0200
Message-ID: <200209161744.05987.bofh@coker.com.au>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <200209161713.52352.russell@coker.com.au> <200209161535.g8GFZYM4004165@turing-police.cc.vt.edu>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11476-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200209161535.g8GFZYM4004165@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Sam Vilain <sam@vilain.net>, 'reiserfs-list' <reiserfs-list@namesys.com>

On Mon, 16 Sep 2002 17:35, Valdis.Kletnieks@vt.edu wrote:
> On Mon, 16 Sep 2002 17:13:52 +0200, Russell Coker said:
> > Alternately use quotas, speaking of which, do Quotas work on ReiserFS
> > without additional patches yet?  Quotas really are an essential feature.
>
> Quotas are a Good Thing - but note that quite often you get into the
> situation where you want to "overcommit" a partition (for instance, 2G of
> disk, and 10 users each of which have a 500M limit).  It helps, but you're
> still open to attacks by collusion (intentional, accidental, or by
> hijacking 3 other userids to help).

Group quotas should help that.  Put all the untrusted users in a group that 
has a quota which is small enough to not allow any damage.

> Ahh, both are very nice, but alas, neither is part of the base kernel yet.

LSM will be part of the base kernel soon, the code merge has already 
started...  Whether SE Linux and OpenWall get included is still up for 
discussion.  But that's OK, once LSM is in the base kernel it'll be trivial 
to add SE Linux (no more patch conflicts).

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

