From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: mmotm 2009-02-10-16-35 uploaded (reiser4-quota)
Date: Wed, 11 Feb 2009 09:06:53 -0800
Message-ID: <499305AD.4020900@oracle.com>
References: <200902110036.n1B0aBZs013975@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757724AbZBKRHa@vger.kernel.org>
In-Reply-To: <200902110036.n1B0aBZs013975@imap1.linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, jack@suse.cz, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2009-02-10-16-35 has been uploaded to
> 
>    http://userweb.kernel.org/~akpm/mmotm/
> 
> and will soon be available at
> 
>    git://git.zen-sources.org/zen/mmotm.git


mmotm-2009-0210-1635/fs/reiser4/plugin/inode_ops.c:456: error: implicit declaration of function 'DQUOT_TRANSFER'
mmotm-2009-0210-1635/fs/reiser4/plugin/inode_ops.c:596: error: implicit declaration of function 'DQUOT_ALLOC_INODE'
mmotm-2009-0210-1635/fs/reiser4/plugin/inode_ops.c:597: error: implicit declaration of function 'DQUOT_DROP'
mmotm-2009-0210-1635/fs/reiser4/plugin/inode_ops.c:611: error: implicit declaration of function 'DQUOT_FREE_INODE'


-- 
~Randy
