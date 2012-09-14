From: <doiggl@velocitynet.com.au>
Subject: Re: linux 3.4.2 fails to compile with patch
Date: Fri, 14 Sep 2012 21:25:25 +1000
Message-ID: <ae427b2eb41be150a209a9c4e10ed7cb@mail.velocitynet.com.au>
References: <5052B073.4080506@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5052B073.4080506@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Fri, 14 Sep 2012 09:50:03 +0530, "dE ." <de.techno@gmail.com> wrote:
> Hello again :)
> 
> I downloaded the recent patches for 3.2 to 3.5 kernels, and applied it 
> to my 3.4.2 kernel. It results in the following --
> 
> CC      fs/fs-writeback.o
> fs/fs-writeback.c: In function 'generic_writeback_sb_inodes':
> fs/fs-writeback.c:560:6: error: request for member 'nr_to_write' in 
> something not a structure or union
> fs/fs-writeback.c:561:6: error: request for member 'pages_skipped' in 
> something not a structure or union
> fs/fs-writeback.c:563:3: warning: passing argument 3 of 
> 'writeback_single_inode' from incompatible pointer type [enabled by
> default]
> fs/fs-writeback.c:344:1: note: expected 'struct writeback_control *' but

> argument is of type 'struct writeback_control **'
> fs/fs-writeback.c:565:38: error: request for member 'nr_to_write' in 
> something not a structure or union
> fs/fs-writeback.c:566:29: error: request for member 'nr_to_write' in 
> something not a structure or union
> fs/fs-writeback.c:569:10: error: request for member 'pages_skipped' in 
> something not a structure or union
> make[1]: *** [fs/fs-writeback.o] Error 1
> make: *** [fs] Error 2
> --
> To unsubscribe from this list: send the line "unsubscribe
reiserfs-devel"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Hello,
This is using the v3.5.3 kernel.
Here are my full build logs:
https://build.opensuse.org/package/rawlog?arch=i586&package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_12.2
https://build.opensuse.org/package/rawlog?arch=x86_64&package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_12.2

Here is the specfile I used for the build:
https://build.opensuse.org/package/view_file?file=kernel-reiser4.spec&package=kernel-reiser4&project=home%3Adoiggl&rev=a8836074c0847694a4d174755184ed35

Cheers Glenn
