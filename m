From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Mon, 19 Aug 2002 15:14:12 +0400
Message-ID: <3D60D304.3090508@namesys.com>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com> <20020819142035.A5741@namesys.com> <3D60C82F.1080403@namesys.com> <20020819144046.A6258@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com, god@namesys.com, mason <mason@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Mon, Aug 19, 2002 at 02:27:59PM +0400, Hans Reiser wrote:
>
>  
>
>>>>that you are using it everytime you find it though, that way if a 
>>>>different sysadmin is running fsck, they can know why not all the blocks 
>>>>they expect to be there are accessible.
>>>>        
>>>>
>>>Having some config files for this purpose is not good.
>>>What if I have booted from rescue disk?
>>>      
>>>
>>That is why it is only the DEFAULT location, and (slight improvement 
>>here) the user is prompted about whether to use it.
>>    
>>
>
>This is still too error prone, I think it is better to have this info on FS.
>
How does that make it less error prone?  It sounds like more complex 
code to me, especially considering that in the worst case the user 
reruns badblocks to generate the data again.

>(this does not destroy ability of externally specifying other source of list of
>bad blocks of course).
>And we may ask user whenever to use this info from FS if detected, too.
>
>Bye,
>    Oleg
>
>
>  
>



