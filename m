From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4 for 3.6 a.k.a. removal of ->write_super()
Date: Thu, 20 Sep 2012 19:41:14 +0400
Message-ID: <5073305.Bx9WbSgmIK@intelfx-laptop>
References: <122562318.lEkMybZ46d@intelfx-laptop> <505A3154.3020700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=WsUyjcF9oEaRfE2YzRku9DDIGv3iqXwUS2bz2BFHNHc=;
        b=EF4+ryc5C5LCsxBM5V0zX8ndZe8UpcnEL5eil9ZRL6iF5EuxIKCE52uBg/3toHMZ7m
         GFE2dSv7MRi4Rm01ryLnR4+bpUbOW7TDl1JXlSS4TRi6lzswf69WofrysiR0Hring4Ln
         2BURYAym4lqkxBM8gnWp6MllLh4qxhsw9rXg7x1UpI566JqDT6G0R9JT08TMfV2b5eXf
         1jlynBAWbTAMSKJQz6+x8PXSB3iOCrpFvHmEdQi4/Y8C+o+J91M/1lxGuj1/lC25nIQd
         ek+zU2gXLdK3l3iM3z819DuRkWL6QcQPJDltwt4Kc8/RQ6DPKwD604/r6XJH3euLY/F0
         z17Q==
In-Reply-To: <505A3154.3020700@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Wednesday 19 September 2012 22:55:48 Edward Shishkin wrote:
> On 09/19/2012 08:28 PM, Ivan Shapovalov wrote:
> > Hi, Edward!
> 
> Hello.
> 
> > The 3.6 is will be released soon, and among trivial vfs changes there is
> > one pretty non-trivial: removal of sync_supers thread and ->write_super()
> > of super_operations.
> > Reiserfs (v3) compensates for it by introducing its own workqueue; does
> > reiser4 need something like that (or write_super() may be just removed
> > completely)?
> > If yes, then I'll attempt to make analogous changes to reiser4...
> 
> Long time ago (before 2.6.32, or so) ->write_super() was used by vfs
> for sync(). However, starting from .32 (or so) it isn't, so I have
> written a reiser4 implementation of ->sync_fs() for this purpose.
> 
> It seems that nowadays reiser4_sync_super is completely defuncted
> (please, check) and is not needed any more. Reiser4 has its own
> periodic writeout means (ktxnmgrd). ReiserFS (v3) didn't have this one.
> 
> So, I think, remove...
Right, I've just checked the code - it never sets superblock's ->s_dirt to 1,
so the code appears to be completely unused.

Actually, the fs doesn't appear to be damaged after 6 days of usage without
any compensations (I'm running 3.6-rc5 since Sep 14), so I guess it's true. :)

Thanks,
Ivan.
P. S.: I'll send the patch rebased on top of linux 3.6 once it's released...
