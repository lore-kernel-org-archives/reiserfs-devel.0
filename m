From: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: Bug report: reiserfsck --rebuild-tree not progressing
Date: Tue, 11 Apr 2006 13:22:11 +0200
Message-ID: <443B9163.1090905@muenning.com>
References: <b19177749f9fd8399d24c21c4f355efd@pandora.com> <20060411072150.GA21772@favonius> <B3A1FB37-26AC-49F0-8CDB-A14FC93BF021@pandora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28479-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <B3A1FB37-26AC-49F0-8CDB-A14FC93BF021@pandora.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tyler Phelps <tyler@pandora.com>
Cc: reiserfs-list@namesys.com, sysadmin@pandora.com

Hi!

I had the same problem about a year ago with a 0.8TB drive, you may
check some list archives for the details.

The solution was a patch to the reiserfsprogs which was then
incorporated in version 3.6.19. I am not familiar with the details as I
only supplied the information and Vladimir did the work but I can only
repeat what was said - abort current fsck and retry with latest tools
(3.6.19 should be sufficent, I can't tell about 3.6.20).

As for your concerns, it's correct that when you abort the current fsck
it will result in an unmountable FS but you can repair it with another
run. I doubt there is any way to make the current fsck to contnue except
maybe some weird magic hack into the running program ;-). If there are
chances to loose data in this process - I'm not the expert but I think
an abort is not that critical - at least at that stage where reiserfsck
is in an endless loop. With my problem I had some minor data corruption
issues afterwards but I think that was because of the primary fault -
the RAID controller had RAM errors and the RAID consistency was broken
which resulted in the corrupted FS. Then after several fsck tries,
superblock reconstruction etc. I was surprised how much was still intact
(far less than 1% of data was corrupted) but I think this doesn't apply
to you as it's not any guarantee.

Have a nice day,
Konstantin

Tyler Phelps wrote:
> My questions (and all of the diagnostic information provided) revolve 
> around a specific process of reiserfsck, using the version that I 
> specified, which is still running.  The only way that I can try a new 
> version is to abort the current fsck operation... doing that 
> essentially invalidates all of the questions that I've asked.
> 
> I'm reluctant to abort the current process.  My primary reason for  this
> is that I have no way of knowing if aborting the current fsck  will
> cause further damage.  After all, the man page states, "Once  reiserfsck
> --rebuild-tree is started it must finish its work (and you  should not
> interrupt it), otherwise the filesystem will be left in  the unmountable
> state to avoid subsequent data corruptions."  Second,  I don't know if
> anything is even wrong with the way that things are  "progressing" with
> the current process... hence the reason for my  original questions.
> 
> -Tyler
> 
> On Apr 11, 2006, at 12:21 AM, Sander wrote:
> 
>> Tyler Phelps wrote (ao):
>>
>>> Package: reiserfsprogs
>>> Version: 1:3.6.17-2
>>
>>
>> Can you try a newer version?
>> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz
>>
>> According to http://marc.theaimsgroup.com/?t=114235160800008&r=1&w=2
>> 3.6.20 also exist, but I cant find it.
>>
>>     Good luck, Sander
>>
>> -- 
>> Humilis IT Services and Solutions
>> http://www.humilis.net
