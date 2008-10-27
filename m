From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 and d_alloc_anon
Date: Tue, 28 Oct 2008 02:23:02 +0300
Message-ID: <49064D56.9070405@gmail.com>
References: <f3f71ab90810260724i4db015d8r2eb562d9ef142fe1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <f3f71ab90810260724i4db015d8r2eb562d9ef142fe1@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mike Lothian <mike@fireburn.co.uk>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Mike Lothian wrote:
> Hi
>
> Reiser4 still uses d_alloc_anon and is't compiling on Linus's tree
>
> I took a look at:
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=440037287c5ebb07033ab927ca16bb68c291d309
>
> But it looks like it isn't a case of renaming to d_obtain_alias
>
> Does any one have a patch for this?
>
>   

Does the last -mm work properly btw?
I didn't take a look at this yet, but it shouldn't be a big deal..

Thanks,
Edward.
