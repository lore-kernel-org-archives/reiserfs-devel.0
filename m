From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Thu, 19 Jun 2014 00:46:55 +0200
Message-ID: <53A216DF.3020208@gmail.com>
References: <3401431.jj87z7i0xD@intelfx-laptop> <2155505.AXPj8Qz6Nx@intelfx-laptop> <53A17CCA.5030306@gmail.com> <2270789.8YxXj97joR@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=VcD5M2VB3Y7wxjbeCHjJw9SbDAJQ1QO7rqBf/UFfTAM=;
        b=FpPek6IzRmDW3PLUlgRV1igQoiD/pLs/Zst8+aIBMpabMcscZ8ARIRlnLjl+C37pDs
         owUtnHtmS+hu0mPiYCQoY4BsLV4fxuy2mu3zljKBjbOhugG3CEgC8gZkO4Ndwr+I2ONc
         nnPyke1fYu1Y3i2VoRTvllQyuA2HZZHe5DoPRGr51hi2/fplRe2kME2c+2XtDtnFPbzD
         tfQ7X0Icr165cr06k5wjQ3PKTsWLFY8nco5xGRUL8juM/1oHhSTJhtm2m4iCjMg4BlS8
         eoxBwZQC933lLINS8rC+LxAA4kMqc/XgAQ3hsgH/kEeG2oqXhdffSQMiQUppU+hwbBEC
         ic6A==
In-Reply-To: <2270789.8YxXj97joR@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 06/18/2014 02:26 PM, Ivan Shapovalov wrote:
> On Wednesday 18 June 2014 at 13:49:30, Edward Shishkin wrote:	
>> On 06/18/2014 11:55 AM, Ivan Shapovalov wrote:
>>> On Wednesday 18 June 2014 at 03:41:04, Edward Shishkin wrote:	
>>>> On 06/17/2014 10:47 PM, Ivan Shapovalov wrote:
>>>>> On Tuesday 17 June 2014 at 22:31:36, Ivan Shapovalov wrote:	
>>>>>> On Tuesday 17 June 2014 at 12:29:53, Edward Shishkin wrote:	
>>>>>>> [...]
>>>>>>>
>>>>>>> Yup.
>>>>>>> So, if discard is on, we work with 2 lists (delete_set,
>>>>>>> delete_set_for_wander).
>>>>>>> If discard is off, we work with one blocknr set..
>>>>>> Good. So I'll do roughly following for v5:
>>>>>> - rename discard_set_* to block_list_* and split off these definitions
>>>>>> - write a family of reiser4_atom_dset_*() (log_deferred, log_immediate,
>>>>>>      apply_deferred, merge, init, destroy) which will encapsulate discard/nodiscard
>>>>>>      check and operate on correct lists (blocknr_set vs block_list)
>>>>>> - call reiser4_atom_dset_{init,destroy,merge}() from respective functions
>>>>>> - call reiser4_atom_dset_log_{deferred,immediate}() from reiser4_dealloc_blocks()
>>>>>> - call reiser4_atom_dset_apply_deferred() from reiser4_post_commit_hook()
>>>>>> - directly manipulate the block lists from discard_atom(), checking that we
>>>>>>      indeed have discard enabled
>>>>>>
>>>>>> Is this OK?
>>>>> BTW, with txn_atoms there is a locking idiom involving E_REPEAT loops.
>>>>>
>>>>> Is it fine to implement a
>>>>> current_atom_dset_log_...(...) // E_REPEAT loop inside
>>>>> instead of
>>>>> atom_dset_log_...(txn_atom* atom, ...)
>>>> IMHO it is not needed.
>>>>
>>>> atom = get_current_atom_locked();
>>>> atom_dset_{defer, immed}_add_extent(atom, ...); // <-- the loop is here
>>>> spin_unlock_atom(atom);
>>> IIUC, the point of the E_REPEAT loop is that memory allocations must be done
>>> with atom spinlock released, and once released,
>>
>> You are right, we need something similar for the lists. Otherwise,
>> deadlocks are possible (they will appear on high-load systems).
>> Not necessarily in the first edition: first make sure that the base
>> stuff works.
> It's cheap, there is no need to delay this until some ephemeral "final
> imlementation". I just wanted to make sure it's OK per coding style to
> implement functions like "current_atom_XXX()" which internally do
> get_current_atom_locked() and all that stuff. (Or not OK, in which case
> I'll push this loop out of the function.)

Ah, I see.. Not good. Let's push the loop out of the encapsulation then.
