From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Thu, 06 Mar 2003 03:49:33 +0100
Message-ID: <3E66B73D.6030008@mb.tu-ilmenau.de>
References: <1045870331.16048.325.camel@tiny.suse.com>	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>	 <1045926958.16042.366.camel@tiny.suse.com>	 <1045930351.16042.377.camel@tiny.suse.com>	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>	 <1046020695.16048.409.camel@tiny.suse.com>	 <3E59787F.2030009@mb.tu-ilmenau.de>	 <1046095718.16047.440.camel@tiny.suse.com>	 <3E5A5A31.5070008@mb.tu-ilmenau.de> <3E5A9A7A.5040806@mb.tu-ilmenau.de>	 <3E5F196C.1040001@mb.tu-ilmenau.de> <1046439149.2163.21.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13105-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 02/28/2003 02:32 PM, Chris Mason wrote:
>>>Comparing data-logging-35 vs data-logging-36+kinoded-9+dirty_inode I 
>>>have a performance increase of 2.5% for the new data-logging. Like you 
>>>say above.
>>
>>But... though you were right with 2.4.21 data-logging performance 
>>relations: --> What was causing that performance loss between 2.4.19 
>>+data-logging and now???
>>
> Did you exclude your changing dataset as a potential cause?  If not I'm
> very interested in the details.

Please, tell me how to respond to this question!

I didn't want to _exclude_ it as a potential cause but felt in need to 
write it for the records. The test partition varies from day to day and 
to recreate a fillup rate 71%~73% relating to  my previous tests was 
hard enough. I'm not able to hold a "reiserfs-special-testing-partition" 
on here... Mmh.

Unfortunately I didn't do the file-size-distribution one that time so 
you need to give me further hints on how to test my usual backup copies 
more valuably for you -- but only with these copies.

But whatever I did with that disk content at ~72% usage and staying 
error-free -- YOU can't blame it to the content distribution. Not 19% 
degression in copy rate since 2.4.19. Explain it, please!

... But now we have 2.4.21-pre5 with direct-io and iget5-patches already...


Thank you very much,

Manuel

P.S.: Do the data-logging things go to namesys now? (Me, watching Olegs 
recent engagements...)

