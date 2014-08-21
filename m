From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: porting to 3.16: any reason ->aio_read() of struct file_operations
 has been left out?
Date: Thu, 21 Aug 2014 17:27:36 +0200
Message-ID: <53F60FE8.7060904@gmail.com>
References: <10671542.MCAVDCHSND@intelfx-laptop> <5431496.Ue9YL3Eeu2@intelfx-laptop> <53F52195.1020900@gmail.com> <2194734.MaT6DR3706@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=LV7jEWZN+D/01zul9Dxr5hBScE/AMiPQSNcf5pzEwVU=;
        b=kXsv/FdkT/T/JA8cAa7Jilvo2JnjPhmkADz6tb61BLuCR1FlvnctXFqLdM7T1fOaCg
         hOyvqygX30UtimaA5jIv6lWI7UzxeTwoyPfCG9YLg4GtDqwXQV68yPO9eqdd2fKhf7RI
         KcOi4FSncDXYNt4w4hiH9m/xqu5amyi8s4jZ9HUe49rh2U3uqs4p+Km674T1+G0uoxKd
         aBxcgP/oc6t+nG0BoCEc91xqiMWDhSobE4q7fUCwo1bDfuvmzzMvrHDNkJu0h8Pjrlqx
         2x/XIpGL6LgF4ynttOAoVc9RGDW+xTWq4mZFmnFPKm3k5QjZM+74A2M9PZBNw70cbPUa
         12TQ==
In-Reply-To: <2194734.MaT6DR3706@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 08/21/2014 05:05 PM, Ivan Shapovalov wrote:
> On Thursday 21 August 2014 at 00:30:45, Edward Shishkin wrote:	
>> On 08/20/2014 10:34 PM, Ivan Shapovalov wrote:
>>> On Wednesday 20 August 2014 at 01:39:42, Edward Shishkin wrote:	
>>>> On 08/20/2014 12:32 AM, Ivan Shapovalov wrote:
>>>>>    From `git log` I've seen that VFS people intend to replace ->aio_read() and
>>>>> ->aio_write() of struct file_operations with new methods ->read_iter() and
>>>>> ->write_iter().
>>>>>
>>>>> (Along with a couple of related new helpers, differing from previous just in
>>>>> calling _iter methods instead of aio_ ones.)
>>>>>
>>>>>    From other filesystems it seems that these are simple drop-in replacements
>>>>> (however, well, I have zero familiarity with VFS). So here is a question:
>>>>> is there any intentional reason that generic_file_aio_write() is not used
>>>>> in reiser4?
>>>> Currently reiser4 is a set of two filesystems which differ in methods
>>>> of handling regular files. For VFS we provide "dispatchers", which pass
>>>> management to appropriate plugin (UNIX_FILE or CRYPTCOMPRESS).
>>>>
>>>> UNIX_FILE plugin doesn't use generic write for performance reasons
>>>> (I'll try to find the respective mailing thread). CRYPTCOMPRESS doesn't
>>>> use it for compatibility reasons: I don't know how how to rewrite it
>>>> gracefully using the generic write method.
>>>>
>>>> Edward.
>>> Thanks for explanation! So, does this patch make any sense?
>>
>> I haven't looked at this carefully yet, but likely it is correct.
>>
>> Thanks,
>> Edward.
> Turned out it isn't.. The iter_file_splice_write() requires ->write_iter
> to be set, or a NULL dereference happens.
>
> At first I've thought that we're out of luck and will need to use the fallback
> splice implementation (default_file_splice_write), but just setting
> ->write_iter to generic_file_write_iter strangely worked.
>
> (By "it works" I mean "splice finishes successfully and does not cause data
> corruptions").
>
> Could you please comment on this? :)


I'll try to take a look at weekends..

Thanks,
Edward.
