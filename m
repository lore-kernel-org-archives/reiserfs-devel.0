From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Odd data corruption problem with LVM/ReiserFS
Date: Tue, 22 Feb 2005 20:01:49 +0100
Message-ID: <20050222190149.GB9590@schmorp.de>
References: <93ca3067050220212518d94666@mail.gmail.com> <4219C811.5070906@domdv.de>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <4219C811.5070906@domdv.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Steinmetz <ast@domdv.de>
Cc: Alex Adriaanse <alex.adriaanse@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Mon, Feb 21, 2005 at 12:37:53PM +0100, Andreas Steinmetz <ast@domdv.de> wrote:
> >Anyway, what do you guys think could be the problem?  Could it be that
> >the LVM / Device Mapper snapshot feature is solely responsible for
> >this corruption?  (I'm sure there's a reason it's marked
> >Experimental).
> 
> I don't think so - I changed from reiserfs to ext3 without changing the 
> underlying dm/raid5 and this seems to work properly.

I use both reiserfs and ext3 on lvm/dm on raid.

Both filesystems have issues when restoring from backup (i.e. very heavy
write activity).

I did report this to the linux kernel, and got as reply that there are
indeed races *somewhere*, but as of yet there is no fix.

The symptoms are _not_ I/O errors (but until I see logs I wouldn't believe
you that there are real I/O errors), but usually too-high block numbers.

A reboot fixes this for both ext3 and reiserfs (i.e. the error is gone).

You might want to explore this problem and decide for yourself if it's caused
by I/O errors (in which case you have a disk problem) or "just" filesystem
corruption.

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
