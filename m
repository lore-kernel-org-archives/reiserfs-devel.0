From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Tue, 15 Dec 2009 21:31:01 -0800 (PST)
Message-ID: <alpine.DEB.2.01.0912152122470.3483@bogon.housecafe.de>
References: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141446570.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141845490.3483@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.0912141845490.3483@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: jeffm@suse.com

On Mon, 14 Dec 2009 at 19:12, Christian Kujau wrote:
> REISERFS warning (device xvda3): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr 
> (user.{http:%2F%2Ftwistedmatrix.com%2Fxml_namespace%2Fdav%2Fprivate%2F}quota-used) 
> associated with [765 72063 0x0 SD]

Hm, the filesystem has been created a long time ago, the mountoptions 
haven't changed but since upgrading to 2.6.32 these messages appear quite 
frequently. Does anyone have an idea how to stop them? (Apart from ripping 
out the reiserfs_warning(), I mean)

Thanks,
Christian.
-- 
BOFH excuse #403:

Sysadmin didn't hear pager go off due to loud music from bar-room speakers.
