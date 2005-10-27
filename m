From: David Masover <ninja@slaphack.com>
Subject: Re: Fwd: My Dad suggests a redundant copies plugin
Date: Thu, 27 Oct 2005 06:24:03 -0500
Message-ID: <4360B8D3.30607@slaphack.com>
References: <435DC714.6000505@namesys.com> <20051025072537.GB8402@favonius> <e692861c0510260917r36c2195fp367689753f61b307@mail.gmail.com> <e692861c0510260920w2b1f03ecu41c9d6a09fa2a2c4@mail.gmail.com> <20051027071052.GA17692@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26684-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051027071052.GA17692@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: Gregory Maxwell <gmaxwell@gmail.com>, reiserfs-list@namesys.com

Sander wrote:
> Gregory Maxwell wrote (ao):
> 
>>On 10/25/05, Sander <sander@humilis.net> wrote:


>>Cheaper how? Two disks are cheaper than one?
> 
> 
> If you opt for a copy of everything, yes. Because of a 500GB drive only
> half of it is effectively usable. Two 250GB disks raid1 are much cheaper
> than one 500GB disk.

But not cheaper than one 300 gig disk.  Remember, out of 500 gigs, how
much of that is essential?

If you're doing some sort of media, like video editing, probably a lot,
so you get the two 250 gig disks.  But if you're an author, say, your
life's work probably fits on a single floppy (if you actually use text
files) or at least fifty times over on a CD (if you use some bloaty
office suite).  A programmer?  My entire kernel directory is less than
300 megs, and I haven't run "make clean" recently.

Metadata shouldn't take more than 5% of the disk.

So, if your disk starts going bad and you need to recover, and you lose
a program, so what?  You can still recover the files.  For that matter,
how many people here would be devastated if they lost a .o file?
Probably very few people here have a .o file without a matching .c file,
so if your .o goes, you run "gcc" and you're fine.

Much cheaper, easier than a full backup, easier than RAID, and still
keeps you from losing everything....

Except, you still are your own worst enemy.  I don't think I've ever
lost data to hardware, it was always my own stupidity.
