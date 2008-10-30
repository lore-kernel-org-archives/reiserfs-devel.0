From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4, 2.6.28-rc2-mm1 and prepare_write / commit_write
Date: Thu, 30 Oct 2008 21:03:34 +0300
Message-ID: <4909F6F6.2080701@gmail.com>
References: <4909E69E.6070202@acm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4909E69E.6070202@acm.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zan Lynx <zlynx@acm.org>
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Zan Lynx wrote:
> It looks like 2.6.28 committed the removal of prepare_write and
> commit_write.  They are apparently replaced with write_begin and
> write_end.
>
> I thought about trying to convert Reiser4 myself but it was already past
> midnight and it looked like it might be six hour job.
>
> The conversion does not look too complicated, but there may be some
> tricky issues.
>
> I am wondering if you are already working on this, Edward?

Yup.

This is only for loop devices, so if you don't use it,
you can get rid of reiser4_{prepare,commit}_write
and supply NULL to vfs as a temporary fixup.

Thanks,
Edward.

