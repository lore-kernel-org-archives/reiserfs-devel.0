From: Kerin Millar <kerin@recruit2recruit.net>
Subject: Re: Data-logging and md as / fs bug
Date: Fri, 9 May 2003 11:17:58 +0000
Message-ID: <20030509111758.7eda9d58.kerin@recruit2recruit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14040-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: mason@suse.com

Hello,

I apologise that this reply isn't threaded - as I have only just joined the list, I wasn't able to observe the correct value for the necessary "In-Reply-To:" field! Anyway ...

> On Wed, 2003-05-07 at 11:23, Chris Mason wrote:
> 
> [ md complains about busy devices on reboot ]
> 
> > Ok, it's probably because of the way the journal relocation code grabs
> > the journal device.  Since root doesn't really get fully unmounted we've
> > probably got a reference open and that is upsetting the md code.
> > 
> > The right fix is probably to skip the bdget when the journal device is
> > not external , and just set journal->j_dev_bd to super->s_bdev.
> 
> Hopefully 03-relocation-8.diff fixes this.  The incremental is below if
> you'd like to give it a try, but use with caution as I haven't tested on
> an md root device here.

Chris, I had exactly the same problem (with Marc-Christian Peterson's WOLK kernel to be precise). The problematic dmesg upon a reboot (and other configuration information can be seen here at the time of writing):

  http://wolk.sourceforge.net/people/Kerin Millar/server/

Well, Marc notified me about your patch and I tried it. I am very pleased to say that it works - thank you! I am extremely grateful. It is most satisfying to put this irksome issue to rest once and for all, and both the cause and the solution are very interesting. I can now comfortably use my preferred filesystem in the context for which I had intended!

I still get a device/resource busy error message, but I suspect that has more to do with some flaws in the init scripts of my distribution than anything else. In any case, no resync of my software RAID-5 array is initiated upon reboot.

Thanks again - to use an American colloquialism, you rock!

Regards,

--Kerin Millar
