From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: Copy time comparison 2.4.20-pre6 <-> 2.4.19+data-logging
 (was:Compatibility of  current 2.4.19.pending ...)
Date: Tue, 17 Sep 2002 15:56:13 +0200
Message-ID: <3D87347D.8030504@mb.tu-ilmenau.de>
References: <3D7FDEA5.7040806@mb.tu-ilmenau.de> <3D81076E.6090408@mb.tu-ilmenau.de> <20020913113735.A6022@namesys.com> <3D826FB9.7030909@mb.tu-ilmenau.de> <20020914130239.D26664@namesys.com> <3D867C14.5060404@mb.tu-ilmenau.de> <20020917103321.C25766@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 09/17/2002 08:33 AM, Oleg Drokin wrote:
> Hello!
> 
> On Tue, Sep 17, 2002 at 02:49:24AM +0200, Manuel Krause wrote:
> 
> 
>>>What tool do you use for backup?
>>
>>Hey, Oleg, you should know this; I stayed with my simple but useful 
>>scripts using "cp -ax A/. B/" for testing reiserfs performance on this 
>>command related to my reiserfs partitions' content. That content is not 
> 
> 
> I am just making sure.
> 
> 
>>>Also very huge difference is seen when creating holes ;)
>>>e.g compare time of seeking to 128Gb and writing one byte between
>>>2.4.20-pre7 and 2.4.20-pre6 ;)
>>>Code for that was once posted on our mailing list.
>>>When you will feel that 2.4.20-pre7 hanged, don't trust that feeling
>>>and wait till the end of operation. ;)
>>
>>You're kind of joking?! "time <command>" should show the total lack of 
>>time related performance, when [throughput] is divided by [time] or 
> 
> 
> I must be missing something, but why do you want to divide throughput by time?
> throughput is amount of data divided by time.

Sorry, my wrong words. I meant the amount of data devided by time.

> 
> 
>>not?! I calculated these values manually based upon the timings & df 
>>values after copying. Yes, I want to show my personal engagement for the 
>>reiserfs community, too.
> 
> 
> Hm. Are you sure you are hitting write-speed limit?
> May be you are read-speed bounded? Can you please check that?
> 

How can I check this? E.g. with some dd process? I just don't know.

Thanks,

Manuel

