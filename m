From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
 values = 0
Date: Mon, 19 Aug 2002 17:29:48 +0400
Message-ID: <3D60F2CC.7030806@namesys.com>
References: <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com> <20020819142035.A5741@namesys.com> <3D60C82F.1080403@namesys.com> <20020819144046.A6258@namesys.com> <3D60D304.3090508@namesys.com> <20020819152002.A6682@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11239-reiserfs=m.gmane.org@namesys.com>
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
>On Mon, Aug 19, 2002 at 03:14:12PM +0400, Hans Reiser wrote:
>  
>
>>>>>>that you are using it everytime you find it though, that way if a 
>>>>>>different sysadmin is running fsck, they can know why not all the blocks 
>>>>>>they expect to be there are accessible.
>>>>>>            
>>>>>>
>>>>>Having some config files for this purpose is not good.
>>>>>What if I have booted from rescue disk?
>>>>>          
>>>>>
>>>>That is why it is only the DEFAULT location, and (slight improvement 
>>>>here) the user is prompted about whether to use it.
>>>>        
>>>>
>>>This is still too error prone, I think it is better to have this info on 
>>>FS.
>>>      
>>>
>>How does that make it less error prone?  It sounds like more complex 
>>code to me, especially considering that in the worst case the user 
>>reruns badblocks to generate the data again.
>>    
>>
>
>Less error prone in the sence that the data is contained within FS itself, so
>the only way to get it wrong is FS corruption due to HW problems/kernel bug.
>
>If we only rely on expernal source, user might forget to specify this file
>(or simply he can be unaware that there is such a file) and all bad blocks
>would be marked as free to use, wrong list of bad blocks might be specified
>and so on.
>
>Bye,
>    Oleg
>
>
>  
>
I want it to use /etc/badblocks file if it exists, and if it uses then 
tell the user it is using it.  The user may also specify a file to use 
on the commandline.  Whether the user uses a file he specifies instead 
of /etc/badblocks is up to the user.


