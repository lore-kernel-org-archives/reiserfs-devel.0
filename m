From: Oleg Drokin <green@namesys.com>
Subject: Re: journal log file
Date: Sun, 26 May 2002 11:25:22 +0400
Message-ID: <20020526112522.B11674@namesys.com>
References: <OF171252DB.A2293F71-ONC1256BC4.003AE364@esade.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10419-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OF171252DB.A2293F71-ONC1256BC4.003AE364@esade.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JPASTORM@esade.edu
Cc: reiserfs-list@namesys.com

Hello!

On Sat, May 25, 2002 at 12:59:40PM +0200, JPASTORM@esade.edu wrote:

> After the mkreiserfs and mount commands so as to convert ext2 partitions
> into reisrerfs, I noticed some diferences between the du and df commands
> output.
> [root@apollo /var]# df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/sda5              7168784   1637808   5530976  23% /cache
> /dev/sda6               461788    145536    316252  32% /var
> [root@apollo /cache]# du
> 1591088 .

33*1024(journal size + some reserved space)+1591088 = 1624880
and 16k were probably occupied by internal tree nodes, that are not
accounted for files, so du do not show this.

> [root@apollo /var]# du
> 114596  .

33*1024+114596 = 148388
Here we see that actual number of bytes is less than we expected.
This is because of tail packing and du's feature.
du only takes into account amount of block each file occupies.
So if two files occupy the same block, du would count amount of blocks
used to be 2, where correct amount is 1 (tail packing).

Probably you have some amount of small files on your /var partition.
(smal files are files that are less than 16K in size).

> The df value for /var partition was more or less expected having in count
> these 32 MB of the journal. Could you explain me the difference in the
> /cache partition (it's just the squid cache partition)?

I do not see much difference, in fact.

> I also understand that I cannot make a reiserfs partition from an ext2
> partition if I have less than these 32 MB left in it and I want to preserve
> all data.

There is no transparent tool to convert ext2 fs to reiserfs.
The current procedure is to backup all the data, reformat the partition,
and then to restore the data back.
And yes, the 33M would be claimed for journal and some other internal to
filesystem stuff.
Also it is highly advisable to have at least 10% of free space on the partition,
so that large-scale fragmentation would less likely to occur.

Bye,
    Oleg
