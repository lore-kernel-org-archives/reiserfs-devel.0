From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4: Compilation Error on 2.6.28.1_[Scanned]
Date: Tue, 20 Jan 2009 00:27:54 +0300
Message-ID: <4974F05A.7090406@gmail.com>
References: <1232326407.2948.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1232326407.2948.7.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ibormuth@efil.de
Cc: reiserfs devel <reiserfs-devel@vger.kernel.org>

Ingo Bormuth wrote:
> Reiser4-for-2.6.28 does apply but fails to compile on
> vanilla-2.6.28.1 due to the following commit:
>
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=54566b2c1594c2326a645a3551f9d989f7ba3c5e
>
> Attached is a tiny fix which works fine here.
yeah, with your patch it will act as earlier,
however, -mm guys decided to get rig of __GFP_FS flag:
http://userweb.kernel.org/~akpm/mmotm/broken-out/fs-symlink-write_begin-allocation-context-fix-reiser4-fix.patch
it seems they found it deadlocky..

Thanks,
Edward.

