From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 3.6 a.k.a. removal of ->write_super()
Date: Wed, 19 Sep 2012 22:55:48 +0200
Message-ID: <505A3154.3020700@gmail.com>
References: <122562318.lEkMybZ46d@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <122562318.lEkMybZ46d@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 09/19/2012 08:28 PM, Ivan Shapovalov wrote:
> Hi, Edward!
>

Hello.

> The 3.6 is will be released soon, and among trivial vfs changes there is one
> pretty non-trivial: removal of sync_supers thread and ->write_super() of
> super_operations.
> Reiserfs (v3) compensates for it by introducing its own workqueue; does
> reiser4 need something like that (or write_super() may be just removed
> completely)?
> If yes, then I'll attempt to make analogous changes to reiser4...
>

Long time ago (before 2.6.32, or so) ->write_super() was used by vfs
for sync(). However, starting from .32 (or so) it isn't, so I have
written a reiser4 implementation of ->sync_fs() for this purpose.

It seems that nowadays reiser4_sync_super is completely defuncted
(please, check) and is not needed any more. Reiser4 has its own
periodic writeout means (ktxnmgrd). ReiserFS (v3) didn't have this one.

So, I think, remove...

Thanks,
Edward.
