From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH] new data logging and quota patches available
Date: Thu, 13 Mar 2003 03:01:54 +0100
Message-ID: <3E6FE692.4040907@mb.tu-ilmenau.de>
References: <1045870331.16048.325.camel@tiny.suse.com>	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>	 <1045926958.16042.366.camel@tiny.suse.com>	 <1045930351.16042.377.camel@tiny.suse.com>	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>	 <1046020695.16048.409.camel@tiny.suse.com>	 <3E59787F.2030009@mb.tu-ilmenau.de>	 <1046095718.16047.440.camel@tiny.suse.com>	 <3E5A5A31.5070008@mb.tu-ilmenau.de> <3E5A9A7A.5040806@mb.tu-ilmenau.de>	 <3E5F196C.1040001@mb.tu-ilmenau.de>	 <1046439149.2163.21.camel@tiny.suse.com>	 <3E66B73D.6030008@mb.tu-ilmenau.de>	 <1046922372.2161.275.camel@tiny.suse.com> <3E66C88E.40207@mb.tu-ilmenau.de>	 <3E69FA70.5030601@mb.tu-ilmenau.de>	 <1047227975.8215.150.camel@tiny.suse.com>	 <3E6B74C0.5050702@mb.tu-ilmenau.de>	 <1047230647.8219.161.camel@tiny.suse.com>	 <3E6B7C61.9050405@mb.tu-ilmenau.de> <1047415578.8215.383.camel@tiny.suse.com> <3E6F4777.1040802@mb.tu-ilmenau.de> <3E6F899C.8090108@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On 03/12/2003 08:25 PM, Hans Reiser wrote:
> Manuel Krause wrote:
> 
>> On 03/11/2003 09:46 PM, Chris Mason wrote:
>>
>>> [ slow down between 2.419 data logging and 2.4.21-pre data logging ]
>>>
>>> Ok, could you please apply the search_reada-4 patch I sent and do your
>>> benchmark again on 2.4.21-preX with these mount options:
>>>
>>> mount -o alloc=old_way:concentrating_formatted_nodes,notail
>>>
>>> It's about 10% faster here, but my dataset is slightly different.
>>>
>>
[ timing data ]
>>
>> * What means a performance increase of 2.4.21-pre5 with [D] vs. without
>>    search_reada-4 [A] by  ~16%  !!!
>> * The difference of the special mount option [C] against my default [D]
>>   is about 0.3%  ;-))
>> * With search_reada-4  2.4.21-pre5 [D] only looses ~3.6% throughput rate
>>    against 2.4.19 [B]
>>  ...in this test.
>>
>>
>> Do you think the group-alloc-4 patch would increase throughput with 
>> this test?
>>
>> Thank you for your great work,
>>
>> Manuel
>>
>>
> Can you state what test is being performed, what the hardware is, etc.  
> In general, we need benchmarks that can be collected onto webpages and 
> reviewed a year or two later when we can barely remember why we did or 
> did not do some design decision.
> 

Hi Hans,

I think the way I "test" (is: simple timed backup-copy / defrag cycle) 
was effectively clarified in this thread.

Last autumn I wanted to add the desired system info to the ReiserFS 
regarding parts of my homepage but skipped it at some point simply 
lacking time...

You'll receive a compiled file of that info you might want, with the 
results I snipped above and the file size distribution data in the 
followup mail in private so you could give it to the persons of your 
team who collect it for the archives and/or prepare it for publishing. 
If you need differnt or more information, please, let me know.

Best regards,

Manuel

