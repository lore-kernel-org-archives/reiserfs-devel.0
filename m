From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 crash
Date: Thu, 25 Nov 2004 23:28:26 +0200
Message-ID: <20041125212826.GK26192@nysv.org>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi> <1101369249.1628.13.camel@tribesman.namesys.com> <20041125221919.2180794b.hihone@bigpond.net.au> <20041125112343.GG26192@nysv.org> <20041125184832.GI26192@nysv.org> <20041126070059.0893de98.hihone@bigpond.net.au> <20041125202119.GJ26192@nysv.org> <20041126081444.13af5196.hihone@bigpond.net.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22574-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041126081444.13af5196.hihone@bigpond.net.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cal <hihone@bigpond.net.au>
Cc: reiserfs-list@namesys.com

On Fri, Nov 26, 2004 at 08:14:44AM +1100, Cal wrote:
> >fs/built-in.o(.text+0x9da81): In function `mask_ok_common':
> >: undefined reference to `vfs_permission'
> >make[1]: *** [.tmp_vmlinux1] Error 1
> >make[1]: Leaving directory `/usr/src/linux-2.6.9-cko4a'
> >make: *** [stamp-build] Error 2

>Have a look at 
>  2.6.10-rc1-mm3/broken-out/reiser4-generic_acl-fix.patch.  
>Around line 16 of fs/reiser4/plugin/security/perm.c,   return
>vfs_permission(inode, mask); replaces 
>  return generic_permission(inode, mask, NULL);
>Or vice versa, I can't remember.

Uhhuh, you edited that?

In my code it is
return vfs_permission(inode, mask);
so I'll just replace with return generic_permission(inode, mask, NULL);

>As yet I haven't tried to merge the new 2.6.9
>reiser4 code (reiser4-for-2.6.9-2.gz) with 2.6.9-ckx, but  on vanilla
>2.6.9 + reiser4-for-2.6.9-2.gz, the apt-get update problem didn't
>occur.  I suspect that adding the new r4 code to ck should go ok. 
>I'll see if I can find time to give it a go.

I'm compiling such a beast right now.

I also edited as said above and kicked in a new compile...

Shouldn't this warrant a -3 then, because this seems to me like something
that should break for everyone and not just me ;)

Hope I didn't misunderstand anything, I don't have any -mm sources now
at hand nor will I have time for quite a while to start playing around..

-- 
mjt

