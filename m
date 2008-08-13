From: "Ryan Hope" <rmh3093@gmail.com>
Subject: Re: [reiser4] Point
Date: Wed, 13 Aug 2008 11:03:28 -0400
Message-ID: <48f7fe350808130803p75fc5c13kfa40e313389f0e98@mail.gmail.com>
References: <558.1643-13003-1386678025-1217242012@post.cz>
	 <a08621850808041457y2f30559ve104c2a86a5f9970@mail.gmail.com>
	 <489B44FD.5000108@gmail.com> <489CB0F0.8020806@gmail.com>
	 <48f7fe350808090803g56ee1a88r18f408153b1702eb@mail.gmail.com>
	 <48A1DD60.7080906@gmail.com>
	 <e85b9d30808121305q7a3a8b08g80c26bc6b029ee56@mail.gmail.com>
	 <48A1F6CC.1080805@gmail.com>
	 <e85b9d30808130143h79cfa113if257e67e5386f324@mail.gmail.com>
	 <48A2AFF1.2000009@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=hNDsGtstDMdNXg8hrJ9sgEs5lupt3eQzZ8Je2tdt+mo=;
        b=ERRBDtidHPku8KA351+pymPRqE8+PgvVjOJZoLFcFYEgsQJMAPtJyr9zSPQxYcHjKr
         BF5KloURYin0H4RMGT9jBDrNSiyJQcXELA+9m2xifSpSBe4AUSg0IVuZcCjaL43WeJZx
         5PAj9dOQy6R/kylVH8Ogdatx7P8MH6Rt77nQQ=
In-Reply-To: <48A2AFF1.2000009@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Matthew <jackdachef@gmail.com>, reiserfs-devel@vger.kernel.org

With just that first patch this is how I was stress-testing it....

My rootfs is ext3 and my /usr/portage partition is reiser4...

I did this: 'cd /usr/portage; while (true); do bonnie; done'
Then on another console I ran 'emerge glibc'
On another console I ran 'emerge --sync'
On another console I compiled my kernel

I did not do any benchmarks, just looked in dmesg for anything abnormal.

-Ryan

