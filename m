From: <doiggl@velocitynet.com.au>
Subject: How can reiser4 file system be recovered ? [/dev/sdb]
Date: Fri, 29 Jul 2016 20:05:58 +1000
Message-ID: <678ee79391799605c8a9d72498d5b94a@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
How can reiser4 file system be recovered ? [/dev/sdb]
Ideas, thoughts on how its done.

- Is it a case reiser4progs needs fixing ?
http://www.spinics.net/lists/reiserfs-devel/msg04206.html

Thanks
--Glenn

previous trys:
http://www.spinics.net/lists/reiserfs-devel/msg05102.html
http://www.spinics.net/lists/reiserfs-devel/msg04685.html

This is the sequence of --checks and --build-fs times of Reiser4 volume on
disk /dev/sdb
http://www.spinics.net/lists/reiserfs-devel/msg04667.html

-- other info
# measurefs.reiser4 -p -l  -f /dev/sdb                                    
                                                                          
 
measurefs.reiser4 1.1.0                                                   
                                                                          
      
Format release: 4.0.1                                                     
                                                                          
      
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.                                                      
                    
                                                                          
                                                                          
        
Default profile:                                                          
                                                                          
         
create:          "ccreg40"         (id:0x4 type:0x0)    [Regular file
plugin for creat(2)]                                                       
              
key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]      
                                                                          
          
node:            "node40"          (id:0x0 type:0x2)    [Node plugin]     
                                                                          
          
compress:        "lzo1"            (id:0x0 type:0xc)    [Compression
plugin]                                                                    
                 
compressMode:    "conv"            (id:0x4 type:0xd)    [Compression Mode
plugin]                                                                    
             
cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin]  
                                                                          
            
hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entry
hash plugin]                                                               
                
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration
plugin]                                                                    
                  
formatting:      "smart"           (id:0x2 type:0x5)    [File body
formatting plugin]                                                         
                        
                                                                          
                                                                          
                
Known plugins:                                                            
                                                                          
                 
"reg40"             (id:0x0 type:0x0) [Unix-file regular file plugin.]
"dir40"             (id:0x1 type:0x0) [Directory file plugin.]
"sym40"             (id:0x2 type:0x0) [Symlink file plugin.]
"spl40"             (id:0x3 type:0x0) [Special file plugin.]
"ccreg40"           (id:0x4 type:0x0) [Cryptcompress regular file plugin.]
"stat40"            (id:0x0 type:0x1) [StatData item plugin.]
"cde40"             (id:0x2 type:0x1) [Compound directory entry item
plugin.]
"nodeptr40"         (id:0x3 type:0x1) [Node pointer item plugin.]
"extent40"          (id:0x5 type:0x1) [Extent file body item plugin.]
"plain40"           (id:0x6 type:0x1) [Plain file body item plugin.]
"ctail40"           (id:0x7 type:0x1) [Compressed file body item plugin.]
"bbox40"            (id:0x8 type:0x1) [Safe link item plugin.]
"node40"            (id:0x0 type:0x2) [Node layout plugin.]
"node41"            (id:0x1 type:0x2) [Protected node layout plugin.]
"rupasov_hash"      (id:0x0 type:0x3) [Rupasov hash plugin.]
"r5_hash"           (id:0x1 type:0x3) [R5 hash plugin.]
"tea_hash"          (id:0x2 type:0x3) [Tea hash plugin.]
"fnv1_hash"         (id:0x3 type:0x3) [Fnv1 hash plugin.]
"deg_hash"          (id:0x4 type:0x3) [Degenerate hash plugin.]
"lexic_fibre"       (id:0x0 type:0x4) [Lexicographic fibration plugin.]
"dot_o_fibre"       (id:0x1 type:0x4) ['.o' fibration plugin.]
"ext_1_fibre"       (id:0x2 type:0x4) [1-symbol extention fibration
plugin.]
"ext_3_fibre"       (id:0x3 type:0x4) [3-symbol extention fibration
plugin.]
"extents"           (id:0x0 type:0x5) ['Extents only' tail policy plugin.]
"tails"             (id:0x1 type:0x5) ['Tails only' tail policy plugin.]
"smart"             (id:0x2 type:0x5) [Smart tail policy plugin.]
"sdext_lw"          (id:0x0 type:0x6) [Light stat data extension plugin.]
"sdext_unix"        (id:0x1 type:0x6) [Unix stat data extension plugin.]
"sdext_lt"          (id:0x2 type:0x6) [Large times stat data extension
plugin.]
"sdext_symlink"     (id:0x3 type:0x6) [Symlink stat data extension
plugin.]
"sdext_plugin_set"  (id:0x4 type:0x6) [Plugin Set StatData extension
plugin.]
"sdext_flags"       (id:0x5 type:0x6) [Inode flags stat data extension
plugin.]
"sdext_crypto"      (id:0x7 type:0x6) [Crypto stat data extension plugin.]
"sdext_heir_set"    (id:0x8 type:0x6) [Heir Set StatData extension
plugin.]
"format40"          (id:0x0 type:0x7) [Disk-format plugin.]
"oid40"             (id:0x0 type:0x8) [Inode number allocator plugin.]
"alloc40"           (id:0x0 type:0x9) [Space allocator plugin.]
"journal40"         (id:0x0 type:0xa) [Journal plugin.]
"key_short"         (id:0x0 type:0xb) [Short key plugin.]
"key_large"         (id:0x1 type:0xb) [Large key plugin.]
"lzo1"              (id:0x0 type:0xc) [lzo1 compression transform plugin.]
"gzip1"             (id:0x1 type:0xc) [gzip1 compression transform
plugin.]
"none"              (id:0x0 type:0xd) ['Don't compress' compression mode
plugin.]
"latt"              (id:0x1 type:0xd) ['Check on dynamic lattice'
compression mode plugin.]
"ultim"             (id:0x2 type:0xd) ['Check ultimately' compression mode
plugin.]
"force"             (id:0x3 type:0xd) ['Compress evrything' compression
mode plugin.]
"conv"              (id:0x4 type:0xd) ['Convert to extent' compression
mode plugin.]
"64K"               (id:0x0 type:0x10) [64K size cluster plugin.]
"32K"               (id:0x1 type:0x10) [32K size cluster plugin.]
"16K"               (id:0x2 type:0x10) [16K size cluster plugin.]
"8K"                (id:0x3 type:0x10) [8K size cluster plugin.]
"4K"                (id:0x4 type:0x10) [4K size cluster plugin.]

Tree statistics ... done                                                  
                                                                          
      
Packing statistics:                                                       
                                                                          
    
  Formatted nodes:    4094.45b (99.96%)
  Branch nodes:       3991.65b (97.45%)
  Twig nodes:         4069.33b (99.35%)
  Leaf nodes:         4094.60b (99.97%)

Node statistics:
  Total nodes:      195776841
  Formatted nodes:  169084618
  Unformatted nodes: 26692223
  Branch nodes:         22346
  Twig nodes:         1903127
  Leaf nodes:       193851368

Item statistics:
  Total items:      350921825
  Nodeptr items:    169084617
  Statdata items:      41164
  Direntry items:        3723
  Tail items:               0
  Extent items:         25724
 
