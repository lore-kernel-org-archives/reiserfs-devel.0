From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [Fwd: we are listed as spammers now! :)]
Date: Thu, 8 May 2003 16:57:21 -0600
Message-ID: <20030508165721.A31193@schatzie.adilger.int>
References: <3EBA3C8B.4040904@namesys.com> <3EBAD052.2010307@edsons.demon.nl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EBAD052.2010307@edsons.demon.nl>; from rudy@edsons.demon.nl on Thu, May 08, 2003 at 11:46:58PM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Cc: Hans Reiser <reiser@namesys.com>, Alexander Lyamin <flx@namesys.com>, ReiserFS <reiserfs-list@namesys.com>

Hans Reiser wrote:
> fix this please
>
> and would whatever clever person reported us as spammers please not do 
> it again?

Hans, it is namesys.com that is being listed as the spammers because your
list handling/spamassassin software is removing all previous Received:
headers from list emails.  This makes it appear to the outside world
that namesys.com is the origin of this spam.  People have commented
several times that they want the original email headers left on so they
can either block spam from known-bad sources, or at least track down
any spammers using the list.

Just FYI, it also turns out that your spamassassin marking the email as
spam (often with very high spam scores) actually reduces the spam score
when it is passed on, because (a) it is coming from somewhere which isn't
supposed to have spam (based on past history) (b) the spamassassin header
often breaks the MIME encoding of the email, so later spamassassins can't
decode the garbage.  I actually had to set up a new spam filter which
looks for the [SPAM] in the header in order to catch these coming from
reiserfs-list, when my local spamassassin would have caught them.

Really, your spamassassin should just be configured to dump these into
a mailbox for someone at namesys to look at, and on the extremely unlikely
case that a real message was marked as spam they can forward it to the
list manually.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

