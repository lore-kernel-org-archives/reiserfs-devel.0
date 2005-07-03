From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Filesystem repair and Data Recovery
Date: Sun, 03 Jul 2005 16:59:17 +0400
Message-ID: <1120395556.4219.13.camel@tribesman.namesys.com>
References: <20050701112954.B2F849FF0@mail.mak.ac.ug>
	 <1120220361.3603.62.camel@tribesman.namesys.com>
	 <20050701130616.2D2FCA04E@mail.mak.ac.ug>
	 <1120226737.3603.85.camel@tribesman.namesys.com>
	 <20050701143553.57D5BA02C@mail.mak.ac.ug>
	 <1120230853.3603.97.camel@tribesman.namesys.com>
	 <20050701153254.F285AA07E@mail.mak.ac.ug>
	 <1120234546.3603.111.camel@tribesman.namesys.com>
	 <20050701163625.1C533A069@mail.mak.ac.ug>
	 <1120239440.10316.119.camel@tribesman.namesys.com>
	 <20050702101916.31F449FEA@mail.mak.ac.ug>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-mi5y+oti0w1evgOVkUQx"
Return-path: <reiserfs-list-return-24926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050702101916.31F449FEA@mail.mak.ac.ug>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Flora Dru <dru@dicts.mak.ac.ug>
Cc: reiserfs-list@namesys.com

--=-mi5y+oti0w1evgOVkUQx
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Sat, 2005-07-02 at 14:19, Flora Dru wrote: 
> Good morning
> > ok, you said earlier that you can umount it.
> > Please umount and run
> > reiserfsck /dev/sdc1
> > and let us know what it says. 
> > 
> > PS: I have to leave now. Let continue later. I am not sure when I will
> > be at work. Maybe tomorrow, maybe on sunday. 
> > 
> > Can you backup /dev/sdc1 locally? I am not sure that ssh corrupthost dd
> > if=/dev/sdc1 > sdc1.img works as it is supposed to. 
> > 
> reiserfsck /dev/sdc1 returns
> Do you want to run this program?[N/Yes] (note need to type Yes):Yes
> reiserfs_open: neither new nor old reiserfs format found on /dev/sdc1
> reiserfsck: could not open filesystem on "/dev/sdc1" 
> 

Lets try to find whether there is anything on /dev/sdc1 which looks like
reiserfs.

Please compile the attached program 
make myscan

and run it
./myscan /dev/sdc1

This program will look for reiserfs formatted nodes reiserfsck can try
to re-build filesystem of.
If you see a lot of lines like:
block 34640 is reiserfs leaf
block 34654 is reiserfs leaf
block 34672 is reiserfs leaf

then you should make a copy of /dev/sdc1 and do:
reiserfsck --rebuild-sb /dev/copy
reiserfsck --rebuild-tree /dev/copy


Please also try this program on a backup you made over ssh and let us
know the result.

> Aborted 
> 
> Mount returns
> /dev/sda1 on / type reiserfs (rw)
> proc on /proc type proc (rw)
> devpts on /dev/pts type devpts (rw,mode=0620,gid=5)
> /dev/sda2 on /boot type reiserfs (rw)
> /dev/sda9 on /data type reiserfs (rw)
> /dev/sda8 on /opt type reiserfs (rw)
> /dev/sda6 on /usr type reiserfs (rw)
> /dev/sda7 on /var type reiserfs (rw)
> shmfs on /dev/shm type shm (rw)
> /dev/sdc1 on /mnt type ext2 (rw) 
> 

If you are sure that /dev/sdc1 is reiserfs, you should have umounted it
already.

> 
> Thanks again
> Florence Dru 
> 
>  
> 
> 
> 

--=-mi5y+oti0w1evgOVkUQx
Content-Disposition: attachment; filename=myscan.c
Content-Type: text/x-c; name=myscan.c; charset=koi8-r
Content-Transfer-Encoding: 7bit

/* read file by 4 k blocks and try to recognize reiserfs blocks */

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <asm/types.h>
#include <sys/stat.h>

char buf[4096];

struct block_head {       
	__u16 blk2_level;        /* Level of a block in the tree. */
	__u16 blk2_nr_item;      /* Number of keys/items in a block. */
	__u16 blk2_free_space;   /* Block free space in bytes. */
	__u16 blk_reserved;
	__u32 reserved [4];
};

struct key {
	__u32 k2_dir_id;
	__u32 k2_objectid;
	__u32 k_offset;
	__u32 k_uniqueness;
};

struct item_head
{
	struct key ih_key;
	union {
		__u16 ih2_free_space;
		__u16 ih2_entry_count;
	};
	__u16 ih2_item_len;
	__u16 ih2_item_location;
	__u16 ih_format;
};

int
leaf_count_ih(char *buf, int blocksize) 
{
	struct item_head * ih;
	int prev_location;
	int nr;

	/* look at the table of item head */
	prev_location = blocksize;
	ih = (struct item_head *)(buf + sizeof(struct block_head));
	nr = 0;
	while (1) {
		if (ih->ih2_item_location + ih->ih2_item_len != prev_location)
			break;
		if (ih->ih2_item_location < sizeof(struct item_head) * (nr + 1) + sizeof(struct block_head))
			break;
		if (ih->ih2_item_len > (blocksize - sizeof(struct item_head) - sizeof(struct block_head)))
			break;
		prev_location = ih->ih2_item_location;
	/*
		printf("%d: key [%u %u %u %u], item len %d, location %d\n",
			nr, ih->ih_key.k2_dir_id, ih->ih_key.k2_objectid, 
			ih->ih_key.k_offset, ih->ih_key.k_uniqueness,
			ih->ih2_item_location, ih->ih2_item_len);
	*/	
		ih ++;
		nr ++;
	}
    
	return nr;
}

static int
leaf_free_space_estimate(char *buf, int blocksize)
{
	struct block_head * blkh;
	struct item_head * ih;
	int nr;
    
	blkh = (struct block_head *)buf;
	nr = blkh->blk2_nr_item;    
	ih = (struct item_head *)(buf + sizeof(struct block_head)) + nr - 1;
    
	return (nr ? ih->ih2_item_location : blocksize) - sizeof(struct block_head) - sizeof(struct item_head) * nr;
}

static int
leaf_blkh_correct(char *buf, int blocksize)
{
	struct block_head * blkh;
	unsigned int nr;

	blkh = (struct block_head *)buf;

	nr = blkh->blk2_nr_item;
	if (nr > ((blocksize - sizeof(struct block_head)) / (sizeof(struct item_head) + 1)))
		/* item number is too big or too small */
		return 0;

	return leaf_free_space_estimate(buf, blocksize) == blkh->blk2_free_space;
}

int
is_a_leaf(char *buf, int blocksize)
{
	struct block_head * blkh;
	int counted;
    
	blkh = (struct block_head *)buf;
	if (blkh->blk2_level != 1)
		return 0;

	if (!leaf_blkh_correct(buf, blocksize))
		return 0;

	counted = leaf_count_ih(buf, blocksize);

	return (counted == blkh->blk2_nr_item) ? 1 : 0;
}

int
main (int argc, char **argv)
{
	int fd;
	int i;

	fd = open(argv[1], O_RDONLY);
	if (fd == -1) {
		perror("open failed");
		return 1;
	}
	for (i = 0; ; i ++) {
		if (read(fd, buf, 4096) != 4096) {
			printf("failed to read block %d\n", i);
			break;
		}
		if (is_a_leaf(buf, 4096))
			printf("block %d is reiserfs leaf\n", i);
	}
	close(fd);
	return 0;
}

--=-mi5y+oti0w1evgOVkUQx--

