From: Andreas Steinmetz <ast@domdv.de>
Subject: Re: Odd data corruption problem with LVM/ReiserFS
Date: Mon, 21 Feb 2005 12:37:53 +0100
Message-ID: <4219C811.5070906@domdv.de>
References: <93ca3067050220212518d94666@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <93ca3067050220212518d94666@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Adriaanse <alex.adriaanse@gmail.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Alex Adriaanse wrote:
> As far as I can tell all the directories are still intact, but there
> was a good number of files that had been corrupted.  Those files
> looked like they had some chunks removed, and some had a bunch of NUL
> characters (in blocks of 4096 characters).  Some files even had chunks
> of other files inside of them!

I can second that. I had the same experience this weekend on a 
md/dm/reiserfs setup. The funny thing is that e.g. find reports I/O 
errors but if you then run tar on the tree you eventually get the 
correct data from tar. Then run find again and you'll again get I/O errors.

> I did a reiserfsck (3.6.19) on /var, which did not report any problems.

You need to run 'reiserfsck --rebuild-tree' and see what happens :-(

> Anyway, what do you guys think could be the problem?  Could it be that
> the LVM / Device Mapper snapshot feature is solely responsible for
> this corruption?  (I'm sure there's a reason it's marked
> Experimental).

I don't think so - I changed from reiserfs to ext3 without changing the 
underlying dm/raid5 and this seems to work properly.

I can furthermore state that reiserfs without dm/md does work correctly 
as I use reiserfs on a ieee1394 backup disk (that saved me from terrible 
trouble).

Currently I can only warn to not use reiserfs with dm/md on 2.6.
-- 
Andreas Steinmetz                       SPAMmers use robotrap@domdv.de
