From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 3/3] [v2] reiserfs: remove obsolete print_time function
Date: Wed, 20 Jun 2018 16:38:05 +0200
Message-ID: <20180620143805.2pfhuy4tm5lc66tr@quack2.suse.cz>
References: <20180620142522.27639-1-arnd@arndb.de>
 <20180620142522.27639-3-arnd@arndb.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180620142522.27639-3-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, y2038@lists.linaro.org, Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed 20-06-18 16:25:04, Arnd Bergmann wrote:
> Before linux-2.4.6, print_time() was used to pretty-print an inode
> time when running reiserfs in user space, after that it has become
> obsolete and is still a bit incorrect: It behaves differently on 32-bit
> and 64-bit machines, and uses a static buffer to hold a string, which
> could lead to undefined behavior if we ever called this from multiple
> places simultaneously.
> 
> Since we always want to treat the timestamps as 'unsigned' anyway,
> simply printing them as an integer is both simpler and safer while
> avoiding the deprecated time_t type.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: after a second look, I decided to remove it instead of fixing it.

Yes, that's a good idea. The patch looks good. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
