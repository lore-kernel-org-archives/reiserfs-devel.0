From: Hans Reiser <reiser@namesys.com>
Subject: Re: v4 transaction design
Date: Wed, 11 Sep 2002 15:16:00 +0400
Message-ID: <3D7F25F0.6080302@namesys.com>
References: <EGECJPMPCPJFHJIBBCJMEEFCCKAA.Tobias.Oberstein@gmx.de>		<3D7C8140.3070703@namesys.com> <15740.34094.893342.451668@laputa.namesys.com> <3D7F21E8.B7149634@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Cc: Nikita Danilov <Nikita@namesys.com>, Tobias Oberstein <Tobias.Oberstein@gmx.de>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Xuan Baldauf wrote:

>Nikita Danilov wrote:
>
>  
>
>>
>>Because we don't currently support isolation, isolation levels are not
>>exactly meaningful. But yes, one thread T1 can read data modified by
>>another thread T2 that hasn't yet committed, but at that moment "atom"
>>associated with T1 will "fuse" with atom of T2, so that they will either
>>commit of fail -both-.
>>
You should mention that we will support isolation, but we won't work on 
that until after Halloween.

>>    
>>
>
>So this is an implicit join of transactions. How do you ensure that livelocks do
>not happen, i.e. that T1 fails due to T2, and T2 also fails because it joined T1,
>and that thus a retry would make T1 with T2 fail again...?
>
We don't.  Think of what we are doing as taking the traditional 
journaling filesystem approach of not allowing rollback except in 
response to crashes, and only allowing trusted plugins to use 
transactions.  Then understand that we will add isolation and a user API 
later after the code we have is debugged.

Hans

