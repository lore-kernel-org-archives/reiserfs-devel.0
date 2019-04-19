From: Bharath Vedartham <linux.bhar@gmail.com>
Subject: Re: [PATCH] reiserfs: Force type conversion in xattr_hash
Date: Fri, 19 Apr 2019 11:38:33 +0530
Message-ID: <20190419060833.GA12013@bharath12345-Inspiron-5559>
References: <20190417115200.GA10168@bharath12345-Inspiron-5559>
 <20190418155019.ab5189e4e317df2b36861012@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MgFyOcp2C6jgy7Lz89llahOuUjcJJYSlyTA+A/9dTPk=;
        b=JlUJPs6CqaYJa0zgvp4/ofyzJInpUBDZAl5aQhaXYDvKua79VAfhrNK+U27aaw8wDX
         sOYuQ8nfd0Gbz29ZNpZwYgXLWcDdVJRII6s8TIwgAZK7XskVp04evNXuu+yk8pUHbH4t
         S/hHvgmj+U2jd7DPnCpSibKmT09wpyzVpLv0p7ZNETVHiqpyoo8PPYPjFrQQLULH/JxG
         wcckdwA7NtxTIX5h1E4lFHoKvND1tYFoT7OldOTwReo6A1OZ6SIFjW+LmZAmGrUzCJRI
         83sxQLN0eFKGj9hsPakvHdm3QXG5gP/98IlemGzaTtPIUGaNQ3s3GbhIpck/jpx3e3W8
         h+uQ==
Content-Disposition: inline
In-Reply-To: <20190418155019.ab5189e4e317df2b36861012@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: jannh@google.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 18, 2019 at 03:50:19PM -0700, Andrew Morton wrote:
> On Wed, 17 Apr 2019 17:22:00 +0530 Bharath Vedartham <linux.bhar@gmail.com> wrote:
> 
> > This patch fixes the sparse warning:
> > 
> > fs/reiserfs//xattr.c:453:28: warning: incorrect type in return
> > expression (different base types)
> > fs/reiserfs//xattr.c:453:28:    expected unsigned int
> > fs/reiserfs//xattr.c:453:28:    got restricted __wsum
> > fs/reiserfs//xattr.c:453:28: warning: incorrect type in return
> > expression (different base types)
> > fs/reiserfs//xattr.c:453:28:    expected unsigned int
> > fs/reiserfs//xattr.c:453:28:    got restricted __wsum
> > 
> > csum_partial returns restricted integer __wsum whereas xattr_hash
> > expects a return type of __u32.
> > 
> > ...
> >
> > --- a/fs/reiserfs/xattr.c
> > +++ b/fs/reiserfs/xattr.c
> > @@ -450,7 +450,7 @@ static struct page *reiserfs_get_page(struct inode *dir, size_t n)
> >  
> >  static inline __u32 xattr_hash(const char *msg, int len)
> >  {
> > -	return csum_partial(msg, len, 0);
> > +	return (__force __u32)csum_partial(msg, len, 0);
> >  }
> >  
> >  int reiserfs_commit_write(struct file *f, struct page *page,
> 
> hm.  Conversion from int to __u32 should be OK - why is sparse being so
> picky here?
> 
> Why is the __force needed, btw?
The return type of csum_partial is __wsum which is a restricted integer
type.

__wsum is defined as:
typedef __u32 __bitwise __wsum;

Being a restricted integer type, sparse will complain whenever convert
the restricted type to another type without __force.

Interestingly enough if we look at the definition of csum_partial, more
specifically the first 2 lines:

__wsum csum_partial(const void *buff, int len, __wsum sum)
{
	unsigned long result = do_csum(buff, len);

	result += (__force u32)sum;
	
	.....

sum is of type __wsum, result is of type unsigned long. __force is used
to suppress the sparse warning.

Thanks for your time!
