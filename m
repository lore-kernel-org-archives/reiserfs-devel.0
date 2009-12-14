From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Mon, 14 Dec 2009 14:52:58 -0800 (PST)
Message-ID: <alpine.DEB.2.01.0912141446570.2915@bogon.housecafe.de>
References: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

On Mon, 14 Dec 2009 at 14:44, Christian Kujau wrote:
> REISERFS warning (device xvda3): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr 
> (user.{http:%2F%2Ftwistedmatrix.com%2Fxml_namespace%2Fdav%2Fprivate%2F}quota-used) 
> associated with [765 72063 0x0 SD]

Oh, of course the archives have them as well:

http://www.mail-archive.com/reiserfs-list@namesys.com/msg16215.html

But being an old posting (from 2004) I thought I should post anyway, as 
it's still an issue with 2.6.32, apparently. I take it that reiserfs can't 
do anything about it, right? However, it should be noted that there were 
no device errors logged - and I wonder *why* reiserfs was unable to write 
the xattr entry to disk / what corrupted the xattr entry in the first 
place.

Christian.
-- 
BOFH excuse #382:

Someone was smoking in the computer room and set off the halon systems.
