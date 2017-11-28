From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7, Format
 4.0.2
Date: Tue, 28 Nov 2017 12:50:09 +0100
Message-ID: <f1bfffae-0355-c4a3-cbb4-ca8f4ee970ec@gmail.com>
References: <2cf6aac6-650d-4940-359d-316dc70a183d@gmail.com>
 <1511788205.5344.2.camel@z-51.de>
 <8db85297-34f8-980c-dab9-c98b95fb592c@gmail.com>
 <1511796421.5344.6.camel@z-51.de>
 <8a29e976-de48-dabe-2b2f-a7149002251e@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jw1osFQPX7YF/9uyp/KDvj1uow4LxknBXBGWB96kHr4=;
        b=AU0GNMf2EbnrXptgZpaczlbCwtBuoPSl90iD8JoJsvy+dQ6rurtAO/QjqIKv0vplVz
         BrEdJ4HRELXvE7VVA+13e5bgU+8AqAy4UEs36831/Xn3f2qUhjg3uYg2ScfvUNKZwdhC
         xu1hcyDacZ2JbBZRH6aWafPam4DPDAH1YbOM1s5Gw3+Ni0HLByJsJHUHe04W5deA6ssr
         XgQpZIyHJTqou2HNh/JjKqU5Za99HqwJAVhYXYK/SehadMy6jkhQ7/p5bQNRqvVcWVj5
         54hrD+D2+UeqDxdTFb6HwdAP6exvKAH1lq4OHqSVL/IpzGeSZubyZS7/2vc65FR0HcJA
         DRkw==
In-Reply-To: <8a29e976-de48-dabe-2b2f-a7149002251e@gmail.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Felix Zielcke <fzielcke@z-51.de>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Christian Kujau <lists@nerdbynature.de>

Hello everyone.

Please, find version 1.2.1 of reiser4progs with the fixup:
https://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs

TBH, I am not sure that Reiser4 works for architectures different from
amd64 and i386. However, correct builds is a good start to fix things :)

Thanks,
Edward.

On 11/27/2017 09:05 PM, Edward Shishkin wrote:
> Hi Felix,
>
> Thank you for the hint!
> It seems that the following patch is incomplete (missing rename of 
> align_loop_flag):
> https://github.com/edward6/reiser4progs/commit/2b74e05bdde4f84a224bc235814d1fc51793a2c8 
>
> I'll prepare a new release basing on your fixup.
>
> Edward.
>
> On 11/27/2017 04:27 PM, Felix Zielcke wrote:
>> Am Montag, den 27.11.2017, 14:46 +0100 schrieb Edward Shishkin:
>>> Hi Felix,
>>>
>>> Thank you for the report, I'll try to find out, what is wrong.
>>>
>>> Edward.
>>>
>> Hi Edward,
>>
>> I got now a hint on the Debian bugtracker
>> The problem seems to be the variable used in the configure.ac check for
>> falign-loops
>> This patch seems to fix it:
>>
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -408,7 +408,7 @@
>>   fi
>>      # Force no alignment to save space.
>> -if test "x$falign_loop_flag" = xyes; then
>> +if test "x$falign_loop_flag_cv_" = xyes; then
>>          ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 
>> -falign-functions=1 \
>>   -falign-labels=1 -fno-inline -fstrength-reduce"
>>   else
>>
>> Regards
>> Felix
>

