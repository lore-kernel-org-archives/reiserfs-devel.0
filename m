From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Wed, 19 Feb 2003 01:18:21 +0300
Message-ID: <3E52B12D.2040009@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <200302151600.35675.vitaly@namesys.com> <3E528EA1.60604@namesys.com> <200302182305.08021.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12830-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302182305.08021.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>>>If fix-fixable finds fatal corruptions it sets FS_FATAL what means that
>>>the second run of fix-fixable will not help to avoid another fsck run at
>>>the next boot.
>>>      
>>>
>>Can you repeat what you said (more clearly).
>>    
>>
>
>If fs was not fixed, you do not want to have another run of fsck at 
>the next boot. you already know that there are fatal corruptions and
>you need to run rebuild-tree manually. So a special flag saying that 
>would be helpful.
>
>  
>
ok, along with special messages clearly explaining it to the user at 
each boot, yes?

-- 
Hans


