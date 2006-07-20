From: David Masover <ninja@slaphack.com>
Subject: Re: create very large file system
Date: Thu, 20 Jul 2006 12:32:36 -0500
Message-ID: <44BFBE34.80001@slaphack.com>
References: <e9l7bh$134$1@sea.gmane.org> <200607191657.38644.zam@namesys.com>	 <20060720062646.GA6174@schatzie.adilger.int>	 <200607201317.54566.chrivers@iversen-net.dk>	 <1153412575.9802.7.camel@localhost> <3aa654a40607200956j37aeed0o66218c7ff94d815a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29091-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40607200956j37aeed0o66218c7ff94d815a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Avuton Olrich <avuton@gmail.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, Christian Iversen <chrivers@iversen-net.dk>, Alexander Zarochentsev <zam@namesys.com>, reiserfs-list@namesys.com, Mark F <mfaine@knology.net>, Ext3-users@redhat.com

Avuton Olrich wrote:
> On 7/20/06, Jonathan Briggs <jbriggs@esoft.com> wrote:
>> You're not supposed to be doing it that way these days.  RAID autodetect
>> is getting tossed out of the kernel in the future (probably still many
> 
> Bit OT, but is there something that is supposed to replace RAID
> autodetect, or we're just supposed to make initscripts to run mdadm?

I'm not sure, but I suspect it may have something to do with the 
device-mapper.  I know that's what I use for a striped array -- and yes, 
I have to make an initscript -- initrd, because I boot off the thing -- 
to set them up.  The good news is, the detection can be done in userland 
now -- since mine is nvidia raid, I can use dmraid, which runs entirely 
in userland, autodetects from BIOS settings, then sets up a proper 
device-mapper table in the kernel.

Device-mapper doesn't support everything yet (as far as I know), but the 
principle should be about the same for more complex RAID -- some 
userland tool.  There really is no reason for this autodetection to be 
in the kernel.

In the meantime, there may be rough edges...
