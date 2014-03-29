From: dE <de.techno@gmail.com>
Subject: Re: ACL support.
Date: Sat, 29 Mar 2014 09:12:23 +0530
Message-ID: <5336411F.6080500@gmail.com>
References: <5332645E.4070600@gmail.com> <5332AD40.1020308@gmail.com> <5332F56A.2030506@gmail.com> <5332F9E9.5050905@gmail.com> <533303EC.6020100@gmail.com> <53330886.30506@gmail.com> <533441EE.4060107@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=20yOeKcTeAEjLKj6W3aXPBkfPdZ3eVTlxCgDWGXRpzI=;
        b=fDrG55p8ikRdkcgEQjSN833W9uCbh6ZW0rsUW6D3J4uLunw1K7Pn9TuAtm8uvW/7FQ
         oHx09PofaY4CkHZtAVpQSz/BjKd4MBGE2o6HsGV05RV9AKOOfSvgitXy+dO3S76qx2Ed
         u33yyZIIjwcU2wfifgV3tMvGMA3UnUT4Djw1OU0enJQbnUec40sBK3hFSGbf+muw1aOI
         TXV0QKzW80/H44hFeLVSb3fWN9uNutmEZ1Da6nLP7ezTsABwCARr8lQid6Z3gYgzTW/H
         fL1E/1d4d6Rm0kdYICfl2NnhEF+x/uEEj0/0HD+HFSXa9I9pEE6wU/yuzMZ0aIUElqAd
         cs7A==
In-Reply-To: <533441EE.4060107@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 03/27/14 20:51, dE wrote:
> On 03/26/14 22:34, Edward Shishkin wrote:
>> On 03/26/2014 05:44 PM, dE wrote:
>>> On 03/26/14 21:31, Edward Shishkin wrote:
>>>> On 03/26/2014 04:42 PM, dE wrote:
>>>>> On 03/26/14 16:04, Edward Shishkin wrote:
>>>>>> On 03/26/2014 06:23 AM, dE wrote:
>>>>>>> Does reiser4 support ACL?
>>>>>>
>>>>>> Nope for historical reasons.
>>>>>> I'll provide hints how to implement this, if someone wants..
>>>>>>
>>>>>> Edward.
>>>>>
>>>>> Thanks for the response.
>>>>>
>>>>> I was just asking for educational purposes (my home dir recedes on 
>>>>> reiser4).
>>>>>
>>>>> And yes -- I got a major bug to report which cause FF to crash. 
>>>>> Duplicating ~/.firefox solved the problem. I've the bad ~/.firefox.
>>>>>
>>>>> What do I have to do to report the problem?
>>>>
>>>> 1) "bad" means what?
>>>> 2) any kernel complaints?
>>>> 3) results of checking the partition with fsck.reiser4
>>>> 4) Is it possible to reproduce the problem?
>>>>
>>>> Thanks,
>>>> Edward.
>>>
>>> I started having problems with FF which was diagnosed to contents of 
>>> ~/.firefox.
>>
>> Which kernel version?
>> Do you use the new reiser4 transaction models announced not so long ago?
>>
>>> So renamed it to ~/.firefox_bad and copied ~/.firefox_bad to 
>>> ~/.firefox to solve the problem.
>>>
>>> So I still have ~/.firefox_bad; this problem occurred twice, and I 
>>> have both of the ~/.firefox_bad
>>>
>>> Yes -- the kernel showed a backtrace from some reiser4 sources.
>>
>> Could you send it, if possible?
>>
>> Thanks,
>> Edward.
>>
>>>
>>> fsck.reiser4 was done -- nothing was wrong.
>>>
>>> Yes -- I have the ~/.firefox_bad just for the purpose of bug reporting.
>>
>
> Kernel is 3.8.5. So no, it's an old one.
>
> Yes, I'll send the bt. Wait.

Ok, I've realized the mailing list software rejected the mail silently.
