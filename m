From: Sander <sander@humilis.net>
Subject: Re: Fwd: My Dad suggests a redundant copies plugin
Date: Thu, 27 Oct 2005 09:10:53 +0200
Message-ID: <20051027071052.GA17692@favonius>
References: <435DC714.6000505@namesys.com> <20051025072537.GB8402@favonius> <e692861c0510260917r36c2195fp367689753f61b307@mail.gmail.com> <e692861c0510260920w2b1f03ecu41c9d6a09fa2a2c4@mail.gmail.com>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26676-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <e692861c0510260920w2b1f03ecu41c9d6a09fa2a2c4@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gregory Maxwell <gmaxwell@gmail.com>
Cc: reiserfs-list@namesys.com

Gregory Maxwell wrote (ao):
> On 10/25/05, Sander <sander@humilis.net> wrote:
> > That will kill performance badly. First of all the two read/writes
> > needed, and second because you have to seek from one end to the disk
> > to the other every time you read/write something.
> 
> Kill it worse for writes than a filesytem without wandering logs? I
> don't think so, since they double write in any case... Since reiser4
> defers flushes you don't end up seeking all over the disk, you will
> write out a nice long queue, then a little seeking to ripple up the
> transaction(s).
> 
> Reading will not be harmed since we will expect the underlying disk to
> report read failures.

Either way, more reads and writes are need with such a plugin, or am I
missing something?

> > And what is the advantage? You are not protected against a lot of
> > disk failures (only against bad blocks, right?).
> 
> Badblocks have become the most common non-transient failure mode of
> disks by far.

That is not my experience. Where does this knowledge come from?

> > There is a lot more advantage in buying two disks and do raid over
> > them. This is (much) cheaper, gives better performance and gives
> > more protection.
> 
> Cheaper how? Two disks are cheaper than one?

If you opt for a copy of everything, yes. Because of a 500GB drive only
half of it is effectively usable. Two 250GB disks raid1 are much cheaper
than one 500GB disk.

-- 
Humilis IT Services and Solutions
http://www.humilis.net
