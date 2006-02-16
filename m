From: Peter Klotz <peter.klotz@aon.at>
Subject: reiser4: Request for minor change in max_name_len_cde()
Date: Thu, 16 Feb 2006 17:48:19 +0100
Message-ID: <43F4ACD3.4090706@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

The function max_name_len_cde() in reiser4/plugin/item/cde40.c in my 
opinion limits the file name length too strict.

One finds:

   return
       tree_by_inode(dir)->nplug->max_item_size() -
       sizeof(directory_entry_format) - sizeof(cde_item_format) -
       sizeof(cde_unit_header) - 2;

I think the -2 can be safely changed to -1 since the only extra byte 
that has to be taken into account is the terminating zero of the file 
name in case a longname key is encountered.

The maximum file name length in the original case is 3976 bytes if the 
filesystem uses 4096 byte blocks. In this case the node header of the 
node containing the cde40 item reports 1 byte of free space.

4096   block size
 -28   sizeof(node40_header)
 -38   sizeof(item_header40)
  -2   sizeof(cde_item_format)
 -26   sizeof(cde_unit_header)
 -24   sizeof(directory_entry_format)
  -1   terminating zero of file name
  -1   ?
-----
3976

I changed the -2 to -1 and recompiled the kernel. Then I was able to 
create a file with a 3977 byte name. In this case the node header 
reports 0 bytes of free space.

Best regards, Peter.
