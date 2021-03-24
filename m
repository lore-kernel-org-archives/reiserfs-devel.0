From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
Date: Wed, 24 Mar 2021 23:47:34 +0900
Message-ID: <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
 <20210322153142.GF31783@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20210322153142.GF31783@quack2.suse.cz>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org, jeffm@suse.com

On 2021/03/23 0:31, Jan Kara wrote:
> Thanks for the patch Tetsuo! I'd prefer if Jeff had a look since he has
> written this code back then. But let me provide my view: I agree that for a
> corrupted filesystem it can happen that xattr_root remains NULL although
> priv_root is set. So your change makes sense. But then
> reiserfs_xattrs_initialized() seems to be used really minimally? Only once
> in fs/reiserfs/xattr_security.c and e.g. reiserfs_xattr_set() is prone to
> the same problem? Do I miss something?

As far as tested with assertion patch
( https://syzkaller.appspot.com/text?tag=Patch&x=13186fe6d00000 ) applied,
syzbot did not trigger the BUG_ON() added by this patch, which means that
reiserfs_fill_super() always fails if reiserfs_xattrs_initialized() returned false.

And console log ( https://syzkaller.appspot.com/text?tag=CrashLog&x=177b30bad00000 ) contains

  jdm-20006 create_privroot: xattrs/ACLs enabled and couldn't find/create .reiserfs_priv. Failing mount.

messages, which means that e.g. reiserfs_xattr_set() will not be called on
this corrupted filesystem image because mount operation itself fails.

Despite there are other bugs remaining, I think that applying this patch as-is is OK.

