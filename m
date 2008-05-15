From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: reiserfs BUG in 2.6.26-rc2-mm1
Date: Wed, 14 May 2008 17:00:54 -0700
Message-ID: <20080514170054.56deb9df.akpm@linux-foundation.org>
References: <482B7AC0.2050800@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <482B7AC0.2050800@oracle.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed, 14 May 2008 16:50:24 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> This is blocksize=1024 bytes, data=ordered.
> 
> On x86_64.
> 
> ------------[ cut here ]------------
> kernel BUG at fs/reiserfs/journal.c:1414!

yup, Jeff had a whoopsie.  Should be mended by
ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.26-rc2/2.6.26-rc2-mm1/hot-fixes/reiserfs-convert-j_flush_sem-to-mutex-fix.patch
