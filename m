From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Gnu Parted error, Kernel Panic, Reiserfs
Date: Fri, 16 Apr 2004 10:57:14 +0200 (MEST)
Message-ID: <Pine.LNX.4.21.0404161030320.13317-100000@mlf.linux.rulez.org>
References: <Pine.GSO.4.55L.0404160203190.11522@ohmmjbeq-ovatb.zvg.rqh>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17984-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.GSO.4.55L.0404160203190.11522@ohmmjbeq-ovatb.zvg.rqh>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Chu <alanchu@MIT.EDU>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, bug-parted@gnu.org


On Fri, 16 Apr 2004, Alan Chu wrote:

> My / partition is officially borked.  I would highly recommend NOT using
> Gnu Parted, btw.  It's screwed up my partitions twice now.  Guess I'm

Many people reports constantly Parted/QTparted, well actually
progsreiserfs what's a reimplementation of reiserfsprogs, thrashes
reiserfs for a while.

Yury V. Umanets only comments were "nobody ever reported such to him". You
can see more on several forums, mailing lists (parted, qtparted, etc), I
also pointed out to him these corruptions on the parted list several
times. But I don't know for who Yuri works now, recently I've seen using
both clusterfs and namesys email addresses, so maybe its not his "job"
anymore.

But definitely nobody cares about the issue for about half or one year. At
least reiserfs support should have been disabled in parted until somebody
would investigate/fix these corruptions.

	Szaka

