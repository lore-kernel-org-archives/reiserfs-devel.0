From: Yury Umanets <umka@namesys.com>
Subject: Re: aal_assert()
Date: Fri, 10 Jan 2003 17:12:30 +0300
Message-ID: <3E1ED4CE.2010104@namesys.com>
References: <20021231005440.GA1573@gnu.org> <3E1E74C3.8050707@namesys.com> <20030110133657.GE1056@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030110133657.GE1056@gnu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Clausen <clausen@gnu.org>
Cc: reiserfs-list@namesys.com

Andrew Clausen wrote:

>On Fri, Jan 10, 2003 at 10:22:43AM +0300, Yura Umanets wrote:
>  
>
>>Actually there was the code earlier like you have proposed. And it was 
>>changed to the current state due to the following reasons:
>>
>>* there are two developers working on reiser4progs currentry (Vitaly 
>>Fertman and Yury Umanets). And our parts is much different. So, each of 
>>us should work on own code.
>>* there is not neccessary an assertion is corect and only the author can 
>>decide is it correct.
>>    
>>
>
>Well, that decision is made by the developers, not the users.
>
Decision is made by developers in debug and test stage.

>Presumebly, you know who wrote what code.  If an assertion is
>contentious (and 99.9% of them aren't), you should document *why*,
>anyway.
>
I should document why an assert is contentious? I think there should not 
exist contentious assersions. Assertion is correct or not.

>
>  
>
>>* NAMESYS has some development policies. And hints is the one of them.
>>    
>>
>
>Why?
>
I don't know :)) Probably Nikita will tell you better. Hi is the old 
resident of NAMESYS.

>
>Cheers,
>Andrew
>
>
>
>  
>


-- 
Yury Umanets


