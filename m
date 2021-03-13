From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Occasionally mkfs.reiser4 creates a file system without a UUID
Date: Sat, 13 Mar 2021 15:28:51 +0100
Message-ID: <04e926a4-dcbc-7e89-19d6-3815a572d2d0@gmail.com>
References: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
 <af8ab3fa-4ba1-5e62-993f-96e8d711297d@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KHzk9sOROUxF+iH0v9rfcgZod9ZJBglwqNQF6B8m6KY=;
        b=bEDZEJs2dD4CgUr7VXqWDK48E8wu45BL1jzV4mGqdXk3wXm12lzLgC7gL9jqIx+hp/
         MV1X98EM+z91B9KACKxYhCnzjUi2TlQ5LrN+22IMrno2ZJhYO0pA0LzBAJ9nOfU/AX02
         jzJL3pFz5YGkpvRe8NLP3ZnQvepYkj4Hi73Y3D7VBTnN50dkmIU6f15HwsZABGcbBT2O
         lX7aXtvRUzYQe1N8JX1SrAT7SLmRIMosR7r6SjW2Qjd1SN5N+gqLnvue5tDmN2lQ+/XO
         cG6GUhg5Jmp89ewCj2A9DDUn5VRqmRo2foW0IJUYpO7XBCW+Uku/bvEq/rZlVLXhnZT0
         YrOQ==
In-Reply-To: <af8ab3fa-4ba1-5e62-993f-96e8d711297d@gmail.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Mike Fleetwood <mike.fleetwood@googlemail.com>, reiserfs-devel@vger.kernel.org



On 03/13/2021 12:37 PM, Edward Shishkin wrote:
> On 03/12/2021 08:36 PM, Mike Fleetwood wrote:
>> Hi,
>>
>> Occasionally mkfs.reiser4 creates a file system without a UUID,
>> debugfs.reiser4 reports UUID as '<none>'.  This is being detected in
>> GParted's file system interface CI tests [1] which exercises the resier4
>> commands.
>>
>> In a Ubuntu 20.04 LTS VM with both resier4progs-1.2.1-1 package and
>> current code from GIT, the fault can easily be replicated like this:
>>
>> truncate -s 256M test.img
>> i=1
>> while :
>> do
>>    mkfs.reiser4 --force --yes --label '' test.img
>>    line=`debugfs.reiser4 test.img 2> /dev/null | egrep '^uuid:'`
>>    echo "[$i] $line"
>>    ((i++))
>>    echo "$line" | grep -q '<none>' && break
>> done
>>
>> Output fragment:
>> [1] uuid:        17073919-e41d-4892-9b22-4294d1544c4a
>> [2] uuid:        af2821de-ea85-4f20-9621-4fbd128b3fb8
>> [3] uuid:        c0fb805b-e224-4695-a504-d87460d158ae
>> ...
>> [35] uuid:        d604794d-097f-4810-bbb3-01a1518f3ef1
>> [36] uuid:        9634100c-1f98-42b3-a684-c9df77ab54e2
>> [37] uuid:        <none>
>>
>> Performing the same test with resierfs and ext4 runs for many hours
>> doing 100,000s of iterations without issue.
>>
> 
> 
> It seems that debugfs.reiser4 prints uuid incorrectly: it assumes that
> binary uuid can't contain '\0' symbols, which apparently is wrong.
> Thus, if the first uuid's symbol is '\0', debugfs thinks that uuid is
> not set and prints "none" ;)
> 
> I'll try to prepare a fixup a bit later.
> Special thanks for the nice testing script!
> 


Here is the fixup:
https://github.com/edward6/reiser4progs/commit/4802cdb18ae03031d0e51a58b6655f3b99021ec2

Thanks,
Edward.
