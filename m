From: Mark Salyzyn <salyzyn@android.com>
Subject: Re: [PATCH v7] Add flags option to get xattr method paired to
 __vfs_getxattr
Date: Tue, 27 Aug 2019 07:54:44 -0700
Message-ID: <8468b22d-05b7-47d3-eb93-2c71dafea3ee@android.com>
References: <20190820180716.129882-1-salyzyn@android.com>
 <20190827141952.GB10098@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ygGLW/f0qMrXyVPR5YGqyXHR0u2nMSk6t+VNUIbJ+Ts=; b=gKKKIJ+SStxap37J8a2wcFjNk
	qqLk/w9AHhRMYu5EQ1zrcXuqRJInBLbEyy/2uTluze2VYyZq8ijIuUpZgcSFPs5WXlYbgZbPamTb4
	XFYsTTRgUkFRQbqJWdB4+fLwTSmfFYZgTC2MTkJPuwE+hN0yE6JbiDvIAi6xbWw8CSvagc3npzG9J
	I9ldbDfZ6IQgxNX6yEs3Q4WOiItpzE0Lcic3SbPSM4mSgHbPIGrQKIADkZ2Lrjhft/dsnVlVSS0HC
	o6YK5Fzrlk1zSlWYm6NtWfDKotds8KjzL3R8cU9AD4KUmArGTpKzlDZgaMlOm/vNtS5qF42kYfm4L
	Hw0yxGi6g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J0PyrXbgy2rQbHf32v3WQfO8h7H5WwZ0x8ImHOimCWs=;
 b=mzwUwotHCHLyC8kvJQKX2qfkclXUibOZVKlCSAmub430gCcW4lmMANVBjk4ZJn37Mz
 lmwqaekfvRnk91fWBTPe9MdR6DNIOZYbn1kKQlCtB2EIRUw9eVK89gLHZxbOnS+BoN9O
 z/e+lec1c3V+A/cevmzn6YhUNeV1qLcxR5P5ZMIEm0QeC99vQIqrptkzAecOAow3P+WG
 qTbXtfhvLGsZsqUEkNrN67J91EYh7XB3OB1b7OQP26/5Ffe7WcOAgQyPgjx4Kr7W8Oc+
 UwQjFeNzqy6bSLsp44PwvDCnhYQ/gCS2wppnuYUD4QcGMN8OxcAFpKCWSwZ+EWDarzDN
 vqDw==
In-Reply-To: <20190827141952.GB10098@quack2.suse.cz>
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
To: Jan Kara <jack@suse.cz>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Sandeen <sandeen@sandeen.net>, Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org, James Morris <jmorris@namei.org>, devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>, Joel Becker <jlbec@evilplan.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Mathieu Malaterre <malat@debian.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>, linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>, Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>, "Darrick J. Wong" <darrick.wong@oracle.com>, Hugh Dickins <hughd@googl>

On 8/27/19 7:19 AM, Jan Kara wrote:
> On Tue 20-08-19 11:06:48, Mark Salyzyn wrote:
>> diff --git a/Documentation/filesystems/Locking b/Documentation/filesystems/Locking
>> index 204dd3ea36bb..e2687f21c7d6 100644
>> --- a/Documentation/filesystems/Locking
>> +++ b/Documentation/filesystems/Locking
>> @@ -101,12 +101,10 @@ of the locking scheme for directory operations.
>>   ----------------------- xattr_handler operations -----------------------
>>   prototypes:
>>   	bool (*list)(struct dentry *dentry);
>> -	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>> -		   struct inode *inode, const char *name, void *buffer,
>> -		   size_t size);
>> -	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>> -		   struct inode *inode, const char *name, const void *buffer,
>> -		   size_t size, int flags);
>> +	int (*get)(const struct xattr_handler *handler,
>> +		   struct xattr_gs_flags);
>> +	int (*set)(const struct xattr_handler *handler,
>> +		   struct xattr_gs_flags);
> The prototype here is really "struct xattr_gs_flags *args", isn't it?
> Otherwise feel free to add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>
>
> for the ext2, ext4, ocfs2, reiserfs, and the generic fs/* bits.
>
> 								Honza

<oops> Thanks and good catch, will respin with a fix to the 
documentation shortly.

-- Mark


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
