From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 17 Aug 2004 13:28:00 -0700
Message-ID: <41226A50.3010609@namesys.com>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com> <41210FF5.7080605@comcast.net> <4121AEAA.8050008@namesys.com> <41225C9C.7050400@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20361-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41225C9C.7050400@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
>
> Hans Reiser wrote:
>
>> George Beshers wrote:
>>
>>> We can't avoid it at some level without re-writing Linux security.  
>>> Take a moment to consider
>>> the set-UID bit on a file which is an executable and I think you 
>>> will see what I am driving at.
>>
>>
>>
>> I don't see what you are saying.  Our mask does process oriented 
>> security.  The underlying security remains a user/object/permission 
>> mapping.
>>
> The issue is how the mask might change the semantics of sys_execve().  
> I have spent some time
> starting to trace code around, but more work is required.
>
> For the moment I think we are safe if the setuid and setgroup can not 
> be altered by the mask.

Ok.

>
> We only change the semantics if the real/effective uid or gid is 
> different at some point in the
> processes execution because of the mask---begging situations where a 
> call to setuid happens
> only if a certain file is not available.

Say more.

>
> I want to get back to understanding your second proposed strategy.
>
>
>>
>
>
>

