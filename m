From: Spam <spam@tnonline.net>
Subject: Re: nvram to protect fs during power loss?
Date: Fri, 31 Dec 2004 18:28:49 +0100
Message-ID: <1942769981.20041231182849@tnonline.net>
References: <1062660450.20041231004008@tnonline.net>
 <20041231094126.GV1586@hvs.envisage.co.za>
 <273759260.20041231134532@tnonline.net>
 <20041231164620.GB1586@hvs.envisage.co.za>
 <ef5e15ed041231085194d6dd9@mail.gmail.com>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ef5e15ed041231085194d6dd9@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com



> Why not just purchase a UPS and place it on your system?  Seems like
> it be a lot cheaper.  That way the system can safely shut down in case
> of a power outage?

  How can buying additional hardware be cheaper? Do you expect most
  users, including Laptop users, to use UPS?


> On Fri, 31 Dec 2004 18:46:20 +0200, Hendrik Visage
> <hvisage@envisage.co.za> wrote:
>> On Fri, Dec 31, 2004 at 01:45:32PM +0100, Spam wrote:
>> >
>> >   Yes, I know that good hardware already do use battery backups and
>> >   similar. But I was talking about normal consumer hardware; desktops,
>> >   laptops, etc.
>> 
>> Okay, if you want to use the NVRAM on a desktop, it's waaaaayyyyyy too little
>> to even consider. You'll need NVRAM (battery backed up etc.) in the
>> order of Megabytes to make it of any use Spam.
>> 

  I thought NVRAM already was battery backed up or was as flash?

  In any case. It was said on this mailing list that because of the
  write cache we do not know if the journal was written before the
  actual data.

  With a simple pointer we can know the latest journal entry that was
  surely saved before the power loss (you can update the NVRAM when
  you tell the disk to sync etc). When you reboot the the fsck tools
  can scan all the journal entries that occurred after to verify that
  the data is on disk or not. This must be much faster than doing a
  full scan of the entire filesystem? How can disk require several
  megabytes? I am not talking about storing the journals in the NVRAM.

  ~S
  
-- 

