From: Jake Maciejewski <maciejej@msoe.edu>
Subject: Re: making reiser4/AMD64 hardlock
Date: Fri, 12 Nov 2004 14:03:41 -0600
Message-ID: <1100289821.8382.13.camel@localhost>
References: <1099472359.8158.36.camel@localhost>
	 <1100073674.31776.21.camel@localhost>
	 <1100102927.1659.64.camel@tribesman.namesys.com>
	 <200411122117.39613.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200411122117.39613.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

Good point. Unfortunately, I wiped out the corrupt filesystem to test
2.6.10-rc1. I didn't notice any corruption in my most recent test, but
if it ever happens again, I'll do a --check after --build-fs and post
the results. 

On Fri, 2004-11-12 at 21:17 +0300, Vitaly Fertman wrote:
> Would you also run fsck.reiser4 --check on the device after fsck.reiser4 --build-fs
> to find out if fs is fixed or not before continue using it ?
-- 
Jake Maciejewski <maciejej@msoe.edu>

