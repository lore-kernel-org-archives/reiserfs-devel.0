From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
Date: Thu, 25 Mar 2021 15:19:44 +0900
Message-ID: <bf4bbfb6-17f2-4a57-e125-070e9e875888@i-love.sakura.ne.jp>
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
 <20210322153142.GF31783@quack2.suse.cz>
 <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>
 <7d7a884a-5a94-5b0e-3cf5-82d12e1b0992@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <7d7a884a-5a94-5b0e-3cf5-82d12e1b0992@suse.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org

On 2021/03/25 0:20, Jeff Mahoney wrote:
> Tetsuo's patch is fine but it needs a similar fix in reiserfs_xattr_set,
> as you noted.  Whether it's required is another question.  ReiserFS is
> absolutely loaded with fuzzer bugs.

Can we apply this patch as-is? Since this is currently 5th top crasher,
applying this patch as soon as possible helps utilizing syzbot's resource
for finding further bugs.
