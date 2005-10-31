From: "Steve Olivieri" <steve86@WPI.EDU>
Subject: Re: Reiser4 SCSI Bug?
Date: Mon, 31 Oct 2005 13:31:34 -0500 (EST)
Message-ID: <55643.130.215.239.65.1130783494.squirrel@webmail.WPI.EDU>
References: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU>   
    <37550.130.215.239.65.1130545649.squirrel@webmail.WPI.EDU>   
    <43639DFA.1020107@namesys.com> <43640228.7080807@wpi.edu>   
    <4364033C.5010200@namesys.com> <436406DF.8070104@wpi.edu>   
    <43643C7E.4080703@namesys.com> <43641554.8040500@wpi.edu>   
    <43646B4A.7060301@namesys.com>
    <1993.130.215.169.201.1130725109.squirrel@webmail.WPI.EDU>
    <43659421.1050608@wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26745-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43659421.1050608@wpi.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Isaac Chanin <chanin@WPI.EDU>
Cc: Steve Olivieri <steve86@WPI.EDU>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>, vs <vs@thebsh.namesys.com>

> Steve Olivieri wrote:
>> Hey guys,
>>
>> I had a system running on reiser4 with Isaac's patch yesterday and all
>> we
>> going well.  Of course, then I deleted /var/db and portage went crazy
>> and
>> I decided to build the system again.
>>
>> I attempted to do so today, using the same kernel as yesterday, but now
>> I'm getting the same error as before.  To be a bit more specific,
>>
>> reiser4[pdflush(218)]: writeout
>> (fs/reiser4/vfs_ops.c:197)[nikita-31001):
>> code: -12 at fs/reiser4/wander.c:1250
>> WARNING: Flush failed: -12
>>
>> I used to get a number of these errors (in fact, they continued until I
>> would reboot with SysRq keys) but now I only seem to get one before
>> everything hangs and I'm forced to reboot.
>>
>> Hope to see a good fix soon,
>>
>>  Steve
>>
>>
>
>
> Hey Steve,
>
> Not sure why that error would crop up again.  In any case, the attached
> patch uses the macro, moves the min check out of the loop, and fixes all
> of the occurances - so, it may be worth giving a try.
>
> Isaac
>

Hallo!

Isaac, that patch works much better.  My system seems to be as stable as
ever with reiser4.  I'll test the new patch that was sent to me later today
and get back to you guys with some results.

Thanks again for the fix.
Steve


