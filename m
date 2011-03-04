From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 2.6.36 kernel panic
Date: Fri, 04 Mar 2011 19:37:29 +0100
Message-ID: <4D713169.3060906@gmail.com>
References: <AANLkTimrF930Dh82UKoq=M0mDy7aVrvbXC=ZDoTZT_YC@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTimrF930Dh82UKoq=M0mDy7aVrvbXC=ZDoTZT_YC@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 03/04/2011 07:08 PM, Dushan Tcholich wrote:
> I captured kernel output with a mobile
> camera.http://img854.imageshack.us/i/04032011.jpg/
>
>   Missing text says:
> "reiser4_handle_error (fs/reiser4/vfs_ops.c:240)[foobar-42]
>
> It happened day after I enabled KMS in kernel for ati card, didn't
> notice this problem earlier.
>
> It happened twice, once after ~12h uptime, next time after ~2h uptime.


Could you please check kernel messages more carefully:
are there complaints (IO errors, etc) of any low-level
subsystem?

Thanks,
Edward.

>
> Nothing in /var/log/messages
>
> Have a nice day
>
> Dushan

