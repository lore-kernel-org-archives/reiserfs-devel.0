From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Thu, 04 Jul 2002 02:28:31 +0200
Message-ID: <3D2396AF.8020508@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>	<3CFC1CB5.8040102@mb.tu-ilmenau.de>	<1023	 	157228.31475.38.camel@tiny>	<3CFC33F2.7080009@mb.tu-ilmenau.de>	<1023196345.	 31682.81.camel@tiny>	<3CFE7EFB.6080203@mb.tu-ilmenau.de>	<3CFE8234.7010006@mb.tu-ilmenau.de>	<1023322167.2920.772.camel@tiny> 	<3D07CBE7.5080701@mb.tu-ilmenau.de> <1024274859.11086.68.camel@tiny> 	<3D0D2DEE.7080909@mb.tu-ilmenau.de>  <1024340679.18666.36.camel@tiny> 	<1025272280.1685.6.camel@tiny>  <1025633764.5878.432.camel@tiny> <1025729771.5878.598.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10913-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 07/03/2002 10:56 PM, Chris Mason wrote:
> On Tue, 2002-07-02 at 14:16, Chris Mason wrote:
> 
>>Hello again,
>>
>>Yet another data logging patch is available (once the mirror updates)
>>at:
>>
>>ftp.suse.com/pub/people/mason/patches/data-logging
>>
>>We're getting closer to stability here, so I'm very interested in
>>workloads where the patch performs poorly.
>>
>>New in 03-beta-data-logging-13.diff:
> 
> 
> And a buffer list corruption bug of some kind.  I've pulled
> beta-data-logging-13.diff until I track the bug down.  I'm heading off
> to the mountains for the 4th of July holiday, so it be fixed until
> monday.
> 
> -chris
> 
> 
> 

So far the 13 prerelease works fine under rootflags boot and 
mount/remount option "data=ordered" on here.

Can you, please, answer my old questions as of:

On 06/25/2002 02:55 AM, Manuel Krause mainly wrote (but too much more):

 > Is the rootflag needed any more? Does your patchset work with all
 > pending ReiserFS patches together, now?


Thanks,

I don't get a performance decrease with "13", and: Is it really 
dangerous to use "13" in this mode of operation?


Manuel

