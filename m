From: Omry Yadan <omry_y@inter.net.il>
Subject: Re: does "reiserfsck --rebuild-sb" require free space?
Date: Mon, 06 Dec 2004 20:07:26 +0200
Message-ID: <41B49FDE.30506@inter.net.il>
References: <41B38E30.3060308@inter.net.il> <200412061852.53260.vitaly@namesys.com> <41B4872B.8050804@inter.net.il> <200412062010.36239.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22696-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200412062010.36239.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com


>>>you can free some space on the host reiserfs for now and write to the file
>>>should succeed then.
>>>      
>>>
>>Easier said than done, that file system has but one file, which is the
>>image.
>>the only wat to 'free' up some space from it is to truncate the end if
>>the image somehow.
>>    
>>
>
>btw, it would be not bad to 'reiserfsck --check' the host reiserfs also.
>
>  
>

I just did, it was reported to be clean. (no corruptions found).
