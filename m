From: John@Vicherek.com
Subject: Re: how screwed am I ? - lost 79160kB off of a May 2001 reiserfs
 partition to a swap :-(
Date: Sun, 17 Aug 2003 15:10:04 -0400 (EDT)
Message-ID: <no.Yo.N.nN.0308171451080.2986-100000@business.com>
References: <no.Yo.N.nN.0308171326020.2986-100000@business.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15345-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <no.Yo.N.nN.0308171326020.2986-100000@business.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs@ied.com
Cc: reiserfs-list@namesys.com



 Ha !

  A year ago I got all hyped up about creating own backup system, but
  never got around to finishing it. But I had started collecting data:

  I've just found out that I also have this info on all fs entries:

 select * from file where parentid = '355765';

   id    | parentid | partid |    name    | am |  size  | md5 | links | inode |       changed       |      modified       | mode | ownernm | ownerid | groupnm | groupid | symlink | devno | info
---------+----------+--------+------------+----+--------+-----+-------+-------+---------------------+---------------------+------+---------+---------+---------+---------+---------+-------+------
 1758273 |   355765 |        | .automount | 32 |     48 |     |     2 | 69411 | 1999-12-31 20:58:03 | 2001-04-04 14:32:13 |  493 |         |       0 |         |       0 |         |       |
 ...
 ...
 ...
 for every single directory entry on the disk ...
( the id & parentid  are IDs withing the database. inode is the Inode on
the original filesystem )

 Hans, this should help significantly, shouldn't it ?
 (I even have the md5sums for plain files)


  What would be next steps ?


   Thanks,

      John


On Sun, 17 Aug 2003 reiserfs@ied.com wrote:

> Date: Sun, 17 Aug 2003 13:44:16 -0400 (EDT)
> From: reiserfs@ied.com
> To: reiserfs-list@namesys.com
> Subject: how screwed am I ? - lost 79160kB off of a May 2001 reiserfs
>     partition to a swap :-(
> 
> 
> 
>   Hello all,
> 
>    I screwed myself - I've overwritten the first 79160kB of 
> a 38GB partition (fdisk says 38796975 blocks) with swap :-(
> 
>    The partition was almost full. I also have full output of 
> "find ." on that partition before I screwed up. Total of 
> 639146 files.
> 
>    I don't care about the files in the first 79160kB, since 
> those would be OS installation files. But I have many 
> important personal files in the remaining 38GB.
> 
>    The partition was created as part of a Mandrake 
> installation in about May 2001 (I think it was Mandrake 7.2 
> then?). The kernel was linux-2.4.3 (which reiserfs version 
> would this be?)
> 
>    I know I'm screwed, but exactly how much ?
> 
>    Any tips / suggestions / procedures for recovering these
> files ?
> 
>     Thanks a bunch in advance,
> 
>         John
> 
> 

-- 
-- Gospel of Jesus' kingdom = saving power of God for all who believe --
                 ## To some, nothing is impossible. ##


