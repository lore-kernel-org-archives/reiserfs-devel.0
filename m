From: Eriberto <eriberto@eriberto.pro.br>
Subject: Re: Space lost?
Date: Sat, 07 Jan 2006 03:48:27 -0200
Message-ID: <43BF562B.1030908@eriberto.pro.br>
References: <43BF4857.8070901@eriberto.pro.br> <3405.66.131.16.74.1136610974.squirrel@x2a.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27611-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3405.66.131.16.74.1136610974.squirrel@x2a.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Ok. But the 32 MB is deducted from total space (df command)...

Jonathan Bastien-Filiatrault escreveu:

>Eriberto said:
>  
>
>>I have a partition with 19.535.040 KB (fdisk -l). However after a
>>ReiserFS formatting df -k command shows 19.534.436 KB (total space). The
>>difference is 604 KB. Why the amount of  space decreased after formatting?
>>    
>>
>Any filesystem has sturctural overhead. For example, by default, ReiserFS
>has a 32MB journal and other data structures. These data structures are
>
>
>  
>
