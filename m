From: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH] Add flags option to get xattr method paired to
 __vfs_getxattr
Date: Thu, 15 Aug 2019 14:26:46 -0700
Message-ID: <69889dec-5440-1472-ed57-380f45547581@android.com>
References: <20190812193320.200472-1-salyzyn@android.com>
 <20190813084801.GA972@kroah.com>
 <alpine.LRH.2.21.1908160515130.12729@namei.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HBoy+zuAQWKK47e4Kuw+WRqTexmQ2/yONTzHU6pauvM=; b=BEyuIiNuEsFrrmdwx4vA7ZMrH
	VwcIvjYkzzJ1st5P/BasI8gbpb1qJO3LkFmbeEwCRJ9zJUSWr37RGFHNboe+GeZqoc3pWeXdDj0lI
	2ODnVvcVXi1aJp9D1ANbfbjKc9O5RNSIhvGFAFKDMiwgqNc3Bl34Rggdx0JE7M62+GhEviYKzNKZW
	xj7YiSPcITu4fT8tNoU8V9brnOJ7ou5gBxVpTIoLRICYDJUGMFf7DqajCaS+WUhRaWKI0eLvsjdQJ
	GSJA2fjJYkUGzuMzAcAzJ8P1yoUJb1+exHOWGNsi5FrRNuktEOPDruFg4aBKJ452XuAYuGFsfc3L2
	K3oKkexOg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NQPI89pyKynFZwWztDWLjrPNlq9e9KFjYiijpvVD82o=;
 b=lIpZ0g9DtDyqIqk3Pk+f3LAbBb1IHJR/OqcvIqSvHq+yBEN7osFWEACcZH+FVTGAN+
 z81fgESdI7fNhc3JgTo9dRJMBztkRx79bvkDfp3/xi9bZurWt2357qZZo4tFW7M0y0Ej
 A6uvlorCTKMuc3kR41qxmYDng3wbRM+BG0tiDg042ULiVNZsJKa0xmpkuCsfDllwdR+e
 dG4DrPqiLG1FI9UfDGP54YpE2IKITme3NrNG9h5Xx1BAmyChoM9PJ99fCCQ/KwOPT9he
 yumEroYrkBe4fkJ0BYuWZmThYwe0QxWcBl+TbCtzexrk33BB01Ff8hxY8VdTWES/ELDc
 HaRQ==
In-Reply-To: <alpine.LRH.2.21.1908160515130.12729@namei.org>
Content-Language: en-GB
List-Id: <reiserfs-devel.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: James Morris <jmorris@namei.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net, linux-integrity@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org, Dominique Martinet <asmadeus@codewreck.org>, Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>, linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>, Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>, netdev@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>, Hugh

On 8/15/19 12:20 PM, James Morris wrote:
> On Tue, 13 Aug 2019, Greg Kroah-Hartman wrote:
>
>> On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
>>> --- a/include/linux/xattr.h
>>> +++ b/include/linux/xattr.h
>>> @@ -30,10 +30,10 @@ struct xattr_handler {
>>>   	const char *prefix;
>>>   	int flags;      /* fs private flags */
>>>   	bool (*list)(struct dentry *dentry);
>>> -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
>>> +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>>>   		   struct inode *inode, const char *name, void *buffer,
>>> -		   size_t size);
>>> -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
>>> +		   size_t size, int flags);
>>> +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>>>   		   struct inode *inode, const char *name, const void *buffer,
>>>   		   size_t size, int flags);
>> Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
>> you get more then 5, a function becomes impossible to understand?
>>
>> Surely this could be a structure passed in here somehow, that way when
>> you add the 8th argument in the future, you don't have to change
>> everything yet again?  :)
>>
>> I don't have anything concrete to offer as a replacement fix for this,
>> but to me this just feels really wrong...
> How about something like:
>
> struct xattr_gs_args {
> 	struct dentry *dentry;
> 	struct inode *inode;
> 	const char *name;
> 	const void *buffer;
> 	size_t size;
> 	int flags;
> };
>
> int (*get)(const struct xattr_handler *handler, struct xattr_gs_args *args);
> int (*set)(const struct xattr_handler *handler, struct xattr_gs_args *args);
>
Good Idea, but using the same argument structure for set and get I would 
be concerned about the loss of compiler protection for the buffer 
argument; it is void* for get, and const void* for set. And if we pulled 
out buffer (and size since it is paired with it) from the structure to 
solve, the 'mixed' argument approach (resulting in 4 args) adds to the 
difficulty/complexity.

Good news is the same structure(s) can get passed to __vfs_getxattr and 
__vfs_setxattr, so one less issue with getting the argument order 
correct from the caller.

 From an optimization standpoint, passing an argument to a pointer to a 
structure assembled on the stack constrains the compiler. Whereas 
individual arguments allow for the optimization to place all the 
arguments into registers. All modern processors have no issue with tens 
of arguments.

So, I will look into what the patch set will look like by splitting into 
set and get, and trying to reuse the structure down the call chain.

struct getxattr_args {
	struct dentry *dentry;
	struct inode *inode;
	const char *name;
	void *buffer;
	size_t size;
	int flags;
};

struct setxattr_args {
	struct dentry *dentry;
	struct inode *inode;
	const char *name;
	const void *buffer;
	size_t size;
	int flags;
};

-- Mark




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
