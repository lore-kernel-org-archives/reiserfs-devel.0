From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Re: Odd data corruption problem with LVM/ReiserFS
Date: Tue, 22 Feb 2005 20:49:00 +0100
Message-ID: <20050222194900.GB10968@schmorp.de>
References: <93ca3067050220212518d94666@mail.gmail.com> <4219C811.5070906@domdv.de> <20050222190149.GB9590@schmorp.de> <421B8A69.8000903@domdv.de>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <421B8A69.8000903@domdv.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Steinmetz <ast@domdv.de>
Cc: Alex Adriaanse <alex.adriaanse@gmail.com>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tue, Feb 22, 2005 at 08:39:21PM +0100, Andreas Steinmetz <ast@domdv.de> wrote:
> To clarify: there were no disk I/O errors, only I/O errors were reported 
>  by find during operation so it is definitely filesystem corruption 
> that is  going on here.
> Though find performs heavy read activity there could well be heavy write 
> activity be involved due to atime updates so this fits your description.

That wouldn't fill my definition for "heavy", but as it is a race
somewhere, it can happen undr many circumstances, I guess.

> >A reboot fixes this for both ext3 and reiserfs (i.e. the error is gone).
> >
> 
> Well, it didn't fix it for me. The fs was trashed for good. The major 
> question for me is now usability of md/dm for any purpose with 2.6.x. 
> For me this is a showstopper for any kind of 2.6 production use.

Well, I do use reiserfs->aes-loop->lvm/dm->md5/raid5, and it never failed
for me, except once, and the error is likely to be outside reiserfs, and
possibly outside lvm.

However, your case *is* different, as corruption wasn't permament for me,
so chances are that you are hitting sth. else.

Of course, many people find 2.6 too unstable for production use (remember
2.4.x, it was the same), and the most important rule is: if it fails for
you, it's a showstopper.

Also, mild corruption is likely to be more disastrous to reiserfs as it
uses a much denser representation on disk (in other words: it uses space
more efficiently, but that comes at the price of redundancy).

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
