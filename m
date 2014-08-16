From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 10:23:08 +0200
Message-ID: <53EF14EC.1070101@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop> <53E80077.2060300@gmail.com> <2275451.mu6kquuFD5@intelfx-laptop> <2026408.Yl74NqGZKK@intelfx-laptop> <53EF11C8.20209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=4IN4YUvzL3gF5cO5orujURKbStYAwc8Ww0hsDzZ8OFc=;
        b=rlsP1utmsAeRMA3ijg6yeuI5L3TpC8zPd1mpS4EWZvxfg74UtV8Shun1GklKaHEy4b
         qVM6yK9//6FAMU1eg+vHZWCfa0xC8J5wX+gk7fshHfnebREmjHzSrX94QIqyKPS0eZ1Z
         YrTFcvbKgZCbBuBbvsb/PtCB+0Cb7aunptZp7tpKghKak36NL5RiHuvnC8Uatv3wKEGD
         hPM1rZdLY+t3RaxEW6W3tNJYxx60OWXxCozECkGuSOdXojlHdd6tJL5Mz8uE6CLaDQ29
         jVIfP+ryqlyfSeCX8Y2HYqOWvZnWOnHtjS1ZNaYVR9eq7SzvgJVEl4j45VMRm/+88ozK
         e0SQ==
In-Reply-To: <53EF11C8.20209@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 08/16/2014 10:09 AM, Edward Shishkin wrote:
>
> On 08/16/2014 02:44 AM, Ivan Shapovalov wrote:
>> On Monday 11 August 2014 at 13:39:12, Ivan Shapovalov wrote:
>>> [...]
>>>>> I've meant "grabbing all space and then allocating all space" -- 
>>>>> so there won't
>>>>> be multiple grabs or multiple atoms.
>>>>>
>>>>> Then all processes grabbing space with BA_CAN_COMMIT will wait for 
>>>>> the discard
>>>>> atom to commit.
>>>>
>>>> It seems such waiting will screw up the system. No?
>>> I was afraid of such situations, but how would that happen? The 
>>> discard atom's
>>> commit will always be able to proceed as it doesn't grab space at all.
>>>
>>>>>    (Actually, there is a small race window between grabbing space
>>>>> and creating an atom...)
>>>>
>>>> Which one?
>>> BA_CAN_COMMIT machinery does wait only for atoms, not for contexts. If
>>> process X happens to grab space between us grabbing space and 
>>> creating an atom,
>>> it will get -ENOSPC even with BA_CAN_COMMIT.
>
>
> I still don't see any "races" here. How atom creation is related to 
> grabbing
> space? Are we talking about races in the existing code? f so, please show
> the racing paths..
>
>
>>>
>>>>> The only problem is to wait for (sbinfo->block_count == 
>>>>> sbinfo->blocks_used +
>>>>> sbinfo->blocks_free) condition, i. e. until no blocks are reserved 
>>>>> in any form,
>>>>> and then to grab all space atomically wrt. reaching this condition.
>>>>>
>>>>> Again, if this is not feasible, I'll go with the multiple atoms 
>>>>> approach. I
>>>>> just want to make sure.
>>>>>
>> ...so, I've almost given up implementing this :)
>
>
> great!
>
>
>>
>> In kernel there is a read-write semaphore implementation called rwsem.
>> I've added a per-superblock instance of rwsem with following semantics:
>>
>> - when count of grabbed+special (not free or used) blocks is 
>> increased by any
>>    means, the semaphore is taken for reading before taking spinlock and
>>    modifying counters
>>
>> - if the counters already were non-zero, the semaphore has been 
>> already taken
>>    for reading (reader count > 1) and it is released once while under 
>> spinlock
>>    (so that reader count always stays at 1)
>>
>> - when count of grabbed+special blocks is decreased and drops to 
>> zero, the
>>    semaphore is released once (so reader count drops to 0 unless 
>> there is a race
>>    with increasing the count)
>>
>> - on second try of BA_CAN_COMMIT grabbing (if there was not enough 
>> space),
>>    the semaphore is taken for writing instead of for reading, ensuring
>>    that every block is either permanently used or free. The write 
>> lock is
>>    converted to read lock after grabbing required space.
>>
>> This "almost" works. The main problem is that Linux rwsem implementation
>> is write-biased: that is, if there are writers waiting, readers count 
>> can't
>> increase. That is, a process must not take a semaphore for reading in 
>> second
>> time if it is responsible for releasing the "first time" reader.
>>
>> The comment in original rwsem implementation by Andrew Morton states 
>> following:
>> "It is NOT legal for one task to down_read() an rwsem multiple times."
>>
>>    reader1     writer1
>> ------------------------
>> down_read()
>>              down_write()
>>              up_write()
>> down_read()
>> up_read()
>> up_read()
>>
>> This is a deadlock: reader1's down_read() blocks on writer1's 
>> up_write(),
>> while writer1's down_write() blocks on reader1's second up_read().
>>
>> A force grab (or a grab preceded by grab_space_enable(), or a 
>> used2something)
>> deadlocks 100% in presence of waiting writers, and so does the 
>> corresponding
>> transaction commit.
>>
>> So I need to find a way to take rwsem in a read-biased mode... Any 
>> advice is
>> accepted, including "give up with adding of yet another lock and go with
>> multiple transactions" :)
>
>
> IMHO this is too complicated.
>
> Why don't you want to grab, say, 20M per iteration?
> It should work without any problems, just maintain a
> counter of blocks allocated in the iteration..


add the counter to the struct reiser4_context and
set it to zero at the beginning of every iteration.
use get_current_context() to access the counter.

