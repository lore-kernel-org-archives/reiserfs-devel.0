From: Cal <hihone@bigpond.net.au>
Subject: Re: reiser4 crash
Date: Fri, 26 Nov 2004 08:42:25 +1100
Message-ID: <20041126084225.35ecfffb.hihone@bigpond.net.au>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi>
	<1101369249.1628.13.camel@tribesman.namesys.com>
	<20041125221919.2180794b.hihone@bigpond.net.au>
	<20041125112343.GG26192@nysv.org>
	<20041125184832.GI26192@nysv.org>
	<20041126070059.0893de98.hihone@bigpond.net.au>
	<20041125202119.GJ26192@nysv.org>
	<20041126081444.13af5196.hihone@bigpond.net.au>
	<20041125212826.GK26192@nysv.org>
Reply-To: hihone@bigpond.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22575-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041125212826.GK26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus =?ISO-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

----------
and then at Thu, 25 Nov 2004 23:28:26 +0200, it was written ...
 >>Have a look at 
 >>  2.6.10-rc1-mm3/broken-out/reiser4-generic_acl-fix.patch.  
 >>Around line 16 of fs/reiser4/plugin/security/perm.c,   return
 >>vfs_permission(inode, mask); replaces 
 >>  return generic_permission(inode, mask, NULL);
 >>Or vice versa, I can't remember.
 >
 >Uhhuh, you edited that?

Yep.

 >I'm compiling such a beast right now.
 >
 >I also edited as said above and kicked in a new compile...

Yeah, me too.

 >
 >Shouldn't this warrant a -3 then, because this seems to me like
something >that should break for everyone and not just me ;)

With the amount of work these guys are putting into it all, I wouldn't
dare to suggest what's warranted.  I'm content to fiddle about, learn
what I can, and wait for the guys who really know what they're doing
to pull it all together.  They always do.
 >
 >Hope I didn't misunderstand anything, I don't have any -mm sources
now >at hand nor will I have time for quite a while to start playing
around.. >
Sounds like it's sleep time ... I've just woken up.

cheers, Cal

