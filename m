From: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Subject: Re: using debugfs.reiser4 options to access R4 on /dev/sdb
Date: Thu, 26 Feb 2015 15:39:29 +0300
Message-ID: <1424954369.18102.19.camel@home.ted.local>
References: <2a39c4776614cb7a675f299083a3627a@mail.velocitynet.com.au>
	 <1424809332.12259.67.camel@home.ted.local>
	 <4e67fef614d6e56cca9bdb540d592c78@mail.velocitynet.com.au>
	 <1424878538.16839.6.camel@home.ted.local>
	 <d6d728414febcac908cc6aaaf8aebfb6@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=oCM1P1Ktz1eZSAoHMKhclTYhVrDt0A4U/Eb5J1SfPAQ=;
        b=LwymbRPHDWYl5HTfVKb+MqNiJd5O50RpqKsl8SRWExHou4e0RexAmstzjcYr2fGpqE
         /XxmELN2sraMylcIX6g8RJEryJsXbKw0EuGoxmJsQ/i/1pcOwZhyXRPzrvLiHX87+nl5
         LCRM8680Ag/5ZLik1veI5L7lYLEPKelcCXLGbD5/wZBlkWLaLhM+LZPBw2T2hXkifcxG
         eDivsC3F4mhPmkoIjIblacDNkEJBCGCFZNpo9sVxgwob4uZdD7CeyQvWfsFKcWpZmSg0
         cgq7OegO/DafktLB9dbK3w2JS+0/lL4r2LDJWnjE6vyGqm7hW8W8T4s2iGCjlYqAapiI
         Zl3Q==
In-Reply-To: <d6d728414febcac908cc6aaaf8aebfb6@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Thu, 2015-02-26 at 14:13 +1100, doiggl@velocitynet.com.au wrote:
> On Wed, 25 Feb 2015 18:35:38 +0300, Vladimir Shebordaev
> <vladimir.shebordaev@gmail.com> wrote:
> 
> > 
> > So, what? fsck complains about unknown plugin for the root directory,
> > you have to try to dump the tree.
> > 
> > Since you fail to mount the disk, you anyway need debugging output from
> > running filesystem.
> 
> 
> Hello
> 
> I tried:
> 
> # debugfs.reiser4 -t /dev/sdb |gzip >fsck.reiser4-t.txt.gz
> 
> And it produced the following file:
> 
> # ll fsck.reiser4-t.txt.gz
> -rw-r--r-- 1 root users 44,105,728 Feb 25 22:01 fsck.reiser4-t.txt.gz
> 
> # ll fsck.reiser4-t.txt
> -rw-r--r-- 1 root users 849764352 Feb 26 14:06 fsck.reiser4-t.txt
> 
> 849,764,352
> 
> start an end shows:[1]
> 

So, you decided you don't need all that gig of text. You are right.

You have to grep the dump file for two strings 

"[29:1(SD):0:2a:0]" which names root directory stat data item
"[2a:0(NAME):0:0:0]" which is the root directory item itself

Normally, the output there should look like 

NODE (3851068) LEVEL=1 ITEMS=12 SPACE=15 MKFS ID=0x66d6b8ae FLUSH=0x0
#0  SD (stat40): [29:1(SD):0:2a:0] OFF=28, LEN=94, flags=0x0
exts:           3
mask:           0x13
plugin:         sdext_lw
offset:         2
len:            14
mode:           drwxr-xr-x
nlink:          7
size:           7
plugin:         sdext_unix
offset:         16
len:            28
uid:            1000
gid:            0
atime:          Wed Feb 25 21:45:42 2015
mtime:          Wed Mar  5 00:25:14 2014
ctime:          Wed Mar  5 00:25:14 2014
rdev:           350
bytes:          350
plugin:         sdext_plugin_set
offset:         44
len:            50
Pset count:     12
        permission : id = 0
        formatting : id = 2 (smart)
              hash : id = 1 (r5_hash)
         fibration : id = 2 (ext_1_fibre)
          statdata : id = 0 (stat40)
           diritem : id = 2 (cde40)
            crypto : id = 0
            digest : id = 0
          compress : id = 1 (gzip1)
      compressMode : id = 4 (conv)
           cluster : id = 0 (64K)
            create : id = 4 (ccreg40)

------------------------------------------------------------------------------
#1  DIRITEM (cde40): [2a:0(NAME):0:0:0] OFF=122, LEN=352, flags=0x0
NR(7)  NAME                                  OFFSET HASH
SDKEY             
  0 .                                        184
0000000000000000:0000000000000000 0000291:000002a
  1 ..                                       208
0000000000000000:0000000000000000 0000291:000002a
  2 data                                     232
0000000000000000:0000000000000000 00002a1:001cd53
  3 etc                                      256
0000000000000000:0000000000000000 00002a1:0010000

  <cropped>

------------------------------------------------------------------------------

Please notice, that actual layout can differ, so ignore any exact
numbers except keys here.

Since fsck complains about unknown item plugin for the root directory,
you've got error message around or instead of the second entry. 

> Question:
> What process or command to do next ?
> 
> Thank you Glenn
> 
> [1]
> # head fsck.reiser4-t.txt                                              
> NODE (37017218) LEVEL=6 ITEMS=27 SPACE=2826 MKFS ID=0x1ddaf754 FLUSH=0x0  
>                       
> #0  NPTR (nodeptr40):
> [ffff:0(NAME):16c6f73745f6e61:6d655f3130303335:6847c177b306589b] OFF=28,
> LEN=8, flags=0x0 [146395369]
> ------------------------------------------------------------------------------
>                                                 
> #1  NPTR (nodeptr40): [1a897:4(FB):14665646f72612d:234e8:5a3cd448] OFF=36,
> LEN=8, flags=0x0 [41273715]                                        
> ------------------------------------------------------------------------------
>                                                                      
> #2  NPTR (nodeptr40): [1a897:4(FB):146726565425344:236db:22cf668] OFF=44,
> LEN=8, flags=0x0 [233048611]                                               
>         
> ------------------------------------------------------------------------------
>                                                                           
>            
> #3  NPTR (nodeptr40): [1a897:4(FB):153696d706c794d:33bfa:63e6c] OFF=52,
> LEN=8, flags=0x0 [233054862]                                               
>                        
> ------------------------------------------------------------------------------
>                                                                           
>                      
> #4  NPTR (nodeptr40): [1a897:4(FB):16f70656e535553:423e8:df7db1d] OFF=60,
> LEN=8, flags=0x0 [233055996]
> .
> .
> .
> # tail fsck.reiser4-t.txt
> ==============================================================================
> NODE (9833881) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1ddaf754 FLUSH=0x0
> #0  CTAIL (ctail40): [19af5:4(FB):636f6d7061712d:19af6:26fe61871] OFF=28,
> LEN=4030, flags=0x0 shift=16
> ==============================================================================
> NODE (9833882) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1ddaf754 FLUSH=0x0
> #0  CTAIL (ctail40): [19af5:4(FB):636f6d7061712d:19af6:26fe6282e] OFF=28,
> LEN=4030, flags=0x0 shift=16
> ==============================================================================
> NODE (9833883) LEVEL=1 ITEMS=2 SPACE=0 MKFS ID=0x1ddaf754 FLUSH=0x0
> #0  CTAIL (ctail40): [19af5:4(FB):636f6d7061712d:19af6:26fe637eb] OFF=28,
> LEN=250, flags=0x0 shift=16
> ------------------------------------------------------------------
> #


