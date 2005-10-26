From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Fwd: My Dad suggests a redundant copies plugin
Date: Wed, 26 Oct 2005 12:20:23 -0400
Message-ID: <e692861c0510260920w2b1f03ecu41c9d6a09fa2a2c4@mail.gmail.com>
References: <435DC714.6000505@namesys.com> <20051025072537.GB8402@favonius>
	 <e692861c0510260917r36c2195fp367689753f61b307@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26659-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0510260917r36c2195fp367689753f61b307@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On 10/25/05, Sander <sander@humilis.net> wrote:
> That will kill performance badly. First of all the two read/writes
> needed, and second because you have to seek from one end to the disk to
> the other every time you read/write something.

Kill it worse for writes than a filesytem without wandering logs? I
don't think so, since they double write in any case... Since reiser4
defers flushes you don't end up seeking all over the disk, you will
write out a nice long queue, then a little seeking to ripple up the
transaction(s).

Reading will not be harmed since we will expect the underlying disk to
report read failures.

> And what is the advantage? You are not protected against a lot of disk
> failures (only against bad blocks, right?).

Badblocks have become the most common non-transient failure mode of
disks by far.

> There is a lot more advantage in buying two disks and do raid over them.
> This is (much) cheaper, gives better performance and gives more
> protection.

Cheaper how? Two disks are cheaper than one?

> Anyway, no need for a plugin. You can just divide your disk in two
> partitions and configure them as a raid1.
>
> Or am I missing something in your suggestion?

If I do not want, and can not afford, that level of protection for all
my data, but only some, RAID-1 is a very wasteful solution.
