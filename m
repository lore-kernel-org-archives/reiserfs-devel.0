From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Forked reiserfsprogs
Date: Fri, 25 Apr 2008 22:45:07 +0400
Message-ID: <481226B3.4080203@gmail.com>
References: <480B97E3.7080008@gmail.com> <480C0721.7090005@suse.com>	 <480E5861.7070205@gmail.com> <1208906909.26981.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1208906909.26981.6.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Jake Maciejewski wrote:

>On Wed, 2008-04-23 at 01:28 +0400, Edward Shishkin wrote:
>  
>
>>Jeff Mahoney wrote:
>>
>>    
>>
[...]

>>>If we actually have a stable 3.6.20, I'd be happy to forward port my
>>>patches. One thing needs to happen, though: We absolutely need to start
>>>testing on big endian hardware. We ship reiserfs on both powerpc and
>>>s390, and hit the endian bugs quickly on those systems.
>>>
>>>      
>>>
>>Perhaps, I'll buy a cheap Mac G3 for testing (it is also needed for 
>>reiser4),
>>    
>>
>
>You could also try PearPC. On a fast x86/amd64 machine it probably isn't
>any slower than a low-spec G3.
>
>I have a beige G3 I'm not doing anything with (aside from testing
>reiser4 on it some time ago)
>

did reiser4 work?

>, but getting it to boot Linux without MacOS
>8/9 installed is borderline voodoo, so I assume you wouldn't be
>interested.
>
>  
>
>>but s390 seems to be exotic here..
>>
>>Ok, I'll put what I have: 3.6.19.1 and renamed 3.6.20.
>>
>>Thanks Jeff.
>>--
>>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>    
>>

