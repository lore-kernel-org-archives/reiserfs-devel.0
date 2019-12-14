From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Re: memory leak in reiserfs_fill_super
Date: Sat, 14 Dec 2019 15:12:57 -0800
Message-ID: <dbad2a8f-5a58-ecb5-eec7-1d6ef90abaed@infradead.org>
References: <000000000000ab22f20599779d25@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=i+DDtky/nAKB+Rdsf1AfFhIsxPrHwkb2kPd66eWH5Ik=; b=p/zLE2ZTwWta6mQbO5dSZHUMC
        N4zSvVSULuKdmAD+dNkNq7GIqD7lMfxYiPyCdql0YPWAFFo1jcKIiABiuJ3607ZIa2COCzVgtDFbS
        1ypvgqjGuo5tVLomdSg1GY5Pi6jg/c4okebGYqw20zcRae+jG9kq9E++QhkMWh9fb7EEIG9nkIB3a
        VwEMIAbSdRNA2H2sWGN4EQT3wabvhz/vPgRIZRurts+aTOLwk8eym8fHpIEahDWCZMWnEDy9LCrhw
        cockEx5l+bFH541mXRYwtfCtThFRv6utHgtK1vWkN0+DWvFugEhDSgsL8K9B2us3WJHsWcb7OpkcH
In-Reply-To: <000000000000ab22f20599779d25@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: syzbot <syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com>, deepa.kernel@gmail.com, jack@suse.cz, jeffm@suse.com, jlayton@kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk

From: Randy Dunlap <rdunlap@infradead.org>

fill_super() conditionally allocates a jdev string if "jdev=x"
is specified.  put_super() should free that memory.

Reported-by: syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 fs/reiserfs/super.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20191213.orig/fs/reiserfs/super.c
+++ linux-next-20191213/fs/reiserfs/super.c
@@ -629,6 +629,7 @@ static void reiserfs_put_super(struct su
 	reiserfs_write_unlock(s);
 	mutex_destroy(&REISERFS_SB(s)->lock);
 	destroy_workqueue(REISERFS_SB(s)->commit_wq);
+	kfree(REISERFS_SB(s)->s_jdev);
 	kfree(s->s_fs_info);
 	s->s_fs_info = NULL;
 }

