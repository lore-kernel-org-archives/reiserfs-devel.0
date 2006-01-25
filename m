From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: stale dk warning
Date: Wed, 25 Jan 2006 15:17:12 +0300
Message-ID: <43D76C48.7060801@namesys.com>
References: <1137788919.22212.7.camel@gentoo> <1138004980.6165.11.camel@tribesman.namesys.com> <43D49AFC.3000807@namesys.com> <43D49B4C.5080406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27859-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43D49B4C.5080406@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>, "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Alexander Zarochentcev <zam@namesys.com>, reiserfs-list@namesys.com

Hello,

shouldnt we also remove the warning [nikita-33281] ?

Jan 25 14:48:29 bones kernel: <4>reiser4[ent:hda8!(5047)]: 
capture_anonymous_jno
des (fs/reiser4/plugin/file/file.c:1348)[nikita-33281]:
Jan 25 14:48:29 bones kernel: WARNING: anonymous jnode in writeback: 
(69954 2216
63)
Jan 25 14:48:29 bones kernel:
Jan 25 14:48:29 bones kernel: <4>reiser4[ent:hda8!(5047)]: 
capture_anonymous_jno
des (fs/reiser4/plugin/file/file.c:1348)[nikita-33281]:
Jan 25 14:48:29 bones kernel: WARNING: anonymous jnode in writeback: 
(69954 2216
64)

Thanks,
Lena


Hans Reiser wrote:

>Hans Reiser wrote:
>
>  
>
>>Vladimir V. Saveliev wrote:
>>
>> 
>>
>>    
>>
>>>Hello
>>>
>>>On Fri, 2006-01-20 at 14:28 -0600, Jake Maciejewski wrote:
>>>
>>>
>>>   
>>>
>>>      
>>>
>>>>In addition to the disable write barrier warning reported by Louis-David
>>>>Mitterrand on January 10th, with 2.6.15-1 I'm getting:
>>>>      
>>>>      <4>reiser4[dd(25448)]: update_stale_dk (fs/reiser4/search.c:1363)[nikita-38210]:
>>>>      WARNING: stale dk
>>>>      
>>>>The process varies. I've also seen the stale dk warning triggered by rsync and rm.
>>>>
>>>>  
>>>>
>>>>     
>>>>
>>>>        
>>>>
>>>This is harmless. I think we should remove this warning as well as the
>>>one about write barrier.
>>>
>>>
>>>
>>>
>>>
>>>   
>>>
>>>      
>>>
>>Zam said he would change it
>>
>>    
>>
>by "it" I refer to the write barrier warning, sorry for my imprecision....
>
>  
>
>>to a notice.  Zam, what happened to the patch?
>>
>>
>> 
>>
>>    
>>
>
>
>
>  
>

