From: Joe Feise <jfeise@feise.com>
Subject: Re: Reiser4 crash 2.6.16-mm1
Date: Tue, 28 Mar 2006 13:56:36 -0800
Message-ID: <4429B114.1090507@feise.com>
References: <20060327214132.4074.qmail@pv105234.reshsg.uci.edu>	 <C68877DC-ED4F-4827-B6ED-2F5CFEFC8037@smartgames.ca>	 <20060327223214.5291.qmail@pv105234.reshsg.uci.edu>	 <200603280439.k2S4dAql011014@turing-police.cc.vt.edu>	 <F01E6B3F-3EBE-4982-9978-C79554F01FDA@smartgames.ca>	 <4429577C.7020105@ics.uci.edu> <1143573487.2380.1.camel@localhost>	 <442997D9.7000505@namesys.com> <1143578704.2380.9.camel@localhost> <e692861c0603281322i4d9191f2s29799e7c27c6d3d8@mail.gmail.com>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28395-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0603281322i4d9191f2s29799e7c27c6d3d8@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, reiserfs-list@namesys.com

Gregory Maxwell wrote on 03/28/06 13:22:

> On 3/28/06, Jonathan Briggs <jbriggs@esoft.com> wrote:
> 
>> But for a production machine that is "producing" something of value, the
>> extra cost should not be an issue.  RAM errors are so subtle and so hard
>> to find that ECC is of far more value than RAID.  It is obvious when
>> your disk fails.
>>
>> An extra high bit in a credit transaction could cost you $16,384 and you
>> might not ever realize what happened. :)
>>
>> Anyway, off topic, but ECC is highly recommended.
> 
> And with the amount of memory that people are putting in modern system
> 1 bit events should be happening on a approx weekly basis.
> 
> ECC may be more expensive but it doesn't make memory more expensive
> than it was just a few years ago.... you really should have it.


I agree, and the system in question has ECC RAM.
The additional cost is not such a big issue anyway... I have SCSI disks (no
RAID, though) in there, and I could get at least 3 times the capacity for the
same price if I was using IDE...

-Joe
