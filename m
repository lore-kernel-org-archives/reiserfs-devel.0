From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually
 implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 18:33:11 +0200
Message-ID: <54468AC7.3040107@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <4858515.SiX86K8HSN@intelfx-laptop> <54468824.8060402@gmail.com> <44201008.TshRq3mBYC@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Xro2bkNae5Hos8+snFYzHS2mSE/IvIdIFgOH5hhMSNM=;
        b=GiO7zdqqzLMoZRn72f7IMErnHqCCJaM/liq2tMVsSPR5VNlTYtVt4FVCSYv0AX+DIl
         OJ4SXrIMhnR05ZRJjS4FqGFDmW93mX9LuTHWKV4+8Q4PyGq5v42yaidvHQYwc4WeXGb6
         1xGbXPaLdZXVXLlg3yLKt4yV7VDSLjRbMo5yrl/gUXjb08uR/ld+dVmhF3K2Y7vDUmkC
         w+aeZAPQXrnzJjsy2jvYKZ626uRvyC4WXVfgW+x/yT6Qj7k8fCzlwxGqh94erM+T6lTh
         HvYJKKY4dp0+n2+Tjska0OzSc6NDcY7yAgBhU94b2CVFlpDfeP7VslKjM7hzFlqrwuz6
         w99Q==
In-Reply-To: <44201008.TshRq3mBYC@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 10/21/2014 06:23 PM, Ivan Shapovalov wrote:
> On Tuesday 21 October 2014 at 18:21:56, Edward Shishkin wrote:	
>> On 10/21/2014 06:18 PM, Ivan Shapovalov wrote:
>>> On Tuesday 21 October 2014 at 12:14:02, Edward Shishkin wrote:	
>>>> On 10/21/2014 12:39 AM, Ivan Shapovalov wrote:
>>>>> On Monday 20 October 2014 at 12:54:13, Edward Shishkin wrote:	
>>>>>> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
>>>>>>> [...]
>>>>>>> +		/*
>>>>>>> +		 * Grab some sane amount of space.
>>>>>>> +		 * We will allocate blocks until end of the partition or until
>>>>>>> +		 * the grabbed space is exhausted.
>>>>>>> +		 */
>>>>>>> +		ret = reiser4_grab_reserved(super, 0, BA_CAN_COMMIT | BA_SOME_SPACE);
>>>>>>    any "legitimate" user of the reserved space
>>>>>> will block on the mutex and eventually proceed. At the same time, given
>>>>>> a filesystem with (5% + eps) free space left, not using the reserved space
>>>>>> will result in trimming of (eps) blocks at a time.
>>>>>>
>>>>>> reiser4_grab_reserved() grabs space from the reserved area (5%).
>>>>>> This is needed to make sure that unlink(), truncate(), etc. won't
>>>>>> fail, if there is no free space on disk. I don't think that FITRIM
>>>>>> ioctl needs this reserved area.
>>>>> Well, IIUC, it doesn't hurt:
>>>> "doesn't hurt" is not enough. If you want to take a resource,
>>>> you should be going to explain, why do you need this.
>>> I've explained the reason below... isn't it sufficient?
>>
>> Sorry, but I don't see any explanation.
> "given a filesystem with (5% + eps) free space left, not using the reserved
> space will result in trimming of (eps) blocks at a time."
>


This is something that I am not able to parse :)

Ok, it is clear, why we can not fail with -ENOSPC when trying to delete
a file from a full partition, yes?
I want to see explanation, why FITRIM ioclt can not finish the work when
there is no free space on disk.

Thanks,
Edward.
