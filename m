From: Cal <hihone@bigpond.net.au>
Subject: Re: reiser4 crash
Date: Fri, 26 Nov 2004 08:14:44 +1100
Message-ID: <20041126081444.13af5196.hihone@bigpond.net.au>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi>
	<1101369249.1628.13.camel@tribesman.namesys.com>
	<20041125221919.2180794b.hihone@bigpond.net.au>
	<20041125112343.GG26192@nysv.org>
	<20041125184832.GI26192@nysv.org>
	<20041126070059.0893de98.hihone@bigpond.net.au>
	<20041125202119.GJ26192@nysv.org>
Reply-To: hihone@bigpond.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22573-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041125202119.GJ26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus =?ISO-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

----------
and then at Thu, 25 Nov 2004 22:21:19 +0200, it was written ...
...
 >Anyway, my compile just failed:
 >
 >fs/built-in.o(.text+0x9da81): In function `mask_ok_common':
 >: undefined reference to `vfs_permission'
 >make[1]: *** [.tmp_vmlinux1] Error 1
 >make[1]: Leaving directory `/usr/src/linux-2.6.9-cko4a'
 >make: *** [stamp-build] Error 2
 >
Have a look at 
  2.6.10-rc1-mm3/broken-out/reiser4-generic_acl-fix.patch.  
Around line 16 of fs/reiser4/plugin/security/perm.c,   return
vfs_permission(inode, mask); replaces 
  return generic_permission(inode, mask, NULL);
Or vice versa, I can't remember.

>Yeah,
I tried to merge that to -cko before trying the vanilla one, >because
of obvious performance-related reasons...[1] >
 >I don't think -cko caused that, though, all went afaict well
through.. >
 >I think I'll boot -cko3 again and just avoid apt-get or something,
 >this is starting to suck pretty bad :)
 >
As yet I haven't tried to merge the new 2.6.9
reiser4 code (reiser4-for-2.6.9-2.gz) with 2.6.9-ckx, but  on vanilla
2.6.9 + reiser4-for-2.6.9-2.gz, the apt-get update problem didn't
occur.  I suspect that adding the new r4 code to ck should go ok. 
I'll see if I can find time to give it a go.

cheers, Cal
