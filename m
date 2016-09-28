From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Wed, 28 Sep 2016 12:17:46 +0200
Message-ID: <b2b6b412-6a80-37d3-0055-3fe84a195afd@gmail.com>
References: <57E6DF37.1050702@gmail.com>
 <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>
 <1474944195.1773.15.camel@intelfx.name>
 <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com>
 <1475001384.1609.2.camel@intelfx.name> <57EAE900.8060301@gmail.com>
 <1475013062.1621.5.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=CfbEPF/LiViofwrpdj5ZeGSERPjW9FRxLWJkGDwLJuk=;
        b=fsUbN/QzPpLZuH0D1D+xOU7gavRGQB2uFhsYEV5OA0dz+v3nGax5XJ4BNkwhzg45pK
         9ZhoaQoP0My8bRasPI8l4DGK5NjGH9dQUZbCH6Xg6f9IppdTchwqVn/zdkdZUlqt6uIl
         SDS61meTuikA2Uvd8L4Ies2LkpiShPU/bezb6oVd/jBGUFI+W03QxrMLODyRnJlfF5tg
         3bnKAUdjBWaejwTO016fuhY2vtxdsISdSb6aInNxj++u8Wh6Td08CVDBOLpuG63AW4MA
         /gPnFWueSGRN3hsKBge+EMD8yo5n0ho/3gTEgxpenFt/KWIluJSo6Xc3gQqz4ujDoxtA
         +9Pw==
In-Reply-To: <1475013062.1621.5.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 09/27/2016 11:51 PM, Ivan Shapovalov wrote:
> On 2016-09-27 at 23:47 +0200, Edward Shishkin wrote:
>> On 09/27/2016 08:36 PM, Ivan Shapovalov wrote:
>>> On 2016-09-27 at 16:13 +0200, Edward Shishkin wrote:
>>>> On 09/27/2016 04:43 AM, Ivan Shapovalov wrote:
>>>>> On 2016-09-27 at 00:37 +0200, Edward Shishkin wrote:
>>>>>> On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
>>>>>>> On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
>>>>>>>> Hello everyone,
>>>>>>>>
>>>>>>>> I have set up the updated Namesys repositories at my
>>>>>>>> Github
>>>>>>>> page.
>>>>>>>> Those repositories are supposed to contain the latest
>>>>>>>> updates
>>>>>>>> in
>>>>>>>> the (stable) master branch and in other (experimental)
>>>>>>>> branches
>>>>>>>> that
>>>>>>>> I'll announce.
>>>>>>>>
>>>>>>>> 1) https://github.com/edward6/reiser4
>>>>>>>>
>>>>>>>> This is a "standalone" reiser4 tree, which doesn't
>>>>>>>> include
>>>>>>>> specific
>>>>>>>> changes of Linux kernel needed for reiser4 port. Such
>>>>>>>> changes
>>>>>>>> can
>>>>>>>> be
>>>>>>>> found at the project's page on Sourceforge:
>>>>>>>> https://sourceforge.net/projects/reiser4/
>>>>>>>>
>>>>>>>> An example of work with the standalone reiser4 tree:
>>>>>>>>
>>>>>>>> . Patch the respective kernel with the latest available
>>>>>>>> stuff
>>>>>>>> from
>>>>>>>>        Sourceforge;
>>>>>>>> . cd to the "fs" directory;
>>>>>>>> . delete the directory reiser4;
>>>>>>>> . instead of the deleted stuff clone the standalone
>>>>>>>> reiser4
>>>>>>>>        repository from Github;
>>>>>>>> . build and install as usual.
>>>>>>>>
>>>>>>>> 2) Libaal and Reiser4progs:
>>>>>>>>
>>>>>>>> https://github.com/edward6/libaal
>>>>>>>> https://github.com/edward6/reiser4progs
>>>>>>>>
>>>>>>>> Before building Libaal and Reiser4progs execute the
>>>>>>>> ./prepare
>>>>>>>> script,
>>>>>>>> which will create files needed for build process.
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Edward.
>>>>>>> Wow, finally.
>>>>>>>
>>>>>>> Maybe we could avoid that "all changes for 10 years"
>>>>>>> commit?
>>>>>> Hi Ivan,
>>>>>> Sorry, don't have a time to granulate it.
>>>>>>
>>>>>>> I tried to keep track of all patches since 3.2...
>>>>>> There will be "all changes for 6 years" commit.
>>>>>> Is it much better?
>>>>> So well, I finished splitting off all known diffs from that big
>>>>> commit.
>>>>> Tt was 12k(+)/8k(-), now it is 7k(+)/7k(-).
>>>>>
>>>>> The updated branch is here: https://github.com/intelfx/reiser4
>>>>> (unfortunately, not fast-forward).
>>>>>
>>>>> Moreover, my tree has accumulated quite a few differences from
>>>>> your
>>>>> one. I've dropped trivial discrepancies (comments, formatting
>>>>> etc.)
>>>>> and put the larger ones in separate branches:
>>>>>
>>>>> 1. https://github.com/intelfx/reiser4/tree/differences/enotty
>>>>>       (unsupported ioctls return -ENOTTY, not -ENOSYS)
>>>>>
>>>>> 2. https://github.com/intelfx/reiser4/tree/differences/migratep
>>>>> age
>>>>>       (the ->migratepage() implementation, which I still do not
>>>>> completely
>>>>>        understand, but it works)
>>>>>
>>>>> 3. https://github.com/intelfx/reiser4/tree/differences/renameat
>>>>> 2
>>>>>       (renameat2(RENAME_NOREPLACE) implementation, which you
>>>>> haven't
>>>>>        merged somewhy)
>>>>>
>>>>> 4. https://github.com/intelfx/reiser4/tree/differences/adjust-t
>>>>> o-3.
>>>>> 15
>>>>>       (part of porting to 3.15 which, again, you haven't merged
>>>>> somewhy)
>>>>>
>>>>> These branches are on top of that granular "master".
>>>>> Anyway, please take a look.
>>>> It was definitely useful work,
>>>> I'll look at those differences..
>>> Maybe you could also consider rebasing things on top of that
>>> extracted
>>> granular history?
>>>
>> Interesting idea, but I am not able to estimate
>> complexity of such rebasing for now.
>>
>
> While we do not have any forks and can afford non-fast-forward updates
> of master, the complexity is almost nil.
>
> To rebase your format41 branch, one can do this:
>
> git rebase --preserve-merges --onto 3c7b3c5802e20381496f641fe64b6c1573228c6e 8a896fd48ed35c7dfa0188f9b7f4cbdfd469cacb format41
>
> where 8a896fd is merge-base of format41 and master (that big commit),
> and 3c7b3c5 is the corresponding commit of the synthesized history.
>
> Both commits have identical file content (`git diff 8a896fd 3c7b3c5`
> yields empty output).

OK, everything went smoothly,
Thanks for scrupulously archiving things!

Edward.
