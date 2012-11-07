From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiserfscore/hashes.c
Date: Wed, 07 Nov 2012 15:39:53 +0100
Message-ID: <509A72B9.5030501@gmail.com>
References: <20121106154905.GA11281@bom.nom.co> <5099694F.8060502@gmail.com> <20121107003744.GA4194@bom.nom.co>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=hAbFCA+eMrujwbrjaze0Scwfnxc83sfo3ASAev+FkNg=;
        b=0LahQ89Qo+OwBn9xDemM5Fnq6dK9jxzNI5CIZKr4V7Z1EEs3rU3xZIxKwIvWs75ZZS
         UCSk57bMgIS0hVqsJCATGprbo0DbfwtF1kpxqT0Rln+frGhJz+49cOy12J1KyyMT3GTb
         BGRjMFn+q5jl7nxYCL72MQj7hoj36BA/H227NaA5Q+c0w8c4AcMOhO37KEsililM4QfI
         cfb0HPAcW8Web48h4bIky6m++wjxWGiWDAUJB1E0mgxFp/CGb6gjz5gCrOJi/vzIjz4Z
         tGXFF85F2+reIn8kFd4RbLmtZ18yHfDirq1ioBUPt7K/GFAusvKTd8cyt03yeRjXkPK3
         69Wg==
In-Reply-To: <20121107003744.GA4194@bom.nom.co>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Michael W. Bombardieri" <mb@ii.net>
Cc: reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>

On 11/07/2012 01:37 AM, Michael W. Bombardieri wrote:
> On Tue, Nov 06, 2012 at 08:47:27PM +0100, Edward Shishkin wrote:
>> Hello Michael,
>>
>> Your changes look OK to me.
>>
>> TBH, I don't like the fact that the pow is set to 1 by such tricky ways in
>> the mentioned nested loops: it might indicate mistakes in the original
>> code.
> I agree. Something doesn't look right about the nested loops
> not being entered. This could well point to the code being
> incorrect. IMHO, the developer would not bother adding the
> loops if he didn't want them to be used.
>
>> Generally I think that this hash is not heavily used: everyone uses either
>> r5, or tea hash, so...
> I suppose this would raise the question, is it worth patching
> yura_hash() or is it better to scrap the function altogether
> if the two other hash functions are sufficient?


We can not scrap this, as it will break backward compatibility:
a number of people must be use it. We can only recommend,
or not recommend something..

I suggest to patch this, so it will be clear what is going on here.
You might want also to prepare similar patch for the kernel and
send it to Jeff.

Thanks,
Edward.


>
>> A??ked-by: Edward Shishkin <edward.shishkin@gmail.com>
>>
>> Thanks,
>> Edward.
>> P.S. This is a git repository of Jeff Mahoney, the reiserfs maintainer, so
>> don't forget cc him ;)
>>
>>
>>
>>> - Michael
>>>
>>>
>>> --- hashes.c	Tue Nov  6 23:21:09 2012
>>> +++ hashes_new.c	Tue Nov  6 23:26:26 2012
>>> @@ -175,37 +175,26 @@
>>>   u32 yura_hash (const signed char *msg, int len)
>>>   {
>>> -    int j, pow;
>>> -    u32 a, c;
>>> -    int i;
>>> -
>>> -    for (pow=1,i=1; i < len; i++) pow = pow * 10;
>>> -
>>> -    if (len == 1)
>>> -	a = msg[0]-48;
>>> -    else
>>> -	a = (msg[0] - 48) * pow;
>>> -
>>> -    for (i=1; i < len; i++) {
>>> -	c = msg[i] - 48;
>>> -	for (pow=1,j=i; j < len-1; j++) pow = pow * 10;
>>> -	a = a + c * pow;
>>> -    }
>>> -
>>> -    for (; i < 40; i++) {
>>> -	c = '0' - 48;
>>> -	for (pow=1,j=i; j < len-1; j++) pow = pow * 10;
>>> -	a = a + c * pow;
>>> -    }
>>> -
>>> -    for (; i < 256; i++) {
>>> -	c = i;
>>> -	for (pow=1,j=i; j < len-1; j++) pow = pow * 10;
>>> -	a = a + c * pow;
>>> -    }
>>> -
>>> -    a = a << 7;
>>> -    return a;
>>> +	int i, j, pow;
>>> +	u32 a;
>>> +
>>> +	a = msg[0] - 48;
>>> +	if (len != 1) {
>>> +		for (i = 1, pow = 1; i < len; i++)
>>> +			pow *= 10;
>>> +		a *= pow;
>>> +	}
>>> +	for (i = 1; i < len; i++) {
>>> +		for (j = i, pow = 1; j < len - 1; j++)
>>> +			pow *= 10;
>>> +		a += pow * (msg[i] - 48);
>>> +	}
>>> +	for (; i < 40; i++)
>>> +		a += '0' - 48;
>>> +	for (; i < 256; i++)
>>> +		a += i;
>>> +	a <<= 7;
>>> +	return a;
>>>   }

