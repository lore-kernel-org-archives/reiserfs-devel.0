From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Thu, 06 Mar 2003 05:03:26 +0100
Message-ID: <3E66C88E.40207@mb.tu-ilmenau.de>
References: <1045870331.16048.325.camel@tiny.suse.com>	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>	 <1045926958.16042.366.camel@tiny.suse.com>	 <1045930351.16042.377.camel@tiny.suse.com>	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>	 <1046020695.16048.409.camel@tiny.suse.com>	 <3E59787F.2030009@mb.tu-ilmenau.de>	 <1046095718.16047.440.camel@tiny.suse.com>	 <3E5A5A31.5070008@mb.tu-ilmenau.de> <3E5A9A7A.5040806@mb.tu-ilmenau.de>	 <3E5F196C.1040001@mb.tu-ilmenau.de>	 <1046439149.2163.21.camel@tiny.suse.com>	 <3E66B73D.6030008@mb.tu-ilmenau.de> <1046922372.2161.275.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/06/2003 04:46 AM, Chris Mason wrote:
> On Wed, 2003-03-05 at 21:49, Manuel Krause wrote:
> 
>>On 02/28/2003 02:32 PM, Chris Mason wrote:
>>
>>>>>Comparing data-logging-35 vs data-logging-36+kinoded-9+dirty_inode I 
>>>>>have a performance increase of 2.5% for the new data-logging. Like you 
>>>>>say above.
>>>>
>>>>But... though you were right with 2.4.21 data-logging performance 
>>>>relations: --> What was causing that performance loss between 2.4.19 
>>>>+data-logging and now???
>>>>
>>>
>>>Did you exclude your changing dataset as a potential cause?  If not I'm
>>>very interested in the details.
>>
>>Please, tell me how to respond to this question!
>>
> 
> Sorry, I wasn't clear.  It sounds like you've got two very different
> copy speeds on two possibly different data sets.  The problem will be
> significantly easier to debug and discuss if you boot a 2.4.19 + data
> logging kernel, do the test, and then do the test again on a 2.4.21-pre
> data logging kernel.
> 
> I know this is a pain, I want to reduce the number of variables in
> place.
> 

Yes. That all is why I asked. I'll try to find and retest the old things 
tomorrow night. The new setup will go fine with 2.4.21-pre5 ? Or is this 
one more step of irritation? Mmm. Or should I wait for the patches you 
announce below?

Thank you, good "night",

Manuel

> 
>>P.S.: Do the data-logging things go to namesys now? (Me, watching Olegs 
>>recent engagements...)
> 
> Oleg is making patches for the -ac series.  He also merged a special set
> for Philippe, they pay namesys for support ;-)

My additional thanks go to Philippe ! :-)))

> I'm remerging my work over the last week and should have a new set of
> patches out soon.
> 
> -chris


