From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Wed, 10 Feb 2010 16:13:21 -0500
Message-ID: <4B732171.1010609@suse.com>
References: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141446570.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141845490.3483@bogon.housecafe.de> <alpine.DEB.2.01.0912152122470.3483@bogon.housecafe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.0912152122470.3483@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

On 12/16/2009 12:31 AM, Christian Kujau wrote:
> On Mon, 14 Dec 2009 at 19:12, Christian Kujau wrote:
>> REISERFS warning (device xvda3): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr 
>> (user.{http:%2F%2Ftwistedmatrix.com%2Fxml_namespace%2Fdav%2Fprivate%2F}quota-used) 
>> associated with [765 72063 0x0 SD]
> 
> Hm, the filesystem has been created a long time ago, the mountoptions 
> haven't changed but since upgrading to 2.6.32 these messages appear quite 
> frequently. Does anyone have an idea how to stop them? (Apart from ripping 
> out the reiserfs_warning(), I mean)

Sorry for the late response. I"m catching up to all the old messages.

The way to fix this is to remove the xattr. There's no way to sync it
back up.

-Jeff

-- 
Jeff Mahoney
SUSE Labs
