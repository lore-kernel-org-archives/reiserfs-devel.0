From: Cal <hihone@bigpond.net.au>
Subject: Re: hmm, dependencies
Date: Sat, 18 Dec 2004 03:39:32 +1100
Message-ID: <20041218033932.1a53c659.hihone@bigpond.net.au>
References: <1103226970.704.1.camel@localhost>
	<1103291711.3589.32.camel@tribesman.namesys.com>
	<1103296970.12405.0.camel@localhost>
Reply-To: hihone@bigpond.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1103296970.12405.0.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: redeeman@metanurb.dk
Cc: reiserfs-list@namesys.com

----------
and then at Fri, 17 Dec 2004 16:22:50 +0100, it was written ...
 >im aware, however, the reiser4 patches in mm are against mm, which means
 >it depends on something from it, and i'd like to find out what :D so
 >that i can take it out and apply to vanilla along with reiser4

That actually sounds like an awful lot of work, for questionable gain,
and I doubt you'll find anyone willing to undertake it for you.  For
reiser4 with vanilla (2.6.9 -> 2.6.10-rc3-bkX), try reiser4-for-2.6.9-3.gz
from namesys.  For 2.6.10-rc3+, you'll also need
reiser4-generic_acl-fix.patch (from 2.6.10-rc1-mm4/broken-out/).

Works for me.

cheers, Cal
