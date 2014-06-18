From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Wed, 18 Jun 2014 13:49:30 +0200
Message-ID: <53A17CCA.5030306@gmail.com>
References: <3401431.jj87z7i0xD@intelfx-laptop> <1517464.b3HDrHDRa3@intelfx-laptop> <53A0EE30.3090303@gmail.com> <2155505.AXPj8Qz6Nx@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=aBnXdMykW6mz7NUckgoqVdTteF1WX+yr3ve12KXZoRo=;
        b=irbDEFmTVAccwwH/tYMbZ3eB0PKFepc4SogwmlmTiTSFFh4lUKJcZAOolTo2jRr3qS
         8IJyeY6AdNoGwEInhQWu6ef6/LJGKc+U4PhPxx+BjHBqWWSIOAqMzG+7Fzk77oSdrLkf
         cgZHkogGrHVgVqj+zqtgVpmQLC2LmeCTDMWZCSyE1fRdJSA6zXiq4JqSkdZtTckHsOdt
         EoHq/kIHHsZmV+AN9bICTTjjWVjrEGMc9uUEQfegivHPGl8b43gX86bI5CGKb3o3WWNV
         S64rHPzkDgTE0HjHJil6dJKnzPMaZgebAcXpjxEUcA/67o4goXMQxsLslXa9nkv9NyER
         TAdw==
In-Reply-To: <2155505.AXPj8Qz6Nx@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 06/18/2014 11:55 AM, Ivan Shapovalov wrote:
> On Wednesday 18 June 2014 at 03:41:04, Edward Shishkin wrote:	
>> On 06/17/2014 10:47 PM, Ivan Shapovalov wrote:
>>> On Tuesday 17 June 2014 at 22:31:36, Ivan Shapovalov wrote:	
>>>> On Tuesday 17 June 2014 at 12:29:53, Edward Shishkin wrote:	
>>>>> [...]
>>>>>
>>>>> Yup.
>>>>> So, if discard is on, we work with 2 lists (delete_set,
>>>>> delete_set_for_wander).
>>>>> If discard is off, we work with one blocknr set..
>>>> Good. So I'll do roughly following for v5:
>>>> - rename discard_set_* to block_list_* and split off these definitions
>>>> - write a family of reiser4_atom_dset_*() (log_deferred, log_immediate,
>>>>     apply_deferred, merge, init, destroy) which will encapsulate discard/nodiscard
>>>>     check and operate on correct lists (blocknr_set vs block_list)
>>>> - call reiser4_atom_dset_{init,destroy,merge}() from respective functions
>>>> - call reiser4_atom_dset_log_{deferred,immediate}() from reiser4_dealloc_blocks()
>>>> - call reiser4_atom_dset_apply_deferred() from reiser4_post_commit_hook()
>>>> - directly manipulate the block lists from discard_atom(), checking that we
>>>>     indeed have discard enabled
>>>>
>>>> Is this OK?
>>> BTW, with txn_atoms there is a locking idiom involving E_REPEAT loops.
>>>
>>> Is it fine to implement a
>>> current_atom_dset_log_...(...) // E_REPEAT loop inside
>>> instead of
>>> atom_dset_log_...(txn_atom* atom, ...)
>> IMHO it is not needed.
>>
>> atom = get_current_atom_locked();
>> atom_dset_{defer, immed}_add_extent(atom, ...); // <-- the loop is here
>> spin_unlock_atom(atom);
> IIUC, the point of the E_REPEAT loop is that memory allocations must be done
> with atom spinlock released, and once released,


You are right, we need something similar for the lists. Otherwise,
deadlocks are possible (they will appear on high-load systems).
Not necessarily in the first edition: first make sure that the base
stuff works.


>   the atom may "disappear", so
> it is unsafe to use the same pointer again. Hence there is a loop of
>
> void *data = NULL;
>
> do {
>      atom = get_current_atom_locked();
>      ret = blocknr_set_add_extent(atom, &atom->delete_set, &data, ...);
> } while (ret == -E_REPEAT);
>
> where `data` is a piece of "state" saved across the two blocknr_set_add_extent()
> calls. On first iteration of the loop, atom lock is released, memory is
> allocated and pointer is stored in `data`, and -E_REPEAT is returned.
> On second iteration of the loop, the previously allocated memory is accessed
> and the atom is modified under its spinlock.
>

