From: Oliver Korpilla <okorpil@fh-landshut.de>
Subject: Re: Reiser4 and NFS
Date: Tue, 07 Sep 2004 16:18:49 +0200
Message-ID: <413DC349.6020505@fh-landshut.de>
References: <413C5DBA.1070207@fh-landshut.de>	 <1094543842.1340.61.camel@tribesman.namesys.com>	 <413D6BDC.80006@fh-landshut.de> <1094557437.1340.65.camel@tribesman.namesys.com>
Reply-To: okorpil@fh-landshut.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21571-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094557437.1340.65.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Compiling and installing the patch remotely while writing this, but I 
can test it with both client and server tomorrow, about 20 hrs from now. 
I'll let you know the results.

With kind regards,
Oliver Korpilla

Vladimir Saveliev wrote:

>>Either this is a NFSv3/Reiser4/2.6.8.1 server vs. NFSv3/2.4.21 client problem,
>>or it has something to do with endianness (PowerPC is big-endian, Intel P4 box
>>is little-endian). I know ext* has absolutely no issues with endianness, neither
>>as RAM disk nor over NFS, but perhaps Reiser4 has?
>>    
>>
>Yes, that could be a problem.
>Would you please try to patch reiser4/vfs_ops.c with the attached patch
>and let us know whether it makes any effect?
>
>  
>
>>===== vfs_ops.c 1.732 vs edited =====
>>--- 1.732/vfs_ops.c	2004-08-30 17:05:53 +04:00
>>+++ edited/vfs_ops.c	2004-09-07 15:38:55 +04:00
>>@@ -1564,12 +1564,16 @@
>> 	addr = (char *)data;
>> 
>> 	need = encode_inode_size(inode);
>>-	if (need < 0)
>>+	if (need < 0) {
>>+		printk("reiser4_encode_fh-1: need=%d\n", need);
>> 		return NFSERROR;
>>+	}
>> 	if (need_parent) {
>> 		delta = encode_inode_size(parent);
>>-		if (delta < 0)
>>+		if (delta < 0) {
>>+			printk("reiser4_encode_fh-2: delta=%d\n", delta);
>> 			return NFSERROR;
>>+		}
>> 		need += delta;
>> 	}
>> 
>>@@ -1584,9 +1588,11 @@
>> 		 * handle. */
>> 		*lenp = (need + sizeof(__u32) - 1) >> 2;
>> 		result = need_parent ? FH_WITH_PARENT : FH_WITHOUT_PARENT;
>>-	} else
>>+	} else {
>> 		/* no enough space in file handle */
>>+		printk("reiser4_encode_fh-3: need=%d, lenp=%d\n", need, *lenp);
>> 		result = NFSERROR;
>>+	}
>> 	reiser4_exit_context(&context);
>> 	return result;
>> }
>>    
>>

