From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Wed, 18 Jun 2014 02:30:27 +0200
Message-ID: <53A0DDA3.6060907@gmail.com>
References: <3401431.jj87z7i0xD@intelfx-laptop> <2537417.F0W18VYPYg@intelfx-laptop> <53A018A1.5030403@gmail.com> <1775901.eB9J0phJSL@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=autVc9lTiBnWPAHIZMg++z6PSJcIEnVoSKDV024OOis=;
        b=jt7GoJF5rXAyuUBqtZd3BYKj9y2wyjzidVQkReOetIN9qsZ4LJAU8oyUz3n269knFm
         /0r1tnULsFUhL3oU9+SZHlAm8xdMMgIhxjWt2AuMc5cpTm/TxqIB1Mm1KEx9qzjzw+TH
         5r3iuvn++UjfhrorMDBpnAzDKi/dRC8LkjACSB2hC3YebwKvNf/hKnQEtD1zzn3Mu2OW
         REbBa84BEMhOmht8X7LXAesILlblMtOL+gjlEI0ZAcDZzPTZZyZ1S7NdrAj8hW2gpsfA
         81tiBsv3O8Tj6t1lW1cGthHOXhkAmHMqH6HHJf1hzJz5mjHb07uU0iHi61hfhzWQIQf2
         Rggw==
In-Reply-To: <1775901.eB9J0phJSL@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 06/17/2014 08:31 PM, Ivan Shapovalov wrote:
> On Tuesday 17 June 2014 at 12:29:53, Edward Shishkin wrote:	
>> On 06/17/2014 12:14 PM, Ivan Shapovalov wrote:
>>> On Tuesday 17 June 2014 at 02:37:16, Edward Shishkin wrote:	
>>>> [...]
>>>>
>>>> Yup, blocknr sets minimize memory consumption and are unsortable...
>>>>
>>>> I think that the cleanest option will be using lists (instead of blocknr
>>>> sets) for
>>>> the delete sets, if the discard is turned on. It will reduce memory
>>>> consumption
>>>> by 20%. Indeed, every entry in a blocknr_set occupies ~8 bytes (assuming
>>>> that everything is pretty fragmented because of txmod=wa), whereas a list
>>>> entry occupies 32 bytes (start, length, plus 2 pointers for the link).
>>>>
>>>> In this option we'll need to join lists (instead of merging blocknr
>>>> sets) during
>>>> atoms fusion and apply the list (instead of blocknr set) to the COMMIT
>>>> BITMAP
>>>> at pre_commit_hook(). I think it won't be a problem, since the lists are
>>>> simpler
>>>> than blocknr sets.
>>> That's a neat approach. I think I'll use unions and do the decision at runtime.
>>
>> Yup.
>> So, if discard is on, we work with 2 lists (delete_set,
>> delete_set_for_wander).
>> If discard is off, we work with one blocknr set..
> Good. So I'll do roughly following for v5:
> - rename discard_set_* to block_list_* and split off these definitions

How about blocknr_lst_*?

> - write a family of reiser4_atom_dset_*() (log_deferred, log_immediate,

Can we avoid "log" if possible? Logs live in the journals...
Let's use "add_extent" instead of "log".


>    apply_deferred, merge, init, destroy) which will encapsulate discard/nodiscard
>    check and operate on correct lists (blocknr_set vs block_list)
> - call reiser4_atom_dset_{init,destroy,merge}() from respective functions
> - call reiser4_atom_dset_log_{deferred,immediate}() from reiser4_dealloc_blocks()

Let's do something like this:

reiser4_dealloc_blocks
{
     ...
     if (flags & BA_DEFER)
         atom_dset_defer_add_extent(atom, &bsep, start, len);
     else
         ....
         sa_dealloc_blocks();
         atom_dset_immed_add_extent(...);
    ...
}

where
atom_dset_defer_add_extent() encapsulates
1)  the loop
do {
     blocknr_set_add_extent (atom, &atom->delete_set_defer, &bsep, 
start, len);
     ...
} while (ret == -E_REPEAT);
2)  blocknr_lst_add_extent (&atom->delete_set_defer, start, len);

atom_dset_immed_add_extent() encapsulates
blocknr_lst_add_extent (&atom->delete_set_immed, start, len);

etc.

> - call reiser4_atom_dset_apply_deferred() from reiser4_post_commit_hook()
> - directly manipulate the block lists from discard_atom(), checking that we
>    indeed have discard enabled

OK.

Thanks,
Edward.
