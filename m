From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] reiserfs: Force type conversion in xattr_hash
Date: Thu, 18 Apr 2019 15:50:19 -0700
Message-ID: <20190418155019.ab5189e4e317df2b36861012@linux-foundation.org>
References: <20190417115200.GA10168@bharath12345-Inspiron-5559>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190417115200.GA10168@bharath12345-Inspiron-5559>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bharath Vedartham <linux.bhar@gmail.com>
Cc: jannh@google.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 17 Apr 2019 17:22:00 +0530 Bharath Vedartham <linux.bhar@gmail.com> wrote:

> This patch fixes the sparse warning:
> 
> fs/reiserfs//xattr.c:453:28: warning: incorrect type in return
> expression (different base types)
> fs/reiserfs//xattr.c:453:28:    expected unsigned int
> fs/reiserfs//xattr.c:453:28:    got restricted __wsum
> fs/reiserfs//xattr.c:453:28: warning: incorrect type in return
> expression (different base types)
> fs/reiserfs//xattr.c:453:28:    expected unsigned int
> fs/reiserfs//xattr.c:453:28:    got restricted __wsum
> 
> csum_partial returns restricted integer __wsum whereas xattr_hash
> expects a return type of __u32.
> 
> ...
>
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -450,7 +450,7 @@ static struct page *reiserfs_get_page(struct inode *dir, size_t n)
>  
>  static inline __u32 xattr_hash(const char *msg, int len)
>  {
> -	return csum_partial(msg, len, 0);
> +	return (__force __u32)csum_partial(msg, len, 0);
>  }
>  
>  int reiserfs_commit_write(struct file *f, struct page *page,

hm.  Conversion from int to __u32 should be OK - why is sparse being so
picky here?

Why is the __force needed, btw?
