From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Thu, 11 Feb 2010 09:36:04 -0500
Message-ID: <4B7415D4.1080201@suse.com>
References: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141446570.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141845490.3483@bogon.housecafe.de> <alpine.DEB.2.01.0912152122470.3483@bogon.housecafe.de> <4B732171.1010609@suse.com> <alpine.DEB.2.01.1002101650240.27799@bogon.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1002101650240.27799@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

On 02/10/2010 07:53 PM, Christian Kujau wrote:
> On Wed, 10 Feb 2010 at 16:13, Jeff Mahoney wrote:
>>> Hm, the filesystem has been created a long time ago, the mountoptions 
>>> haven't changed but since upgrading to 2.6.32 these messages appear quite 
>>> frequently. Does anyone have an idea how to stop them? (Apart from ripping 
>>> out the reiserfs_warning(), I mean)
>>
>> Sorry for the late response. I"m catching up to all the old messages.
>>
>> The way to fix this is to remove the xattr. There's no way to sync it
>> back up.
> 
> 
> You mean "to remove the xattr from the files in question" or "to remove 
> xattr from ReiserFS because it's buggy? ;-)
> 
> Sure, I'll remove the xattrs from the files, but new warnings for other 
> files will appear and reiserfsck still doesn't find anything wrong with 
> the filesystem. I'm not sure how to reproduce this reliably and no one 
> seems to know why these messages appear in the first place...

Well "buggy" depends on whether you're seeing this problem on new xattrs
or just ones that have been around for some time. A while ago, I changed
the xattr code to be entirely journaled so that it isn't sensitive to
unexpected poweroffs, etc. If you're seeing corruption on new xattrs,
then that needs to be looked into.

There probably should be support in reiserfsck for xattrs, but I just
haven't had the time for it.

To locate all the broken xattrs on your system, run this as root and
then check your log afterwards:

getfattr -d -R -m '.*' /

-Jeff

-- 
Jeff Mahoney
SUSE Labs
