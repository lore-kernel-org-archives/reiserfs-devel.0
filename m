From: Andreas Steinmetz <ast@domdv.de>
Subject: Re: Odd data corruption problem with LVM/ReiserFS
Date: Tue, 22 Feb 2005 20:39:21 +0100
Message-ID: <421B8A69.8000903@domdv.de>
References: <93ca3067050220212518d94666@mail.gmail.com> <4219C811.5070906@domdv.de> <20050222190149.GB9590@schmorp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050222190149.GB9590@schmorp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pcg@goof.com
Cc: Alex Adriaanse <alex.adriaanse@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

pcg( Marc)@goof(A.).(Lehmann )com wrote:
> I use both reiserfs and ext3 on lvm/dm on raid.
> 
> Both filesystems have issues when restoring from backup (i.e. very heavy
> write activity).
> 
> I did report this to the linux kernel, and got as reply that there are
> indeed races *somewhere*, but as of yet there is no fix.
> 
> The symptoms are _not_ I/O errors (but until I see logs I wouldn't believe
> you that there are real I/O errors), but usually too-high block numbers.
> 

To clarify: there were no disk I/O errors, only I/O errors were reported 
  by find during operation so it is definitely filesystem corruption 
that is  going on here.
Though find performs heavy read activity there could well be heavy write 
activity be involved due to atime updates so this fits your description.

> A reboot fixes this for both ext3 and reiserfs (i.e. the error is gone).
> 

Well, it didn't fix it for me. The fs was trashed for good. The major 
question for me is now usability of md/dm for any purpose with 2.6.x. 
For me this is a showstopper for any kind of 2.6 production use.
-- 
Andreas Steinmetz                       SPAMmers use robotrap@domdv.de
