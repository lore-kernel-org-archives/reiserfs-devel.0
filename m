From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Plugin structure documentation request
Date: Wed, 14 Dec 2005 00:33:52 -0800
Message-ID: <200512140033.53036.pvh@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27290-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

It would be quite excellent if we could have even a one sentence description 
of all the plugin structures. This structure includes many operations not 
found in conventional VFS, and many of the calls are not described in any 
documentation I have found.

I must confess I am feeling some frustration at the complete lack of 
documentation of the project. I have very few complaints about the quality of 
the code, but despite having spent four months working through file after 
file I still regularly stumble across areas we have not had an excuse to 
delve into and have no idea how they work in a general sense or what they do. 
This kind of documentation does not take particularly long to generate but 
would save new users of the code many, MANY long hours spent poring over code 
and tracking function calls through the enormous structure. 

I know you have heard it from the kernel mailing list before, but now you are 
hearing it from someone uninvolved in that process. A trivial script reports 
93866 lines of code in the reiser4 directory. That's a lot of code to 
navigate without a map.

Having got that off my chest, here is one example of a plugin struct that 
could use documentation. There are several other examples -- notably the 
pseudo.c structure which is relatively uncomplicated and the directory plugin 
which is about as complicated as this example "file" plugin.

        [PSEUDO_FILE_PLUGIN_ID] = {
                .h = {
                        .type_id = REISER4_FILE_PLUGIN_TYPE,
                        .id = PSEUDO_FILE_PLUGIN_ID,
                        .pops = &file_plugin_ops,
                        .label = "pseudo",
                        .desc = "pseudo file",
                        .linkage = TYPE_SAFE_LIST_LINK_ZERO
                },
                .open =              open_pseudo,
                .truncate          = eperm,
                .write_sd_by_inode = eperm,
                .readpage          = eperm,
                .capturepage       = NULL,
                .capture           = NULL,
                .read              = read_pseudo,
                .write             = write_pseudo,
                .release           = release_pseudo,
                .ioctl             = eperm,
                .mmap              = eperm,
                .sync = sync_common,
                .get_block         = eperm,
                .flow_by_inode     = NULL,
                .key_by_inode      = NULL,
                .set_plug_in_inode = set_plug_in_inode_common,
                .adjust_to_parent  = NULL,
                .create            = NULL,
                .delete            = eperm,
                .add_link          = NULL,
                .rem_link          = NULL,
                .owns_item         = NULL, 
                .can_add_link      = cannot,
                .can_rem_link      = cannot,
                .setattr           = inode_setattr,
                .getattr           = getattr_common,
                .seek              = seek_pseudo,
                .detach            = detach_common,
                .bind              = bind_common,
                .safelink = NULL,
                .estimate = {
                        .create = NULL,
                        .update = NULL,
                        .unlink = NULL
                },
                .wire = {
                         .write = wire_write_pseudo,
                         .read  = wire_read_pseudo,
                         .get   = wire_get_pseudo,
                         .size  = wire_size_pseudo,
                         .done  = wire_done_pseudo
                 },
                .init_inode_data = NULL,
                .pre_delete = NULL,
                .cut_tree_worker = cut_tree_worker_common,
                .destroy_inode = NULL,
        },

Thanks,
-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
