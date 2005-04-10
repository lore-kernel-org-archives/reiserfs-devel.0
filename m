From: Jun OKAJIMA <okajima@digitalinfra.co.jp>
Subject: one idea about reiser4 compress
Date: Sun, 10 Apr 2005 22:38:30 +0900
Message-ID: <200504101338.AA00075@bbb-jz5c7z9hn9y.digitalinfra.co.jp>
References: <42553064.9060604@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42553064.9060604@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward@namesys.com>
Cc: mangoo@interia.pl, reiserfs-list@namesys.com



Hello.

Assume you install a distribution on a compressed partition with reiser4.
you usually do like this --

| CD | Installer with decompression | -> | Re-compress with Reiser4 | HDD |

You dont think decompression -> recompression cycle is wasteful?
If CD contains compressed files with reiser4 compression format,
I guess it is possible to do like this --

| CD with reiser4 compressed files | Installer | -> | HDD | 

I mean, this eliminates an overhead of re-compression and make whole 
isntall process simpler and faster. Maybe you could do install like this --
 # cp -a /mnt/cdrom /mnt/target_hdd
And this way would be much faster than usual installer today.

How about this idea?


                --- Okajima, Jun. Tokyo, Japan.




>mangoo@interia.pl wrote:
>
>>I was long looking for a Linux filesystem that would support r/w transparent 
compression.
>>
>>jffs2 is stable, but is dedicated to flash devices mainly, and hence the maximum size 
of this filesystem is 4 GB.
>>
>>ext2 + compression patches does not work with 2.6 kernels, has no journaling (it's 
ext2, after all), and is not considered stable (which doesn't bother me that much for 
my purposes).
>>
>>IBM's jfs supports compression, but not under Linux.
>>
>>
>>And there is (will be) reiserfs4.1, which will at last have compression support?
>>
>>Is it to be released anytime soon?
>>
>>If not, where can I get 4.1 sources and how can I patch my kernel with the current, 
most up-to-date reiserfs4.1-alpha-don't-use version?
>>
>>Features I need is compression, hardlinks and read/write (of course) - is the current 
state OK to test it on a /mnt/test partition with non-critical data?
>>
>>
>>  
>>
>Hello, it looks mostly stable, but currently there is no human interface 
>to create such
>files. Also it would be fine to make it a bit smart: there is a lot of 
>incompressible files
>so flush algorithm should know when compression should be switched off.
>We are working on it now, wait for beta-release.
>
>Thanks,
>Edward.
>
>>Tomek
>>
>>
>>------------------------------------------------------------------
>>Jan Pawel II 1920 - 2005
>>http://link.interia.pl/f1871 
>>
>>
>>
>>  
>>
>
