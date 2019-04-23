From: Bharath Vedartham <linux.bhar@gmail.com>
Subject: Re: [PATCH] reiserfs: Add comment to explain endianness issue in
 xattr_hash
Date: Tue, 23 Apr 2019 21:50:45 +0530
Message-ID: <20190423162045.GA15509@bharath12345-Inspiron-5559>
References: <20190423161831.GA15387@bharath12345-Inspiron-5559>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RITjfCM/Fak6Gm6jLLNcOvzNIx+YHi5oeUMpgO8y9jY=;
        b=R7irfG7f/p76B0rFKLBRyyDlIYiyMMbGwFsbZDfS4LTP1pV+NERE2mF0UykwJZr+21
         Rr9Uft50P4MPwWUw97hhHaKWgbZhZ36+16nXX62mI806Fu82P8KoQ7aiaEF2lp1J2Ojn
         VzQLHrMfX3dFx3dJwIeTi2sRfrzxMfN2LZT+KPPpZaU22SULINr9DDjI8lJu7gfgb/VK
         Std4YfrCHYTkBnXw+Ty3zJZFpnCGdupxnmKTpNDW/PC20J4Z0sK4UgjqSAm+81cNsUM/
         RUAivKxgBe5YNjhFKeLmQ2hiQbYihe7HzX0sp+R9A9OXFkFOi56xHD53T/CaLlhsJR6w
         6mzg==
Content-Disposition: inline
In-Reply-To: <20190423161831.GA15387@bharath12345-Inspiron-5559>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, viro@zeniv.linux.org.uk
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Tue, Apr 23, 2019 at 09:48:31PM +0530, Bharath Vedartham wrote:
> csum_partial() gives different results for little-endian and big-endian
> hosts. This causes images created on little-endian hosts and mounted on
> big endian hosts to see csum mismatches. This causes an endianness bug.
> Sparse gives a warning as csum_partial returns a restricted integer type
> __wsum_t and xattr_hash expects __u32. This warning acts as a reminder
> for this bug and should not be suppressed.
> 
> This comment aims to convey these endianness issues.
> 
> Signed-off-by: Bharath Vedartham <linux.bhar@gmail.com>
> ---
>  fs/reiserfs/xattr.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index 32d8986..0ea6654 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -450,6 +450,16 @@ static struct page *reiserfs_get_page(struct inode *dir, size_t n)
>  
>  static inline __u32 xattr_hash(const char *msg, int len)
>  {
> +	/*
> +	 * csum_partial() gives different results for little-endian and
> +	 * big endian hosts. Images created on little-endian hosts and
> +	 * mounted on big-endian hosts(and vice versa) will see csum mismatches
> +	 * when trying to fetch xattrs. Treating the hash as __wsum_t would
> +	 * lower the frequency of mismatch. This is an endianness bug in reiserfs.
> +	 * The return statement would result in a sparse warning. Do not fix the sparse
> +	 * warning so as to not hide the reminder of the bug.
> +	 */
> +
>  	return csum_partial(msg, len, 0);
>  }
>  
> -- 
> 2.7.4
>

Is this good or is it lacking any explanation?
