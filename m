From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: Reiser4 can't compile glibc
Date: Tue, 13 Apr 2004 20:54:21 -0500
Message-ID: <407C99CD.5060205@mrs.umn.edu>
References: <Pine.LNX.4.21.0404121740250.13254-100000@mlf.linux.rulez.org> <1081866113.1538.45.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081866113.1538.45.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Thanks. I put on that patch and it fixes my make problem.

Vladimir Saveliev wrote:

>Hello
>
>On Mon, 2004-04-12 at 20:53, Szakacsits Szabolcs wrote:
>  
>
>>What timestamp resolution Reiser4 has? Ext[23] can't compile gcc because
>>[kernel bugs] and it doesn't have on-disk high resolution timestamps
>>thus the dependency during compilation breaks.
>>
>>But somehow I doubt this would be the case, all modernish filesystem
>>designed in the last 10 years has at least nanosec resolution.
>>
>>    
>>
>yes, reiser4 by default has the same time resolution as ext[23] and
>reiserfs.
>However, I think that i found the problem already. The attached patch
>for fs/reiser4/plugin/item/tail.c should help.
>
>
>  
>
>>	Szaka
>>
>>
>>    
>>
>>------------------------------------------------------------------------
>>
>>--- tail.c~	2004-04-13 18:18:52.000000000 +0400
>>+++ tail.c	2004-04-13 18:20:14.000000000 +0400
>>@@ -463,12 +463,18 @@
>> 	}
>> 
>> 	inode = mapping->host;
>>-	if (get_key_offset(&f->key) > inode->i_size)
>>+	if (get_key_offset(&f->key) > inode->i_size) {
>>+		assert("vs-1649", f->user == 1);
>> 		INODE_SET_FIELD(inode, i_size, get_key_offset(&f->key));
>>-	inode->i_ctime = inode->i_mtime = CURRENT_TIME;
>>-	result = reiser4_update_sd(inode);
>>-	if (result)
>>-		return result;
>>+	}
>>+	if (f->user != 0) {
>>+		/* this was writing data from user space. Update timestamps, therefore. Othrewise, this is tail
>>+		   conversion where we should not update timestamps */
>>+		inode->i_ctime = inode->i_mtime = CURRENT_TIME;
>>+		result = reiser4_update_sd(inode);
>>+		if (result)
>>+			return result;
>>+	}
>> 
>> 	/* FIXME-VS: this is temporary: the problem is that bdp takes inodes
>> 	   from sb's dirty list and it looks like nobody puts there inodes of
>>    
>>

