From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 Upstream Git Repositories on GitHub
Date: Tue, 27 Sep 2016 23:47:44 +0200
Message-ID: <57EAE900.8060301@gmail.com>
References: <57E6DF37.1050702@gmail.com>         <1474927548.10826.6.camel@intelfx.name> <57E9A32D.3000108@gmail.com>    <1474944195.1773.15.camel@intelfx.name>         <1921c810-5d7f-1de0-ec3d-48d123dba41f@gmail.com> <1475001384.1609.2.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=JJTXIJzSjsEVnaoGtVRkKcMT97f1MUaDYdsFIdBiYYs=;
        b=K2NfMvNuYD+vQ3rsF4iwXzBpsunsSfzEHfeHhcnqSRwdBaQvhSpoka1cHQzqhfMZWZ
         xpigAkb0B9NIBhSr3NT1jDP+YT+Bph4/9S42GTtFH1+Vvrj1QaWLvpvBQ1Fn+bRrF+du
         pppbh+BdYheKGM9IGWQWNvd0IJT+yg+Z0a/YCVGgm2qbuG6REA26PxhaIaVZJcETrJHw
         CwNUPPQEJNvOBQXbpWSmh7Orzcf2ARAEyeYDtFsS6lmGkJcbthmPsQwayI+mm95lGUjN
         +cz+63ATO1GOhUjgWF0BKB/Cxci65EVDlAKhAWvaRJP4xkx23XMm/tjtZqS19XETgm65
         Yvww==
In-Reply-To: <1475001384.1609.2.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>



On 09/27/2016 08:36 PM, Ivan Shapovalov wrote:
> On 2016-09-27 at 16:13 +0200, Edward Shishkin wrote:
>> On 09/27/2016 04:43 AM, Ivan Shapovalov wrote:
>>> On 2016-09-27 at 00:37 +0200, Edward Shishkin wrote:
>>>> On 09/27/2016 12:05 AM, Ivan Shapovalov wrote:
>>>>> On 2016-09-24 at 22:16 +0200, Edward Shishkin wrote:
>>>>>> Hello everyone,
>>>>>>
>>>>>> I have set up the updated Namesys repositories at my Github
>>>>>> page.
>>>>>> Those repositories are supposed to contain the latest updates
>>>>>> in
>>>>>> the (stable) master branch and in other (experimental)
>>>>>> branches
>>>>>> that
>>>>>> I'll announce.
>>>>>>
>>>>>> 1) https://github.com/edward6/reiser4
>>>>>>
>>>>>> This is a "standalone" reiser4 tree, which doesn't include
>>>>>> specific
>>>>>> changes of Linux kernel needed for reiser4 port. Such changes
>>>>>> can
>>>>>> be
>>>>>> found at the project's page on Sourceforge:
>>>>>> https://sourceforge.net/projects/reiser4/
>>>>>>
>>>>>> An example of work with the standalone reiser4 tree:
>>>>>>
>>>>>> . Patch the respective kernel with the latest available stuff
>>>>>> from
>>>>>>       Sourceforge;
>>>>>> . cd to the "fs" directory;
>>>>>> . delete the directory reiser4;
>>>>>> . instead of the deleted stuff clone the standalone reiser4
>>>>>>       repository from Github;
>>>>>> . build and install as usual.
>>>>>>
>>>>>> 2) Libaal and Reiser4progs:
>>>>>>
>>>>>> https://github.com/edward6/libaal
>>>>>> https://github.com/edward6/reiser4progs
>>>>>>
>>>>>> Before building Libaal and Reiser4progs execute the ./prepare
>>>>>> script,
>>>>>> which will create files needed for build process.
>>>>>>
>>>>>> Thanks,
>>>>>> Edward.
>>>>> Wow, finally.
>>>>>
>>>>> Maybe we could avoid that "all changes for 10 years" commit?
>>>> Hi Ivan,
>>>> Sorry, don't have a time to granulate it.
>>>>
>>>>> I tried to keep track of all patches since 3.2...
>>>> There will be "all changes for 6 years" commit.
>>>> Is it much better?
>>> So well, I finished splitting off all known diffs from that big
>>> commit.
>>> Tt was 12k(+)/8k(-), now it is 7k(+)/7k(-).
>>>
>>> The updated branch is here: https://github.com/intelfx/reiser4
>>> (unfortunately, not fast-forward).
>>>
>>> Moreover, my tree has accumulated quite a few differences from your
>>> one. I've dropped trivial discrepancies (comments, formatting etc.)
>>> and put the larger ones in separate branches:
>>>
>>> 1. https://github.com/intelfx/reiser4/tree/differences/enotty
>>>      (unsupported ioctls return -ENOTTY, not -ENOSYS)
>>>
>>> 2. https://github.com/intelfx/reiser4/tree/differences/migratepage
>>>      (the ->migratepage() implementation, which I still do not
>>> completely
>>>       understand, but it works)
>>>
>>> 3. https://github.com/intelfx/reiser4/tree/differences/renameat2
>>>      (renameat2(RENAME_NOREPLACE) implementation, which you haven't
>>>       merged somewhy)
>>>
>>> 4. https://github.com/intelfx/reiser4/tree/differences/adjust-to-3.
>>> 15
>>>      (part of porting to 3.15 which, again, you haven't merged
>>> somewhy)
>>>
>>> These branches are on top of that granular "master".
>>> Anyway, please take a look.
>> It was definitely useful work,
>> I'll look at those differences..
> Maybe you could also consider rebasing things on top of that extracted
> granular history?
>

Interesting idea, but I am not able to estimate
complexity of such rebasing for now.

