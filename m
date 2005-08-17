From: David Masover <ninja@slaphack.com>
Subject: Re: where is the journal kept?
Date: Tue, 16 Aug 2005 19:02:14 -0500
Message-ID: <43027E86.1080900@slaphack.com>
References: <20050815115310.GA28630@tranquility.scriptkitchen.com>	 <43009184.2080201@namesys.com> <200508150812.40382.pat@patdouble.com>	 <4300A603.2050602@namesys.com>	 <d9a6586e05081509195017d679@mail.gmail.com>	 <4300D240.7010109@namesys.com>	 <d9a6586e0508151108431fabba@mail.gmail.com>	 <4302458E.9070604@namesys.com>	 <d9a6586e05081613275071c00a@mail.gmail.com>	 <430268F4.8020100@slaphack.com> <d9a6586e050816162322c99721@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25531-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <d9a6586e050816162322c99721@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Shawn Rutledge <shawn.t.rutledge@gmail.com>
Cc: reiserfs-list@namesys.com



Shawn Rutledge wrote:
> On 8/16/05, David Masover <ninja@slaphack.com> wrote:
> 
>>Something Reiser4 does very well.  If you have enough RAM, it's possible
>>to avoid any reads/writes at all -- given enough RAM, it behaves as a
> 
> 
> Well that's cool if it's true.  But IMO for this application it ought
> to have a deadline - after the writes have been pending for 10 seconds
> or so, go ahead and commit all of them, in case I forget to unmount
> before I remove the card.

Not that it'd be a bad feature, but if you forget to unmount before you 
remove the card, you're going to lose something.  Even Windows now has a 
  form of unmounting -- you have to click "safely remove this device" 
before you take a USB keychain out.

>>ramdisk, which is why I wish I knew how to tell Gentoo to *not* mount
>>tmpfs over /dev.
>>
>>One other thing you might try is disabling the write-twice behavior.
>>Currently, if you've got a huge, fairly well-sorted file that you're
>>making lots of tiny writes to, such as a database, it makes sense to
>>write twice to keep the file from getting fragmented.  But,
>>fragmentation isn't nearly as much an issue on truly random-access
>>media, so you'd want the default small-file behavior to be used
>>everywhere -- first write the data to the new location, then atomically
>>update the pointer to it as you deallocate the old location.
> 
> 
> What would you change to do that?

Because you want to write less.  Normally, when there's a big file, 
everything gets written twice, once to the "journal", then once back to 
the file, so that the file stays in the same place on disk and doesn't 
get fragmented.

But if we're talking about a flash device, fragmentation doesn't matter 
so much, and you want to minimize the number of writes, so if you have a 
small write in the middle of a big file, you write that once to the 
"journal", and that's it -- once it's been successfully written, that 
chunk of "journal" becomes the new location for that chunk of the file.

Obviously, you wouldn't have this behavior turned on by default.  On 
desktop machines, you want to let the FS decide when to write twice. 
But on a flash device, at least as a mount option, you want to force 
everything to be written at most once unless something fails.

