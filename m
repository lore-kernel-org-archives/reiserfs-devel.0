From: Oleg Drokin <green@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 19 Feb 2003 09:26:38 +0300
Message-ID: <20030219092638.A24598@namesys.com>
References: <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int> <3E4CF04A.2030904@namesys.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com> <20030215153710.A1723@schatzie.adilger.int> <200302182117.h1ILHHhC000658@turing-police.cc.vt.edu> <m3znot2qnx.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12832-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <m3znot2qnx.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Feb 18, 2003 at 11:02:42PM +0100, Matthias Andree wrote:

> > ext2/3 *intentionally* counts mounts rather than crashes.
> > It's possible for a filesystem to get non-noticably corrupted without
> > a crash (remember the Linux 2.4.11 mangle-on-shutdown bug?)  - it's stuff
> > like that (and slowly failing media) that it tries to catch by counting
> > mounts.
> Leaving that aside, reordered writes (write cache, enabled by default on
> most drives) is one of the other promiment reasons for creeping
> doom... the write barrier code hasn't yet been synched into 2.4 main
> stream and I doubt it ever will. It might make 2.6 though.

I saw Jens have submitted his code for review on lkml once again. So
I hope there is still a hope ;)

Bye,
    Oleg
