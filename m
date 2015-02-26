From: <doiggl@velocitynet.com.au>
Subject: Re: using debugfs.reiser4 options to access R4 on /dev/sdb
Date: Thu, 26 Feb 2015 14:13:42 +1100
Message-ID: <d6d728414febcac908cc6aaaf8aebfb6@mail.velocitynet.com.au>
References: <2a39c4776614cb7a675f299083a3627a@mail.velocitynet.com.au> <1424809332.12259.67.camel@home.ted.local> <4e67fef614d6e56cca9bdb540d592c78@mail.velocitynet.com.au> <1424878538.16839.6.camel@home.ted.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1424878538.16839.6.camel@home.ted.local>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Wed, 25 Feb 2015 18:35:38 +0300, Vladimir Shebordaev
<vladimir.shebordaev@gmail.com> wrote:

> 
> So, what? fsck complains about unknown plugin for the root directory,
> you have to try to dump the tree.
> 
> Since you fail to mount the disk, you anyway need debugging output from
> running filesystem.


Hello

I tried:

# debugfs.reiser4 -t /dev/sdb |gzip >fsck.reiser4-t.txt.gz

And it produced the following file:

# ll fsck.reiser4-t.txt.gz
-rw-r--r-- 1 root users 44,105,728 Feb 25 22:01 fsck.reiser4-t.txt.gz

# ll fsck.reiser4-t.txt
-rw-r--r-- 1 root users 849764352 Feb 26 14:06 fsck.reiser4-t.txt

849,764,352

start an end shows:[1]

Question:
What process or command to do next ?

Thank you Glenn

[1]
# head fsck.reiser4-t.txt                                              
NODE (37017218) LEVEL=6 ITEMS=27 SPACE=2826 MKFS ID=0x1ddaf754 FLUSH=0x0  
                      
#0  NPTR (nodeptr40):
[ffff:0(NAME):16c6f73745f6e61:6d655f3130303335:6847c177b306589b] OFF=28,
LEN=8, flags=0x0 [146395369]
------------------------------------------------------------------------------
                                                
#1  NPTR (nodeptr40): [1a897:4(FB):14665646f72612d:234e8:5a3cd448] OFF=36,
LEN=8, flags=0x0 [41273715]                                        
------------------------------------------------------------------------------
                                                                     
#2  NPTR (nodeptr40): [1a897:4(FB):146726565425344:236db:22cf668] OFF=44,
LEN=8, flags=0x0 [233048611]                                               
        
------------------------------------------------------------------------------
                                                                          
           
#3  NPTR (nodeptr40): [1a897:4(FB):153696d706c794d:33bfa:63e6c] OFF=52,
LEN=8, flags=0x0 [233054862]                                               
                       
------------------------------------------------------------------------------
                                                                          
                     
#4  NPTR (nodeptr40): [1a897:4(FB):16f70656e535553:423e8:df7db1d] OFF=60,
LEN=8, flags=0x0 [233055996]
.
.
.
# tail fsck.reiser4-t.txt
==============================================================================
NODE (9833881) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1ddaf754 FLUSH=0x0
#0  CTAIL (ctail40): [19af5:4(FB):636f6d7061712d:19af6:26fe61871] OFF=28,
LEN=4030, flags=0x0 shift=16
==============================================================================
NODE (9833882) LEVEL=1 ITEMS=1 SPACE=0 MKFS ID=0x1ddaf754 FLUSH=0x0
#0  CTAIL (ctail40): [19af5:4(FB):636f6d7061712d:19af6:26fe6282e] OFF=28,
LEN=4030, flags=0x0 shift=16
==============================================================================
NODE (9833883) LEVEL=1 ITEMS=2 SPACE=0 MKFS ID=0x1ddaf754 FLUSH=0x0
#0  CTAIL (ctail40): [19af5:4(FB):636f6d7061712d:19af6:26fe637eb] OFF=28,
LEN=250, flags=0x0 shift=16
------------------------------------------------------------------
#
