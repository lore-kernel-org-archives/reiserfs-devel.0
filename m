From: George Beshers <gbeshers@comcast.net>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 17 Aug 2004 15:29:32 -0400
Message-ID: <41225C9C.7050400@comcast.net>
References: <411FFCB4.2060400@namesys.com> <41201252.1080803@comcast.net> <412015D0.8030806@namesys.com> <41210FF5.7080605@comcast.net> <4121AEAA.8050008@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20358-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4121AEAA.8050008@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>



Hans Reiser wrote:

> George Beshers wrote:
>
>> We can't avoid it at some level without re-writing Linux security.  
>> Take a moment to consider
>> the set-UID bit on a file which is an executable and I think you will 
>> see what I am driving at.
>
>
> I don't see what you are saying.  Our mask does process oriented 
> security.  The underlying security remains a user/object/permission 
> mapping.
>
The issue is how the mask might change the semantics of sys_execve().  I 
have spent some time
starting to trace code around, but more work is required.

For the moment I think we are safe if the setuid and setgroup can not be 
altered by the mask.

We only change the semantics if the real/effective uid or gid is 
different at some point in the
processes execution because of the mask---begging situations where a 
call to setuid happens
only if a certain file is not available.

I want to get back to understanding your second proposed strategy.


>

