From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Reiser4 can't compile glibc
Date: Mon, 12 Apr 2004 18:53:16 +0200 (MEST)
Message-ID: <Pine.LNX.4.21.0404121740250.13254-100000@mlf.linux.rulez.org>
References: <1081783690.1343.2.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081783690.1343.2.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Alex Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com


What timestamp resolution Reiser4 has? Ext[23] can't compile gcc because
[kernel bugs] and it doesn't have on-disk high resolution timestamps
thus the dependency during compilation breaks.

But somehow I doubt this would be the case, all modernish filesystem
designed in the last 10 years has at least nanosec resolution.

	Szaka

