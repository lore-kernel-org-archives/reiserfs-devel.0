From: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Subject: corrupted 3.5 format fs
Date: Thu, 22 Aug 2002 06:35:12 +0200
Message-ID: <20020822063512.54daaeaf.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

Hi,

Here are the results of some tests i made, playing with my home PC
(nothing to do with production servers this time ;o)

fs is /var , a 3.5 format 300Mo partition, reiserfsck from reiserfsprogs-3.6.3 

I dd'ed /var to a file, losetup'ed it and made successive --check ,
--fixable, --check and finally --rebuild-tree.

After the first --check , it reported 2657 corruptions which could be fixed by
--fix-fixable.
So , i did and re-ran --check and came with still 1 corruption left that was
said to be able to be corrected with --fix-fixable.
Re-ran --fix-fixable and --check , and i still had this '1 corruption found
which can be fixed with --fix-fixable'

bad_stat_data: block 38372, [3955 5371 0x0 SD (0)], SD has bad nlink number

I ran --rebuild-tree and the final corruption finally disappeared.

I've packed the metadata, if you want to have a look at it.

You can find the shell output here :

http://philippemm.multimania.com/reiserfs/3.5_var_corrupted_fs.txt

and the gzipped metadata here;

http://philippemm.multimania.com/reiserfs/metadata.gz

and the log files here :

http://philippemm.multimania.com/reiserfs/

Thanks

Philippe
