From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 18 Feb 2003 23:02:42 +0100
Message-ID: <m3znot2qnx.fsf@merlin.emma.line.org>
References: <3E4AA902.86F15815@interface-ag.com>
	<b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com>
	<20030214111829.A21849@namesys.com>
	<20030214031316.L22930@schatzie.adilger.int>
	<20030214131746.H10351@namesys.com>
	<20030214035034.M22930@schatzie.adilger.int>
	<3E4CF04A.2030904@namesys.com>
	<20030214120630.O22930@schatzie.adilger.int>
	<3E4D4129.8040103@namesys.com>
	<20030215153710.A1723@schatzie.adilger.int>
	<200302182117.h1ILHHhC000658@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12829-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302182117.h1ILHHhC000658@turing-police.cc.vt.edu> (Valdis.Kletnieks@vt.edu's
 message of "Tue, 18 Feb 2003 16:17:17 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Valdis.Kletnieks@vt.edu writes:

> ext2/3 *intentionally* counts mounts rather than crashes.
>
> It's possible for a filesystem to get non-noticably corrupted without
> a crash (remember the Linux 2.4.11 mangle-on-shutdown bug?)  - it's stuff
> like that (and slowly failing media) that it tries to catch by counting
> mounts.

Leaving that aside, reordered writes (write cache, enabled by default on
most drives) is one of the other promiment reasons for creeping
doom... the write barrier code hasn't yet been synched into 2.4 main
stream and I doubt it ever will. It might make 2.6 though.

-- 
Matthias Andree
