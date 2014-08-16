From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: FITRIM ioctl -- how to grab the space?
Date: Sat, 16 Aug 2014 21:54:16 +0200
Message-ID: <53EFB6E8.6080305@gmail.com>
References: <3405506.BC0S4TX54B@intelfx-laptop> <1651199.WS1bpHXlZS@intelfx-laptop> <53EF4B61.4080906@gmail.com> <3328274.dmtPODE4QV@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=buqQtB8/pweIlEIRCVfIFWEToQA4RE3p/VrsxaKuJio=;
        b=dBibei6pciyXKOyKeNThLM9LiO6flmX/W/yonX8zB6hBIVMFkTEvqcFd7PHfTz2sHz
         kRpky0OOIEJZog07mcEE0EGjYJ65jRdEOmR3rI5ypFrWQaqcsq9JzsJwenrcU1tpypUj
         SIDjVLuajyJYHTFZmqqTGOt34Nr65O0/xZ7zLdKgK6sF3gf6fSKl0nGa/MVlSVc2+wPM
         q/7zM9VePsqV+ESdO9gKjMC1hq0dxZlUrAK0Z6kPAW8UTkxvgty/WUBG+IxfuhwdZ3vj
         VG2SwWoTJrH5TWnzze5U1I3Ta/8ObcAhVv4xpUSOHybJkFg6DzwhnURFiYb4LV6KqTuV
         Wv3w==
In-Reply-To: <3328274.dmtPODE4QV@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 08/16/2014 07:02 PM, Ivan Shapovalov wrote:
> On Saturday 16 August 2014 at 14:15:29, Edward Shishkin wrote:	
>> On 08/16/2014 01:17 PM, Ivan Shapovalov wrote:
>>> On Saturday 16 August 2014 at 10:09:44, Edward Shishkin wrote:	
>>>> On 08/16/2014 02:44 AM, Ivan Shapovalov wrote:
>>>>> On Monday 11 August 2014 at 13:39:12, Ivan Shapovalov wrote:	
>>>>>> [...]
>>>>>>>> I've meant "grabbing all space and then allocating all space" -- so there won't
>>>>>>>> be multiple grabs or multiple atoms.
>>>>>>>>
>>>>>>>> Then all processes grabbing space with BA_CAN_COMMIT will wait for the discard
>>>>>>>> atom to commit.
>>>>>>> It seems such waiting will screw up the system. No?
>>>>>> I was afraid of such situations, but how would that happen? The discard atom's
>>>>>> commit will always be able to proceed as it doesn't grab space at all.
>>>>>>
>>>>>>>>      (Actually, there is a small race window between grabbing space
>>>>>>>> and creating an atom...)
>>>>>>> Which one?
>>>>>> BA_CAN_COMMIT machinery does wait only for atoms, not for contexts. If
>>>>>> process X happens to grab space between us grabbing space and creating an atom,
>>>>>> it will get -ENOSPC even with BA_CAN_COMMIT.
>>>> I still don't see any "races" here. How atom creation is related to grabbing
>>>> space? Are we talking about races in the existing code? f so, please show
>>>> the racing paths..
>>> Well, this is not a race per se - it does not involve locking. But it is
>>> a race-like behavior.
>>>
>>> taskA                                 taskB
>>> --------------------------------------------------------------------------
>>> grab very much space
>> Ok, assume A wants X blocks.
>>
>>>                                           grab some space with BA_CAN_COMMIT
>> Assume B wants Y blocks.
>>
>>> create an atom using the grabbed space
>>
>> Please, specify which code is executing at this point.
>>
>> Anyway, we don't need any reservation to _create_ an atom.
>> Reservation is expended when allocating blocks on the low level
>> (bitmaps). Reservation (grabbing space) is needed to avoid hard
>> ENOSPC (=no free bits in bitmaps) in situation, when we can not
>> fail (e.g. flush, commit, etc..,)
> Let's take reiser4_sync_file_common().
>
> The grabbing is
> 	reserve = estimate_update_common(dentry->d_inode);
> 	if (reiser4_grab_space(reserve, BA_CAN_COMMIT)) {
>
> The creation of atom is (somewhere deep in the call stack) at
> 	write_sd_by_inode_common(dentry->d_inode);
>
> Clearly, syncing file won't increase the real space occupied by data on disk.
> However, because there is WA + journaling, such transaction still needs some
> space to complete. This is "X blocks".
>
> Suppose there is a second sync scheduled between grabbing and creation of atom
> of the first sync. In the same vein it needs Y blocks, and Y is such that
> Y < free-space < X+Y.
>
> In this case, the second sync will fail despite BA_CAN_COMMIT flag given to
> reiser4_grab_space(): at time of its execution, the first sync did not yet
> create its atom, so there is nothing to commit to reclaim those X blocks.
>
> However, if the second sync gets ordered after write_sd_by_inode_common() of
> the first sync, BA_CAN_COMMIT machinery will eventually execute
> txnmgr_force_commit_all() which will wait for the first sync to complete and
> reclaim those X blocks.
>
> So, the second transaction's result depends on scheduling. It is a race-like
> behavior.


It's OK.
The second process fails in the situation of disk space pressure
(free-space < X+Y ). We don't rely on success here.

I was suspicious because of the problem of "phantom" ENOSPC,
which appears once in a while: a small write returns ENOSPC,
whereas there is a lot of free space on disk.


