From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4+2.6.38.6 broken?
Date: Mon, 16 May 2011 23:35:40 +0200
Message-ID: <4DD198AC.4040901@gmail.com>
References: <37304792.ap5uy0yJeJ@localhost> <1725025.DC6atdjbiy@localhost> <4DD18A02.3090304@gmail.com> <4520233.UGogC23bit@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4520233.UGogC23bit@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/16/2011 11:12 PM, Volker Armin Hemmann wrote:
> On Monday 16 May 2011 22:33:06 you wrote:
>> On 05/16/2011 10:20 PM, Volker Armin Hemmann wrote:
>>> On Monday 16 May 2011 22:16:11 you wrote:
>>>> On 05/16/2011 09:55 PM, Volker Armin Hemmann wrote:
>>>>> Hi,
>>>>>
>>>>> I have several r4 partitions, all with cryptcompress.
>>>>>
>>>>> I tried 2.6.38.x6 a few hours ago - after 3h I looked at dmesg and
>>>>> it
>>>>> was
>>>>> swamped with error messages and tracebacks. Sadly I tried to run
>>>>> fsck
>>>>> before saving dmesg - and the box froze completely.
>>>>>
>>>>> I am now back to 2.6.36.4. fsck is running on one of the partitions.
>>>>> Meanwhile I see tons of this:
>>>>>
>>>>> [  153.379751] reiser4[kuiserver(2649)]: reiser4_inflate_cluster
>>>>> (fs/reiser4/plugin/file/cryptcompress.c:1136)[edward-1460]:
>>>>> [  153.379756] WARNING: Inode 2975012: disk cluster 27 looks
>>>>> corrupted
>>>>> [  163.301372] reiser4[kuiserver(2669)]: dc_check_checksum
>>>>> (fs/reiser4/plugin/file/cryptcompress.c:969)[edward-156]:
>>>>> [  163.301374] WARNING: Bad disk cluster checksum 799645291, (should
>>>>> be
>>>>> 546616041) Fsck?-2)
>>
>> [...]
>>
>>>>> known problem with 2.6.38.X?
>>>>
>>>> Yes, this is known and old problem.
>>>> This is not specific to compression.
>>>
>>> ok, and how serious?
>>
>> Serious for what?
>> Reiser4 in the current state is not suitable
>> for production file servers. For home desktop -
>> may be..
>>
>>
>>    I am going to let fsck loose as soon as the first
>>
>>> partition is done. Should I prepare for some major cf?
>>
>> I _can_ reproduce this problem.
>> I don't need any extra-stuff.
>
> and I don't expect you to.
>
> well, fsck worked.
>
> The partition was md1 - which means /var, which also houses portage tree on my
> setup and some other vital stuff.
>
> The first run with --build-fs failed with an 'unknown plugin id' error
> finishing with an 'operational error'.


This looks like bug in fsck.
Not related to the crash you have reported though..


> Secound run with --build-fs was successfull with only some files in
> lost+found. The important stuff seems to be there.
>
> R4 worked for me fine for a long time. But it seems like I should migrate the
> more important partitions away from it.

I'll report as soon as I find the problem.

Thanks,
Edward.
