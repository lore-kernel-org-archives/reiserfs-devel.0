From: Sam Vilain <sam@vilain.net>
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 17:23:59 +0100
Message-ID: <20020916162359.421472926@hofmann.snowcra.sh>
References: <20020916102742.6538D2926@hofmann.snowcra.sh>
	<200209161450.g8GEorM4003750@turing-police.cc.vt.edu>
	<200209161713.52352.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11478-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200209161713.52352.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <russell@coker.com.au>
Cc: 'reiserfs-list' <reiserfs-list@namesys.com>

Russell Coker <russell@coker.com.au> wrote:

> A machine with an adequate security setup and with correctly configured quotas 
> should be able to operate correctly with hostile local users even if it only 
> has a single file system.

Perhaps.  Quotas are non-trivial to set up, though.  As you pointed
out, they're not in the standard kernel (and patching the latest
kernel with the quotas patch isn't straightforward either).

Reserved blocks should be considered a degenerate quota system.  But I
still think you should be able to have both at the same time. Checking
for reserved blocks could be combined with the quotas code, although I
do like the mount option suggested for its inherit simplicity.

Whether or not a test system will perform well with hostile local
users is not particularly what I'm interested in.  I'm worrying about
the frequency that systems with friendly users stop running because
their filesystems have filled because the programs they wrote ran
away, in real world situations.  I've seen /var/tmp filled enough on
networks I have looked after that I consider this `vital' for my
ongoing use of ReiserFS. 
--
   Sam Vilain, sam@vilain.net     WWW: http://sam.vilain.net/
    7D74 2A09 B2D3 C30F F78E      GPG: http://sam.vilain.net/sam.asc
    278A A425 30A9 05B5 2F13

  I dont have any solution, but I certainly admire the problem.
ASHLEIGH BRILLIANT
