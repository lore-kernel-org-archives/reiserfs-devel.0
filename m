From: Tim Small <tim@digitalbrain.com>
Subject: Re: access beyond end of device again
Date: Wed, 10 Jul 2002 19:04:09 +0100
Message-ID: <3D2C7719.8060907@digitalbrain.com>
References: <1951319530634.20020624073524@redefine.org> <Pine.LNX.4.44.0206250034070.28871-100000@avon.timetraveller.org> <20020624184843.A896@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I've seen this sort of problem before, with a 160G disk.  I'd installed 
a kernel with IDE patches to enable access to all 160G of the device, 
and created a reiserfs on it.  Then one of my colleagues decided to 
install our 'standard' kernel on it.  Sadly, the entire filesystem was 
turned to cheese, and reiserfsck didn't get much back.

However, this looks to be a LONG way beyond the end of the device, but 
"cat /proc/partitions" might still be worth doing...


Tim.

Oleg Drokin wrote:

>Hello!
>
>On Tue, Jun 25, 2002 at 12:37:02AM +1000, Robert Brockway wrote:
>  
>
>>>I'm getting these errors again:
>>>  attempt to access beyond end of device
>>>  38:01: rw=0, want=2052028788, limit=58633312
>>>      
>>>
>>What sort of device is this supposed to be? :)  38:01 is either a "Myricom 
>>PCI Myrinet board" or something "reserved for Linux/AP+" (and I'm assuming 
>>we're talking about a block device rather than a character device here :)
>>    
>>
>
>Numbers printed are in hex, so this is:
>    block       Fifth IDE hard disk/CD-ROM interface
>                  0 = /dev/hdi          Master: whole disk (or CD-ROM)
>                 64 = /dev/hdj          Slave: whole disk (or CD-ROM)
>
>                Partitions are handled the same way as for the first
>                interface (see major number 3).
>
>Bye,
>    Oleg
>  
>


