From: Cal <hihone@bigpond.net.au>
Subject: Re: reiser4 crash
Date: Fri, 26 Nov 2004 07:00:59 +1100
Message-ID: <20041126070059.0893de98.hihone@bigpond.net.au>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi>
	<1101369249.1628.13.camel@tribesman.namesys.com>
	<20041125221919.2180794b.hihone@bigpond.net.au>
	<20041125112343.GG26192@nysv.org>
	<20041125184832.GI26192@nysv.org>
Reply-To: hihone@bigpond.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041125184832.GI26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus =?ISO-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

----------
and then at Thu, 25 Nov 2004 20:48:32 +0200, it was written ...
 >I checked the patches, from Piotr's broken-out cko3 which he kindly
 >gave me.
 >
 >#needed by reiser4
 >make-tree_lock-an-rwlock.patch.bz2 
 >invalidate_inodes-speedup.patch.bz2 
 >
 >What are those? Are they merged?

Both of those patches appear to be from the mm series.  They're in
2.6.10-rc2-mm2 and 2.6.10-rc2-mm3 (at least), and have generous
comments at their head regarding their purpose.

cheers, Cal
 

