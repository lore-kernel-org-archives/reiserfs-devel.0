From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard support
Date: Sat, 03 May 2014 22:21:58 +0200
Message-ID: <53654FE6.7030408@gmail.com>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <4594794.KsdUPSo0Ac@intelfx-laptop> <5363DF88.7060904@gmail.com> <1461643.AZxFf0Q2dH@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=aFKbIzJ/k1er7DogVHV5tOuNKlU+JvnM7A2fpdYFHOw=;
        b=LqkJI32dXuMsrMeDQ1gwEbWGGgRIYHLGoj/6gj1d7lLaZtiMLtwI6fBuB9VfayNTK6
         Isvf8/IhJS08QzlDkNTl6GS2+egub8lOHMha+ecf8TolLABHphrJQ9IAiEElNe/vQpxW
         yeq1q260CPXVSQbfcaQvCBCsR8o2qyMLn5OpflOFlcCbkMFC67o84QzkC34QQFPKujvp
         7LsNp7QsMQfpLGZyHr9t0S999+KSdfbXuo3IidnbhLv0Ga0IP3EquIsNTUM780K7uSoV
         FTBgPkc/opweaKelJhqcfoDCTEl1EENoILl1vXuEkH3eDq46v321EToY+wB/FH8pt+57
         uvjQ==
In-Reply-To: <1461643.AZxFf0Q2dH@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/03/2014 08:48 PM, Ivan Shapovalov wrote:
> On Friday 02 May 2014 at 20:10:16, Edward Shishkin wrote:	
>> On 05/02/2014 04:32 PM, Ivan Shapovalov wrote:
>>> On Friday 02 May 2014 at 16:07:21, Edward Shishkin wrote:
>>>> On 05/02/2014 03:36 PM, Ivan Shapovalov wrote:
>>>>> On Friday 02 May 2014 at 13:48:28, Edward Shishkin wrote:
>>>>> [...]
>>>> We can perfectly populate different "discard trees" in parallel on
>>>> different CPUs.
>>>> As to sorting the list: I don't know how to perform it in parallel :)
>>>> Default assumptions, that everything is serialized, usually lead to
>>>> various
>>>> bad-scalable solutions...
>>> Ah, now I understand what do you mean. If that's about doing less work
>>> under the tmgr mutex,
>> No. This is about minimizing real time.
>> We don't know about mutexes. We want to decide, what is preferable:
>> populating trees, or sorting the list. There is a chance that the first will
>> be faster in systems with many CPUs, so I suggest to use trees.
>> That's all!
> OK.. well, I've started with lists anyway. The data structure is (of course)
> under an abstraction layer, so we can change it.
>
>>>    then yes, trees are better than lists.
>>>
>>> BTW, I've seen that reiser4 releases atom lock before allocating another
>>> node for a blocknr_set, and that leads to a "do { } while (ret ==
>>> -E_REPEAT)" loop around the blocknr_set_add_extent() calls. Is this the
>>> preferred way of attaching a dynamic data structure to an atom?
>> TBH, I have never looked at the deallocation paths in reiser4: everything
>> worked fine there.. BTW, why not to use atom's delete_set to discard things?
>> Could you please take a look?
> Blocks used for the journal (wander.c) are deallocated without BA_DEFER set
> and thus they never hit delete_set. However, we want to discard these.


This happens in error paths. Don't be so scrupulous ;)
Also users will use copy-on-write transaction model for their SSDs(*),
and in this mode journals are tiny: they contain only system blocks.
In short, there is nothing to discard..

(*) http://marc.info/?l=reiserfs-devel&m=139449965000686&w=2


>
>>>>> [...]
>>>> what explanation do you mean?
>>>>
>>>> Edward.
>>> A general explanation of how does it work :)
>> I think this is because of historical reasons.
>> Such good explanation costs a lot of time and efforts.
>> Namesys was a small company, we couldn't afford to have a technical writer.
>> Hans insisted on good comments in the source code..
> But there aren't much comments there. ;)
>
> I'm now coding the last part - bitmap querying - and I've got a question: how
> do we pass reiser4_block_nr parameters?
> Many places use pointers, but I do not really understand why (to optimize for
> stack frame size on 32-bit archs?)


I think, yes: 12 years ago 64-bit archs looked like exotic..


>   and there is a place
> (reiser4_dealloc_blocks_bitmap()) where this convention is apparently broken.


I suspect that even the author of the bitmap code doesn't know, why it
is broken ;)

Edward.


>
> And this is tedious, because public interfaces seem to pass start+len, but in
> some places it's more convenient to use start+end...

