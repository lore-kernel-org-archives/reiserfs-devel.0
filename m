From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [git pull -tip V2] fix headers_check warnings
Date: Tue, 3 Feb 2009 14:50:35 +0100
Message-ID: <200902031450.37016.arnd@arndb.de>
References: <1233598278.10133.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1233598278.10133.4.camel@localhost.localdomain>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Cc: Ingo Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>, Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Monday 02 February 2009, Jaswinder Singh Rajput wrote:
> Jaswinder Singh Rajput (7):
>       headers_check fix: linux/coda_psdev.h
>       headers_check fix: linux/in6.h
>       headers_check fix: linux/nubus.h
>       headers_check fix: linux/socket.h
>       headers_check fix: linux/reinserfs_fs.h
>       headers_check fix: x86, prctl.h
>       headers_check fix: x86, setup.h

The new changes look good, thanks for your tireless effort to
cut down the warnings. However, my other previous comments still
apply.
In particular, the reiserfs_fs.h changes don't look helpful, how
about just not exporting that file?

	Arnd <><
