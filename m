From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 0/6] reiser4: discard support: "precise discard" aka padding
 of extents to erase unit boundaries.
Date: Fri, 19 Dec 2014 16:46:16 +0100
Message-ID: <54944848.5020802@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com> <548CBFCA.60105@gmail.com> <1847370.hWhlfNze1m@intelfx-laptop> <548F36D5.4000402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=/5GvNzG/RHhFMMse3a++QXl/zrdWKXz096WR16W0Zwk=;
        b=OZXQFpEiFHjbVBD0LI99jBCRqUb06iSDSeaRsKjzx1RFkTeYNWWjtvUFuvgKIGL18z
         2dTDk5sAO17o40kDdy+NPuNNn8IEx4Mz7BPSX8XO8pXoEOSsIfumH5wHLAFqOc2eDpxu
         npMxiTR8VBauuEjX9gszyF0Lwanane46plV2xxMg2MZw0VDuaq5K7UYuLs19qYoD8EWb
         wbS13oqhX5oHrCjVK9d4yP2CWqHFV79SrDCd67/krz9He8hgFY9EexzMz+/gWmQ+HER+
         7/moH9Iok6xSt5445ntsdEgu90A6nk85eiOIrQrqQBawhkfl0DllxVSTo5UMhXPnXlYL
         QLMA==
In-Reply-To: <548F36D5.4000402@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 12/15/2014 08:30 PM, Edward Shishkin wrote:
> On 12/14/2014 09:03 AM, Ivan Shapovalov wrote:
>> On Saturday 13 December 2014 at 23:38:02, Edward Shishkin wrote:
>>> On 12/12/2014 10:10 PM, Ivan Shapovalov wrote:
>>>> So, this patchset uses your algorithm of padding/gluing extents to 
>>>> be discarded.
>>>> I've added exact allocation primitives (is it what you've been 
>>>> talking about?
>>>
>>> So, we found out that the old bitmap primitives don't allow us to 
>>> implement
>>> precise discard, and I asked for new ones. Also we wanted to 
>>> implement the
>>> general case, when precise discard works for any pair (offset, unit).
>>> Currently
>>> it works only for ones determined by the function 
>>> convert_lattice_params().
>>> For some reasons (that I don't remember) I was sure, that the 
>>> general case
>>> should be obtained from this partial case by a small transformation 
>>> of the
>>> function discard_sorted_merged_extents().
>>>
>>> Well, I'll try to dive into details and generalize things on the 
>>> holidays.
>>> If generalization is impossible, 


Hopefully this is possible,
I'll try to send the patch in short.

Edward.


>>> then we'll switch to non-precise
>>> discard every
>>> time when convert_lattice_params() fails.
>> I don't quite understand you here... Do you mean that some non-insane 
>> combinations
>> of discard unit, discard offset and blocksize are not handled (but worth
>> handling)?
>
>
> Yes. As you can see, if (discard_offset % block_size != 0), then we
> don't issue discard requests. Neither precise, nor non-precise.
> It is hard to implement the precise discard support in the generic 
> case straight away.
>
>
>>
>> TBH, convert_lattice_params() looks magic-ish to me...
>
>
> OK, I'll try to provide some background (geometric minimum).
>
> Edward.

