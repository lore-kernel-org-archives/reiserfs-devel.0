From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 does not fix corruption
Date: Mon, 04 Oct 2010 17:12:25 +0200
Message-ID: <4CA9EED9.4060708@gmail.com>
References: <201010010632.16078.volkerarmin@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <201010010632.16078.volkerarmin@googlemail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Volker Armin Hemmann <volkerarmin@googlemail.com>
Cc: reiserfs-devel@vger.kernel.org

Volker Armin Hemmann wrote:

[...]
> 23 fatal corruptions were detected in FileSystem. Run with --build-fs option 
> to fix them.
>
> energy ~ # fsck.reiser4 --build-fs /dev/md3
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/md3 block device.                                                                                                                      
> Will check the consistency of the Reiser4 SuperBlock.                                                                                                   
> Will build the Reiser4 FileSystem.                                                                                                                      
> Continue?                                                                                                                                               
> (Yes/No): Yes
> ***** fsck.reiser4 started at Thu Sep 30 06:37:11 2010
> Reiser4 fs was detected on /dev/md3.                                                                                                                    
> Master super block (16): 
> magic:          ReIsEr4 
> blksize:        4096 
> format:         0x0 (format40) 
> uuid:           740b0c92-ca44-4e73-8b0f-9e592947f177 
> label:          <none> 
>  
> Format super block (17): 
> plugin:         format40 
> description:    Disk-format plugin. 
> version:        0 
> magic:          ReIsEr40FoRmAt 
> mkfs id:        0x40eea310 
> flushes:        0 
> blocks:         210953472 
> free blocks:    63198340 
> root block:     203394053 
> tail policy:    0x2 (smart) 
> next oid:       0xa8a637 
> file count:     1460992 
> tree height:    6 
> key policy:     LARGE 
>  
>  
> CHECKING THE STORAGE TREE                                                                                                                               
>         Read nodes 38125202                                                                                                                             
>         Nodes left in the tree 38125202 
>                 Leaves of them 37668676, Twigs of them 449202 
>         Time interval: Thu Sep 30 06:38:01 2010 - Thu Sep 30 07:37:03 2010 
> CHECKING EXTENT REGIONS.                                                                                                                                
>         Read twigs 449202                                                                                                                               
>         Time interval: Thu Sep 30 07:37:03 2010 - Thu Sep 30 08:01:21 2010 
> LOOKING FOR UNCONNECTED NODES                                                                                                                           
> FSCK: node.c: 108: repair_node_items_check: Node (189713135), items (44) and 
> (45): Wrong order of keys.                                                 
>         Read nodes 1                                                                                                                                    
>         Good nodes 0 
>                 Leaves of them 0, Twigs of them 0 
>         Time interval: Thu Sep 30 08:01:26 2010 - Thu Sep 30 08:01:26 2010 
> ***** fsck.reiser4 finished at Thu Sep 30 08:01:26 2010
> Closing fs...done
>
> FS is consistent.
>
>   

Could you please pack the metadata by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz

Thanks,
Edward.

P.S.:
If you don't want to wait a lot, you can try to figure out
(with gdb) why fsck falls to "consistent" branch instead
of fixing the key inconsistency. I don't think there is a big
deal here..
