From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Sat, 08 Mar 2003 15:13:04 +0100
Message-ID: <3E69FA70.5030601@mb.tu-ilmenau.de>
References: <1045870331.16048.325.camel@tiny.suse.com>	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>	 <1045926958.16042.366.camel@tiny.suse.com>	 <1045930351.16042.377.camel@tiny.suse.com>	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>	 <1046020695.16048.409.camel@tiny.suse.com>	 <3E59787F.2030009@mb.tu-ilmenau.de>	 <1046095718.16047.440.camel@tiny.suse.com>	 <3E5A5A31.5070008@mb.tu-ilmenau.de> <3E5A9A7A.5040806@mb.tu-ilmenau.de>	 <3E5F196C.1040001@mb.tu-ilmenau.de>	 <1046439149.2163.21.camel@tiny.suse.com>	 <3E66B73D.6030008@mb.tu-ilmenau.de> <1046922372.2161.275.camel@tiny.suse.com> <3E66C88E.40207@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/06/2003 05:03 AM, Manuel Krause wrote:
> On 03/06/2003 04:46 AM, Chris Mason wrote:
> 
>> On Wed, 2003-03-05 at 21:49, Manuel Krause wrote:
>>
>>> On 02/28/2003 02:32 PM, Chris Mason wrote:
>>>
>>>>>> Comparing data-logging-35 vs data-logging-36+kinoded-9+dirty_inode 
>>>>>> I have a performance increase of 2.5% for the new data-logging. 
>>>>>> Like you say above.
>>>>>
>>>>>
>>>>> But... though you were right with 2.4.21 data-logging performance 
>>>>> relations: --> What was causing that performance loss between 
>>>>> 2.4.19 +data-logging and now???
>>>>>
>>>>
>>>> Did you exclude your changing dataset as a potential cause?  If not I'm
>>>> very interested in the details.
>>>
>>>
>>> Please, tell me how to respond to this question!
>>>
>>
>> Sorry, I wasn't clear.  It sounds like you've got two very different
>> copy speeds on two possibly different data sets.  The problem will be
>> significantly easier to debug and discuss if you boot a 2.4.19 + data
>> logging kernel, do the test, and then do the test again on a 2.4.21-pre
>> data logging kernel.
>>
>> I know this is a pain, I want to reduce the number of variables in
>> place.
>>
> 
> Yes. That all is why I asked. I'll try to find and retest the old things 
> tomorrow night. The new setup will go fine with 2.4.21-pre5 ? Or is this 
> one more step of irritation? Mmm. Or should I wait for the patches you 
> announce below?
> 

Hi, and sorry for the delay.

So I copied over the same dataset several times. ;-)

The times measured include the umounts of both partitions.
The test dataset was freshly copied to the freshly created
  test FS under the same kernel version before timing.
This time I took the times of two subsequent runs.
The test script does only simple "cp -a ..."

/dev/hda11    5076348   3762908   1313420  75% /mnt/alpha
/dev/hdd11    5076348   3762908   1313440  75% /mnt/beta

2.4.21-pre5 data=ordered [A]
       first run  second run  diff  average    rate
real  9m05.375s   9m23.272s  3.2%  9m14.324s  6.63MB/s
user  0m01.440s   0m01.730s
sys   1m11.640s   1m08.870s

2.4.19 data=ordered [B]
       first run  second run  diff  average    rate
real  7m46.287s   7m34.031s  2.7%  7m40.159s  7.99MB/s
user  0m01.520s   0m01.580s
sys   1m21.920s   1m21.300s


-> I didn't know that subsequent runs on the same conditions
    differ by ~3% ( -> So don't take my statement of the 2.5%
    difference in my previous mail for that serious as I
    only timed one run that time)

-> The throughput rate under 2.4.19 is about 20% higher
    than under 2.4.21-pre5 with this dataset


I hope it's "visible" this time...  ;-))


Best regards,

Manuel



P.S.: Disk data distribution file is available if you want.


Below the list of used patches just to be complete...

[A] Patches for 2.4.21-pre5:
01.m02-akpm-b_journal_head-1.diff
02.m03-relocation-6.diff
03.m04-reiserfs-sync_fs-1.diff
04.m05-data-logging-36.namesys.diff
05.m06-logging-export.diff
06.m06-write_times.diff
07.m09.kinoded-9.diff
08.m11.inode-dirty-for-kinoded.ML.diff
09.iget5_locked_for_datalogging.namesys.noquota.diff
preempt-kernel-rml-2.4.21-pre5-pre1-0.patch

[B] Patches for 2.4.19:
01.change_help_wording.diff
02.change_menu_wording.diff
03.confusing_journal_replay_warning_removal.diff
05.hash_on_empty_fs-1.diff
07.m01-relocation-4.diff
08.m02-commit_super-9-relocation.diff
09.m03-data-logging-25.diff
10.m03-logging-export.diff
11.m04-write_times.diff
12.m05-search_reada-4.diff
preempt-kernel-rml-2.4.19-2.patch


