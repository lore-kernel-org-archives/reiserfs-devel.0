From: Michal Piotrowski <michal.k.k.piotrowski@gmail.com>
Subject: Re: 2.6.23-rc1-mm1
Date: Wed, 25 Jul 2007 18:32:58 +0200
Message-ID: <46A77B3A.8080503@googlemail.com>
References: <20070725040304.111550f4.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:user-agent:mime-version:to:cc:subject:references:in-reply-to:x-enigmail-version:content-type:content-transfer-encoding:from;
        b=Nq2CLTtVpXGZVDbod4fjBp6xe5uquFeNofVY9+HHuAJV2opdrpWeK9Iyp3v/v0Zp3LLezXGG/biQpA+qraZ4PCGlf43HsMRhs2edqb9Ev0MvbgpTFEJZgrO3eMuJEUuy1Pw3IU2rWervScRfyfa5ZFWbX6KDePyxbnw+LFqln+0=
In-Reply-To: <20070725040304.111550f4.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Andrew Morton pisze:
> ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.23-rc1/2.6.23-rc1-mm1/
> 

nokturn vs. reiserfs 1:0

[ 1228.964379] =============================================
[ 1228.971271] [ INFO: possible recursive locking detected ]
[ 1228.976674] 2.6.23-rc1-mm1 #1
[ 1228.979655] ---------------------------------------------
[ 1228.985064] chcon/21470 is trying to acquire lock:
[ 1228.989858]  (&inode->i_mutex){--..}, at: [<c06993ea>] mutex_lock+0x1c/0x1f
[ 1228.996968] 
[ 1228.996972] but task is already holding lock:
[ 1229.002834]  (&inode->i_mutex){--..}, at: [<c06993ea>] mutex_lock+0x1c/0x1f
[ 1229.009958] 
[ 1229.009962] other info that might help us debug this:
[ 1229.016510] 3 locks held by chcon/21470:
[ 1229.020434]  #0:  (&inode->i_mutex){--..}, at: [<c06993ea>] mutex_lock+0x1c/0x1f
[ 1229.027971]  #1:  (&REISERFS_I(inode)->xattr_sem){----}, at: [<fdd59d36>] reiserfs_setxattr+0x54/0xf2 [reiserfs]
[ 1229.038282]  #2:  (&REISERFS_SB(s)->xattr_dir_sem){----}, at: [<fdd59d55>] reiserfs_setxattr+0x73/0xf2 [reiserfs]
[ 1229.048682] 
[ 1229.048687] stack backtrace:
[ 1229.053070]  [<c04053eb>] show_trace_log_lvl+0x1a/0x30
[ 1229.058254]  [<c0406073>] show_trace+0x12/0x14
[ 1229.062734]  [<c04061a8>] dump_stack+0x16/0x18
[ 1229.067222]  [<c044c887>] __lock_acquire+0xe19/0x125c
[ 1229.072309]  [<c044cd71>] lock_acquire+0xa7/0xc1
[ 1229.076967]  [<c069908e>] __mutex_lock_slowpath+0x9b/0x3db
[ 1229.082493]  [<c06993ea>] mutex_lock+0x1c/0x1f
[ 1229.086972]  [<fdd5a2d1>] reiserfs_xattr_set+0x14c/0x2db [reiserfs]
[ 1229.093281]  [<fdd5a7e2>] security_set+0x4d/0x51 [reiserfs]
[ 1229.098898]  [<fdd59d6d>] reiserfs_setxattr+0x8b/0xf2 [reiserfs]
[ 1229.104950]  [<c04aee43>] vfs_setxattr+0x8a/0x199
[ 1229.109696]  [<c04aefcf>] setxattr+0x7d/0x109
[ 1229.114087]  [<c04af0ec>] sys_setxattr+0x41/0x53
[ 1229.118737]  [<c04043ba>] syscall_call+0x7/0xb
[ 1229.123215]  =======================
[ 1229.249502] chcon used greatest stack depth: 1080 bytes left

http://www.stardust.webpages.pl/files/tbf/bitis-gabonica/2.6.23-rc1-mm1/console.log
http://www.stardust.webpages.pl/files/tbf/bitis-gabonica/2.6.23-rc1-mm1/mm-config

Regards,
Michal

-- 
LOG
http://www.stardust.webpages.pl/log/
