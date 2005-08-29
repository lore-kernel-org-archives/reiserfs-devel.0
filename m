From: Ric Wheeler <ric@emc.com>
Subject: Re: fsync performance of reiser 4
Date: Mon, 29 Aug 2005 08:32:44 -0400
Message-ID: <4313006C.9040502@emc.com>
References: <3257ddd0050825050117ead2ba@mail.gmail.com> <430DC64D.9010205@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430DC64D.9010205@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Sandeep Tyagi <sandeepktyagi@gmail.com>, reiserfs-list@namesys.com


I have a file system benchmark that we use to measure synchronous file 
writing using different synch techniques.

I will be happy to share it if there is interest,

Ric


Vladimir V. Saveliev wrote:

>Hello
>
>Sandeep Tyagi wrote:
>  
>
>>Hi -
>>Does anybody any idea whether reiserfs people are working on improvement
>>of fsync performance of Reiser 4.
>>    
>>
>
>do you have any measurements already?
>
>  
>
>>We have an application in which we use lot of fsyncs so we are planning
>>to Reiser 4 if it gives good performance with fsync.
>>Thanks
>>
>>-- 
>>-----------
>>S K T
>>-----------
>>    
>>
>
>  
>
