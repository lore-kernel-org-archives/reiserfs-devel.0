From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: "Unformat" a ReiserFS partition : a testimony :-)
Date: Tue, 25 Mar 2003 03:03:58 +0100
Message-ID: <3E7FB90E.7010408@mb.tu-ilmenau.de>
References: <3E7F5E33.4020709@info.ucl.ac.be> <3E7F9FD1.7060801@namesys.com> <3E7FA75F.3000808@mb.tu-ilmenau.de> <3E7FB063.2010205@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13364-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/25/2003 02:26 AM, Yury Umanets wrote:
> Manuel Krause wrote:
>> On 03/25/2003 01:16 AM, Yury Umanets wrote:
>>> Nicolas Vanderavero wrote:
[...]
>>>
>>>> while reinstalling a Debian on a new hard drive, I made the mistake 
>>>> to format in reiserfs my good old /home which was on /dev/sda7 
>>>> instead of formatting the new /dev/hda7. Gasp ! Eight gigabytes lost 
>>>> ...
>>>>
>>>> Or ... maybe it was not totally lost :-) I immediately made a dump 
>>>> of the partition with 'dd' and started grepping some known text on 
>>>> it. It seemed that no data was really lost. I didn't know what to 
>>>> do. So I read the man pages and found the reiserfsck command quite 
>>>> interesting :-)
>>>
>>> You have lost the super block and probably old root node. I said 
>>> "probably" because it might be not used in teh time you did format.
>>
>> Can you be more clear on this? In which cases does SB get used? Or, 
>> how would this change Nicholas scenario in practical use? E.g. would a 
>> blank mount (just mount+umount) change the story so that the partition 
>> would not be recoverable? 
> 
> I'm sure that usual mount+umount cannot do bad things like this. But why 
> did you ask me about that? I mean that Nicolas has explicitly formatted 

No, sorry, for bothering again with my unclear questions.

I meant mounts happening just after a mkreiserfs run in failure and
wanted to make sure for myself that they don't destroy more.
(Rest of the story: Acoustically a mount after mkreiserfs does MORE on
disk than a mount of a previously mounted fs. So I just only thought of
a first mount changing Nicholas' circumstances before successful recovery.)

> his partition by means of using mkreiserfs. And I know that mkreiserfs 
> creates new super block at 16 block and also leaf for root node, first 
> bitmap and journal.
> 
> As old bitmap is corrupted, --rebuild-tree -S will be apparently needed.
[...]
> So the plan is the following:
> 
> (1) Backup your data.
> (2) Rebuild super block if it had some special like relocated journal.
> (3) Rebuild tree with partition scanning --rebuild-tree -S.
> 
> This should reanimate your old partition but expect, that you will found 
> some of your data in the /lost+found directory.
[...]

Thank you,

Manuel

