From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Further work on reiser4: discard support and performance issues
Date: Tue, 05 Mar 2013 03:05:33 +0100
Message-ID: <513552ED.104@gmail.com>
References: <1856576.kOCPiaH0RB@intelfx-laptop> <CAErSLm0PFf03S8_6tjT0GgFXw=EpWCf+6RBoxxFYoecQPYWoLA@mail.gmail.com> <51184DD5.7020409@gmail.com> <1435419.Em4W395xSI@intelfx-laptop> <51322F14.6000405@gmail.com> <513261ED.4000105@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=qfxoAfKpjdGqy5ZAdlt6t8YbCSMbVpmLi+fdbTkn3xI=;
        b=J98LaPD7zeg8Q4rWQb8UYnLXVlxq9BjUqkVU0gt/yV5FGOngYGININogYDyJ0Q2/xG
         aPGFT+G436xSpNnaDNGd5CPYJ167LqP91eKUUldRW+PQrraU8KyfIC0fYlAysoLT43bc
         XZCcy2zYoJaJOUAjsOGPRTgJz7QUdbXQE2d/8Eou5Pazm8HLMquEMU9IKP1Iu3YPyycw
         MVLNwnhg8cUtM8ij32Eyxt2r/khKLwVyv5du25bK5rDzz3fcWBEgWC+7O09rNVW98aK/
         lpHmUc2+art+uoRLtQAUwAY5nfdBaS9XLvIrGRMsVXv3eakYh3wcE5u2L2hcPWdzpfaZ
         uNNQ==
In-Reply-To: <513261ED.4000105@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

On 03/02/2013 09:32 PM, Edward Shishkin wrote:
[...]
>>
>>> 2) "Batch" discard - the filesystem discards all free blocks upon a 
>>> user's
>>> request (when mounted).
>>> In this "batch" case, the signaling is done through a FITRIM ioctl 
>>> on any file.
>>>
>>> "Batch" mode:
>>> Implementing it should be simple enough (if I'm making correct 
>>> assumptions
>>> about how does reiser4 work): we can just lock the bitmap and walk 
>>> through it,
>>> issuing a discard for each long enough free sequence.
>>
>>
>> Mmm, I haven't found definition of "free block"..
>>
>> For example, we have deleted a file by unlink(2), and the transaction,
>> which contains the updated bitmap is not yet committed. And here is
>> an interesting question: at this moment blocks of that file are free, or
>> busy? ;)
[...]
>> Batched discard:
>>
>> Some clarifications are needed to understand if we can implement
>> something useful here..


BTW, the indeterminacy of the notions "free/busy block" disappears, if we
translate everything to the language of transactions.

I think that in the batch mode we need to launch a process X, which does
something like this:

while (1) {
         reiser4_init_context();  /* this opens a transaction */
         for (i=0; i < BATCH_GRANULARITY; i++) {
                 get next bitmap block;
                 if (all bitmaps have been processed)
                         break;
                 /* at this  point we do have a pointer to the atom */
                 scan the bitmap and insert all "free extents" to atom's 
discard tree;
                 capture the bitmap;
                 make the bitmap dirty;
         }
         reiser4_exit_context(); /* this closes the transaction */
         if (all bitmaps have been processed)
                 break;
}

In this case "batched" discard requests will be issued as "realtime"
ones when committing transactions spawned by the process X.

Problems:

1. Excess IOs of (artificially dirtied) bitmap blocks. But IMHO this
is a minor problem. We'll think how to avoid those IOs.

2. Bitmap block can be already captured by another process Y
(in other words, this bitmap block is contained in another atom).

One of the possible solutions is to close current transaction and
jump to the existing one (spawned by the process Y). That atom
may already contain a tree with "realtime discard extents". In this
case we just need to complement them with _all_ free extents of
the respective bitmap block (note, that the set of "realtime discard
extents" is a subset of free extents that we need to discard in
batch mode).

So, discard/TRIM support can be implemented in reiser4 as an
upgrade of transaction manager and block allocator. This upgrade
is backward and forward compatible.

The last thing is to make sure that fsck will be happy with the new
allocation policy (i.e. it won't perform massive reallocations, which
are useless for SSD). I am sure with 99.9%, that everything will be
OK here.

Edward.
