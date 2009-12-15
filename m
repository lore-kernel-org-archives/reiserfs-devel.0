From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: jdm-20002 reiserfs_xattr_get: Invalid hash for xattr
Date: Mon, 14 Dec 2009 19:12:05 -0800 (PST)
Message-ID: <alpine.DEB.2.01.0912141845490.3483@bogon.housecafe.de>
References: <alpine.DEB.2.01.0912141432170.2915@bogon.housecafe.de> <alpine.DEB.2.01.0912141446570.2915@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.0912141446570.2915@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

On Mon, 14 Dec 2009 at 14:52, Christian Kujau wrote:
> > REISERFS warning (device xvda3): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr 
> > (user.{http:%2F%2Ftwistedmatrix.com%2Fxml_namespace%2Fdav%2Fprivate%2F}quota-used) 
> > associated with [765 72063 0x0 SD]

FWIW, reiserfsck-3.6.21 did not report any errors - I assume it's safe to 
ignore this warning, right?

Christian.
-- 
BOFH excuse #93:

Feature not yet implemented
