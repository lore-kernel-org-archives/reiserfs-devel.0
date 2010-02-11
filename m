From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Wed, 10 Feb 2010 16:53:53 -0800 (PST)
Message-ID: <alpine.DEB.2.01.1002101650240.27799@bogon.housecafe.de>
References: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141446570.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141845490.3483@bogon.housecafe.de> <alpine.DEB.2.01.0912152122470.3483@bogon.housecafe.de>
 <4B732171.1010609@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4B732171.1010609@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

On Wed, 10 Feb 2010 at 16:13, Jeff Mahoney wrote:
> > Hm, the filesystem has been created a long time ago, the mountoptions 
> > haven't changed but since upgrading to 2.6.32 these messages appear quite 
> > frequently. Does anyone have an idea how to stop them? (Apart from ripping 
> > out the reiserfs_warning(), I mean)
> 
> Sorry for the late response. I"m catching up to all the old messages.
> 
> The way to fix this is to remove the xattr. There's no way to sync it
> back up.


You mean "to remove the xattr from the files in question" or "to remove 
xattr from ReiserFS because it's buggy? ;-)

Sure, I'll remove the xattrs from the files, but new warnings for other 
files will appear and reiserfsck still doesn't find anything wrong with 
the filesystem. I'm not sure how to reproduce this reliably and no one 
seems to know why these messages appear in the first place...

Thanks,
Christian.
-- 
BOFH excuse #95:

Pentium FDIV bug
