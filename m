From: Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Subject: Re: reiserfs: inconsistent format in __RASSERT
Date: Mon, 16 Mar 2015 21:18:20 +0800
Message-ID: <5506D81C.50805@m4x.org>
References: <5506D2DB.6040907@m4x.org> <5506D504.7040800@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5506D504.7040800@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 03/16/2015 09:05 PM, Jeff Mahoney wrote:
> On 3/16/15 8:55 AM, Nicolas Iooss wrote:
>> * I missed something in my analysis and in fact the PID argument
>> is processed by reiserfs_panic (don't know where), or * the PID
>> argument is not used and should be removed, or
> 
> This, please. reiserfs_panic calls BUG(), which will contain the PID.

Whoo, thanks for the quick answer.  I will send a patch as soon as possible.

>> * the PID is useful and "[%i]" should be added somewhere in the
>> format string.
> 
>> Which one would you prefer?
> 
>> Also, I found this when building the kernel with "allmodconfig" on 
>> x86_64.  With "defconfig" gcc does not report this error, but I
>> guess it is because without CONFIG_REISERFS_CHECK, __RASSERT is
>> never used.
> 
> Yeah. If reiserfs was more actively maintained, what is currently
> protected by CONFIG_REISERFS_CHECK would be handled a bit better.
> There are ton of fsfuzzer bugs that would be caught by it and should
> be handled using reiserfs_error. Unfortunately, it also enables some
> heavy checks that make the file system very slow.
> 
> Thanks for looking into this. It looks like it's been broken for a
> while. I suppose the only saving grace is that it would crash in a
> path that crashes on purpose a few lines later.

Yes, and this is also why I believe this bug is not a security issue nor
something which needs an urgent fix.

Thanks,

Nicolas
