From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Wed, 18 Jun 2014 03:41:04 +0200
Message-ID: <53A0EE30.3090303@gmail.com>
References: <3401431.jj87z7i0xD@intelfx-laptop> <53A018A1.5030403@gmail.com> <1775901.eB9J0phJSL@intelfx-laptop> <1517464.b3HDrHDRa3@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=fZ/RTXeQh7lII7iarGNhQE2X6IZX5xiWto772fkxgy0=;
        b=sRL067hQ3VVyykfqrnftYD+FfZ6b6ikz0OmNXU30BeB+UYhl012VboJno9bmcVjCDf
         QMbinmXC1x9Pbeh7U5GVRRZyg7phzrXhFxc3Cs11z5zhtugI5eYC8PILzX3pEixbu+DG
         DUykwioOCGbTORTYefd43T9lPxvO/bzcr6qwNjiNqkAIRutyk5OsWyavgST0m4qoX2Wb
         Jb6v1g35DnqKHSRYV55XFcFbT4xa1I69nhXzIGi8CLCq0uu0PseH6nbS0vG9w3hfnr2J
         Cq1Wv9bejVNUf327y5Qiv2D8sHgZeb8OsemSa2HlYjMpLGY+AzEzlwU2Rmu3am6yq2T/
         yHSA==
In-Reply-To: <1517464.b3HDrHDRa3@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 06/17/2014 10:47 PM, Ivan Shapovalov wrote:
> On Tuesday 17 June 2014 at 22:31:36, Ivan Shapovalov wrote:	
>> On Tuesday 17 June 2014 at 12:29:53, Edward Shishkin wrote:	
>>> [...]
>>>
>>> Yup.
>>> So, if discard is on, we work with 2 lists (delete_set,
>>> delete_set_for_wander).
>>> If discard is off, we work with one blocknr set..
>> Good. So I'll do roughly following for v5:
>> - rename discard_set_* to block_list_* and split off these definitions
>> - write a family of reiser4_atom_dset_*() (log_deferred, log_immediate,
>>    apply_deferred, merge, init, destroy) which will encapsulate discard/nodiscard
>>    check and operate on correct lists (blocknr_set vs block_list)
>> - call reiser4_atom_dset_{init,destroy,merge}() from respective functions
>> - call reiser4_atom_dset_log_{deferred,immediate}() from reiser4_dealloc_blocks()
>> - call reiser4_atom_dset_apply_deferred() from reiser4_post_commit_hook()
>> - directly manipulate the block lists from discard_atom(), checking that we
>>    indeed have discard enabled
>>
>> Is this OK?
> BTW, with txn_atoms there is a locking idiom involving E_REPEAT loops.
>
> Is it fine to implement a
> current_atom_dset_log_...(...) // E_REPEAT loop inside
> instead of
> atom_dset_log_...(txn_atom* atom, ...)

IMHO it is not needed.

atom = get_current_atom_locked();
atom_dset_{defer, immed}_add_extent(atom, ...); // <-- the loop is here
spin_unlock_atom(atom);