On Wed, Aug 13, 2008 at 5:57 AM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Matthew wrote:
>> Hi Edward,
>>
>> ok, I'm testing it (patch 1) on my production system since yesterday,
>> no adverse effects until now,
>>
>> could you please explain what you exactly mean with "stress test"?
>> which loads does it include ?
>>
>>
>
> It means regression testing with any set of applications
> that involves as much file api as possible and causes
> intensive IO activity.
>
>> I'm using this for the following tasks right now:
>> - syncing the portage-tree (lots of small files, at least once a day;
>> a separate reiser4-partition for /usr/portage)
>> - emerging applications (reiser4 on the system-partition; emerge &
>> compilations put relative heavy load on it)
>> - creating stage4-tarballs (creating a tarball out of the running system)
>> - heavy compiling kernels (with -j 25)
>> - usual daily "work" (booting into the OS & launching / working with apps)
>> - updatedb
>> - *
>>
>>
>
> Ok, its enough.
> Thanks to everyone!
>
>> if you need more tasks to do let me know and I'll try to include them
>>
>> Thanks
>>
>> Mat
>>
>> On Tue, Aug 12, 2008 at 10:47 PM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>
>>> Matthew wrote:
>>>
>>>> Hi Edward,
>>>>
>>>> I somehow did kind of a stress-test to it (all of those patches):
>>>> usual file operations were comparable (compared to the unpatched
>>>> reiser4-tree), but (f)sync-"performance" was somehow abysmal:
>>>>
>>>> whereas it would take 2-5 minutes for the default reiser4 to sync data
>>>> out to disk after a kernel-compilation (issueing 'time sync'), it
>>>> would take >40+ minutes for the patched version to do so, also the hdd
>>>> would be clattering all the time during that
>>>>
>>>> in following cases it would take significant longer:
>>>> - emergency syncing [with magic sysrq key]
>>>> - emergency remount (sometimes it wouldn't even finish)
>>>> - parallel tasks (doing more things at a time / launching several apps at once)
>>>> - hdparm -t /dev/sda (seemingly cache-flushing, heavy clattering
>>>> before & after the output)
>>>> - sync
>>>> - shutdown -h now, reboot
>>>>
>>>> here's the page of the thread where I posted all of the testing-experience:
>>>> http://forums.gentoo.org/viewtopic-t-696253-start-375.html
>>>>
>>>> could it be that Ryan's problems with ext3/ext4 are caused by probable
>>>> inherent problems / bugs with them than rather being a bug in reiser4
>>>> itself ?
>>>>
>>>> I don't have any partition with ext* filesystems, only reiserfs +
>>>> reiser4 and unfortunately  also can't reproduce this behavior ...
>>>>
>>>>
>>>>
>>> Guys, patches 2/3, 3/3 of the latest series are wrong and all
>>> manipulations with this stuff (testing, getting stacktraces, etc.)
>>> is just useless wasting your time.
>>>
>>> The patch 1/3 (use-wake_up_process-instead-of-wake_up)
>>> seems to be ok, but it must be stress tested.
>>> If there are any problems specific to this patch, then let me know.
>>>
>>> Thanks,
>>> Edward.
>>>
>>>
>>>> the reiser4-devel/reiser4 testing-tree (for zen) can be found on the
>>>> zen-sources git-server:
>>>> http://zen-sources.org/cgi-bin/gitweb.cgi?p=kernel.git;a=summary
>>>> kudos to Ryan, Miguel, Dominic and Corbin :)
>>>>
>>>> keep up the work, guys ! :)
>>>>
>>>> Thanks
>>>>
>>>> Mat
>>>>
>>>> On Tue, Aug 12, 2008 at 8:58 PM, Edward Shishkin
>>>> <edward.shishkin@gmail.com> wrote:
>>>>
>>>>
>>>>> Ryan Hope wrote:
>>>>>
>>>>>
>>>>>> This works because the struct "ent" is of type "entd_context"
>>>>>>
>>>>>>
>>>>> This logic train goes to a wrong direction ;)
>>>>>
>>>>>
>>>>>
>>>>>>  which
>>>>>> has members "wait_queue_head_t wait" and "struct task_struct *tsk".
>>>>>> The function wake_up() takes the parameter wait_queue_head_t the
>>>>>> function wake_up_process() takes task_struct... I figured this would
>>>>>> be a legit switch. I have seen no adverse affects yet.
>>>>>>
>>>>>>
>>>>>>
>>>>> Did you stress test it?
>>>>>
>>>>> Thanks,
>>>>> Edward.
>>>>>
>>>>>
>>>>>
>>>>>> -Ryan
>>>>>>
>>>>>> On Fri, Aug 8, 2008 at 4:47 PM, Edward Shishkin
>>>>>> <edward.shishkin@gmail.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>>> Ryan Hope wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> Is this todo really done?
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>> nop
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>>> As in point 6. in todo list (pub.namesys.com/Reiser4/ToDo ) try to
>>>>>>>>>> replace wake_up() with wake_up_process()
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>> There are still a few more wake_up()'s in the code, the following
>>>>>>>> patch takes care of 2 of them.
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>  both are not obvious for me, review is needed..
>>>>>>>
>>>>>>> Edward.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> diff --git a/fs/reiser4/entd.c b/fs/reiser4/entd.c
>>>>>>>> index a164f5a..355548d 100644
>>>>>>>> --- a/fs/reiser4/entd.c
>>>>>>>> +++ b/fs/reiser4/entd.c
>>>>>>>> @@ -218,7 +218,7 @@ void reiser4_leave_flush(struct super_block *super)
>>>>>>>>  #endif
>>>>>>>>      spin_unlock(&ent->guard);
>>>>>>>>      if (wake_up_ent)
>>>>>>>> -        wake_up(&ent->wait);
>>>>>>>> +        wake_up_process(ent->tsk);
>>>>>>>>  }
>>>>>>>>
>>>>>>>>  #define ENTD_CAPTURE_APAGE_BURST SWAP_CLUSTER_MAX
>>>>>>>> @@ -304,7 +304,7 @@ int write_page_by_ent(struct page *page, struct
>>>>>>>> writeback_control *wbc)
>>>>>>>>      ent->nr_todo_reqs++;
>>>>>>>>      list_add_tail(&rq.link, &ent->todo_list);
>>>>>>>>      if (ent->nr_todo_reqs == 1)
>>>>>>>> -        wake_up(&ent->wait);
>>>>>>>> +        wake_up_process(ent->tsk);
>>>>>>>>
>>>>>>>>      spin_unlock(&ent->guard);
>>>>>>>>
>>>>>>>>
>>>>>>>> --
>>>>>>>> To unsubscribe from this list: send the line "unsubscribe
>>>>>>>> reiserfs-devel" in
>>>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>>
>>>>>
>>>>>
>>>>
>>>
>>
>>
>
>
