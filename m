From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Re10: Question about reiser performance - linux-2.6.37 crash
 reproduced
Date: Fri, 04 Mar 2011 15:30:49 +0100
Message-ID: <4D70F799.7020503@gmail.com>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D702329.27637.A07FE@jafojtik.seznam.cz>, <4D702444.6000806@gmail.com> <4D702671.25218.16D74A@jafojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D702671.25218.16D74A@jafojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaroslav Fojtik <jafojtik@seznam.cz>
Cc: reiserfs-devel@vger.kernel.org

On 03/04/2011 12:38 AM, Jaroslav Fojtik wrote:
> Dear Edward Shishkin,
>
>>> I have improved my stress test and managed to find something with mc
>>> paralelly with data copying.
>>
>> Ok, I'll try to reproduce.
>> Is you "/" on reiser4 partition?
>
> No, I mount different drive as /J/.
> I have no courage to perpentually reinstall OS.
>
> Try to search paralelly with several "mc" and locate some string in files.
> And copy something to a drive.


Hmm.. everything works for me (hp xw 4600).
How much time does it take you to reproduce the problem?
Could you setup a serial console to catch the crash messages?

Thanks,
Edward.

>
> I have hexacore CPU, I do not know whether issue would be reproducible with
> single core unit.
>
> best regards
>     Jara

