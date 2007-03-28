From: Ignatich <ignatich@gmail.com>
Subject: Re: reiser4: reserved disk space
Date: Wed, 28 Mar 2007 19:13:37 +0400
Message-ID: <460A8621.4030709@gmail.com>
References: <460A5F9A.6070902@gmail.com> <460A74E1.9000703@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
        b=qe8k0p6zmlw1Jbsao5lRt7JsVLV6JoluoTMU6oCxyknpGsqtNbVzgH6f24+f5HgyTudu5SnT5EeNC/e/7/CWLoBNtEDtRyZ1dy+fmGubWoiusJPh6NICVUDJJiuTyoqWj1umDc7QgRxqd23KLzwmLsJSz/s/WRqqTdJvvtJeBgk=
In-Reply-To: <460A74E1.9000703@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello Edward,

Thank you for explanation. I'm still not convinced though. Cryptcompress 
is indeed awesome, but that doesn't change the fact that reserved block 
calculation can be improved. 5% of modern 500GB drive is 25GB and I 
can't see how that space will ever be used even if I will delete 
thousands of files. There is no point in reserving disk space if it will 
never be used. There are many ways to improve this situation: a upper 
and lower limit for reserved block count can be used, ability to 
manually set reserve can be added to mkfs or perhaps reserve usage 
patterns for various workloads can be analyzed and smarter algorithm can 
be developed.

Can you suggest how to simulate workload that will expose reserve block 
starvation?

Looking forward to your reply,
    Max Yudin
