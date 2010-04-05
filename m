From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiserfs + acl corruption
Date: Sun, 4 Apr 2010 22:44:10 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1004042240500.29272@bogon.housecafe.de>
References: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com> <alpine.DEB.2.01.1004041324340.29272@bogon.housecafe.de> <alpine.DEB.2.01.1004041755070.29272@bogon.housecafe.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1004041755070.29272@bogon.housecafe.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Gatti <marco.gatti@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, jeffm@suse.com

On Sun, 4 Apr 2010 at 18:11, Christian Kujau wrote:
> Got it. After a few more iterations of the testscript[0] I was hitting it 
> at 25601 files, 25600 file were fine. Again, setting and removing *one* 
> ACL is fine, but removing *all* ACLs lead to I/O error.

The 25601 files don't need to be in one single directory. With 25000 files in 
one and 25000 files in another (sub-)directory, the same happens. Enabling 
REISERFS_CHECK hasn't revealed any more information yet.

Christian.
-- 
BOFH excuse #233:

TCP/IP UDP alarm threshold is set too low.
