From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reading data disk blocks of a file
Date: Wed, 22 Dec 2004 12:28:23 -0500
Message-ID: <41C9AEB7.70105@suse.com>
References: <5fe093a5041222073823cdef43@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5fe093a5041222073823cdef43@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pallavi <pallavidalya@gmail.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pallavi wrote:
> hello,
> what are the internal operations to real a file..I understand that the
> semantic layer
> converts a filename into a key but where in the source code is the
> implementation of this semantic layer found and how does it exactly
> convert the name to a key?
> 
> A key will lead me to a node. That node had range of keys each
> corresponding to an item.The key I get will point to an item. Let's
> say the item contains data, but given that the item size is limited
> the data may be spread  across items nodes. How are all the data
> blocks where data from particular file is stored identified.
> Basically i want to know how are all the data blocks of a file are
> accessed and read?
> 

This link might help your understanding of the layout:
http://web.archive.org/web/20021013181038/http://www.namesys.com/content_table.html#6_1

Unfortunately, it doesn't cover version 2 keys, which are essentially
the same as version 1 keys, but rather than splitting offset/type as
32:32 bits, they're split 60:4 to allow for much larger file offsets.

To figure out how a name is looked up, your best bet is to start at
reiserfs_lookup (namei.c) which quickly dives into the tree parsing
code, but at a high enough level that you should be able to follow it down.

Files in a reiserfs filesystem (assuming indirect items only for now)
are stored as a list of data block numbers inside an item. The key
associated with the item includes the starting file offset for the
blocks contained in that item. So, for example, you may see the
following (using v2 stat data, which is assumed for any new fs):

For the sake of illustration, I've chosen a file offset that is deep
enough into the file to ensure that it will be in a different leaf node.

leaf_node {
 [possibly other item heads]
  item_head {
    ih_key {
      k_dir_id = 12345;
      k_object_id = 12346;
      k_offset = 0
      k_type = TYPE_STAT_DATA;
    }
    [size of item body, etc]
  }
 [other item heads and item bodies, including the first
  batch of indirect block pointers]
  item body: stat_data {
    [size, permissions, etc]
  }
 [possibly other item bodies]
}

another leaf_node {
  item_head {
    ih_key {
      k_dir_id = 12345; (same as stat data)
      k_object_id = 12346 (same as stat data)
      k_offset = 4194304; (position in file, in bytes, 4MB)
      k_type = TYPE_INDIRECT;
    }
    [size of item body, etc]
  }
[...]
 item body: [100000 100001 100002 100003 100004 100005 100006 ...]
            (array of block numbers)
}


The array of block numbers contain the location of the file data.

Occasionally, when the file is small enough, the last chunk of data may
be stored inside the leaf node itself as item data. These are called
"tails" and are used to conserve disk space when small files are used.

In userspace, it's possible to discover what blocks are used by a
particular file by using the FIBMAP ioctl on the file.

Also, if you'd like to see the disk format more visually, try using
"debugreiserfs -D <device>" to dump the fs metadata in a table format.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBya63LPWxlyuTD7IRAsazAJ9VxJpoOIUkxMeYnhrQZO5a8zC2QACeLpFp
/u2zfOdohJ6XKamRSvkzFDU=
=J4dj
-----END PGP SIGNATURE-----
