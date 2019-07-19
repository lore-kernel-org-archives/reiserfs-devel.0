From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] reiserfs: fix code unwinding with clang
Date: Fri, 19 Jul 2019 08:51:33 +0200
Message-ID: <CAK8P3a2nL0Ji2NmDvVcqyO4Rp_N9FN0OSZHRnUb+BpTdneuVMQ@mail.gmail.com>
References: <20190718134928.2472465-1-arnd@arndb.de> <cedfd2fb31d943564e19c1652bc8983a18de45d4.camel@perches.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cedfd2fb31d943564e19c1652bc8983a18de45d4.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Thu, Jul 18, 2019 at 5:20 PM Joe Perches <joe@perches.com> wrote:
> On Thu, 2019-07-18 at 15:49 +0200, Arnd Bergmann wrote:
> > This will likely get fixed in a future clang release, but in the meantime
> > the workaround helps us build cleanly with existing releases.
>
> The original code read better.
>
> This is kinda a gross solution that should probably be
> commented on in the code rather than just the commit message.

I'll just wait for the fix in llvm then and filter out the objtool warnings
from my build logs.

      Arnd
