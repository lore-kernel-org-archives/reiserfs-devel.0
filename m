From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Thu, 11 Feb 2010 17:00:07 -0800 (PST)
Message-ID: <alpine.DEB.2.01.1002111652330.27799@bogon.housecafe.de>
References: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141446570.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141845490.3483@bogon.housecafe.de> <alpine.DEB.2.01.0912152122470.3483@bogon.housecafe.de> <4B732171.1010609@suse.com>
 <alpine.DEB.2.01.1002101650240.27799@bogon.housecafe.de> <4B7415D4.1080201@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4B7415D4.1080201@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

On Thu, 11 Feb 2010 at 09:36, Jeff Mahoney wrote:
> Well "buggy" depends on whether you're seeing this problem on new xattrs
> or just ones that have been around for some time.

When I started to see the problem (Dec 2009) I removed the xattrs from the 
files in question - only to see new warnings for other files reported. 
However, I cannot tell *when* these xattr have been assigned to these 
files. For that to track I could probably monitor the filesystem, generate 
a daily list of files-with-xattrs and then wait if one of these files gets 
reported with "Invalid hash for xattr" later on.

> To locate all the broken xattrs on your system, run this as root and
> then check your log afterwards:
> getfattr -d -R -m '.*' /

Yes, thanks. I just used "find" to look for the reported inodes that were 
included in the error message and getfattr did not generate any more 
warnings after I removed those xattrs.

Thanks,
Christian.
-- 
BOFH excuse #351:

PEBKAC (Problem Exists Between Keyboard And Chair)
