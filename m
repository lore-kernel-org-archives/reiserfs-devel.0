From: Hans Reiser <reiser@namesys.com>
Subject: Re: Is it good for a PDA fs?
Date: Sun, 23 Jun 2002 11:18:02 +0400
Message-ID: <3D15762A.3000507@namesys.com>
References: <20020622115207.E23457@gerf.org> <20020622175746.I13075@parcelfarce.linux.theplanet.co.uk> <3D14B8E9.4020808@namesys.com> <20020622230748.A1981@namesys.com> <3D14E47E.5080300@namesys.com> <20020623105057.A5090@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10801-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Dukes <pakrat@www.uk.linux.org>, The Doctor What <docwhat@gerf.org>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Sun, Jun 23, 2002 at 12:56:30AM +0400, Hans Reiser wrote:
>
>  
>
>>>CF is different story. They fight level of wearing in underlying layer.
>>>      
>>>
>>Meaning that they hide it in the device driver, and the FS does not need 
>>to be aware of it?
>>    
>>
>
>Yes. Otherwise CF media would be pretty much useless in conjunction with VFAT.
>
Good thinking on their part.  Sure makes our job easier....

>  
>
>
>  
>
>>>Building ARM kernels is easy.
>>>I always build kernels for my ARM toys myself.
>>>and I bet that Zaurus kernel is based off some -rmk kernel with
>>>may be minor patches (sources of these should be available at Sharp
>>>of course).
>>>So getting (making) new kernel should be trivial.
>>>      
>>>
>>I think I probably care more about downloading and trying the latest 
>>kalendar than installing a new kernel on it.;-)   It is nice to have ssh 
>>    
>>
>
>Yes, exactly. I do not see how you (or any other user) would benefit from
>using anything but vfat in CF, but disadvantages are pretty clear.
>
Space would be saved if the journal was shrunk in size....

>
>Bye,
>    Oleg
>
>
>  
>


-- 
Hans



