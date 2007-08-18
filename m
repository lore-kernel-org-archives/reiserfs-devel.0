From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4-for-2.6.22-2.patch
Date: Sat, 18 Aug 2007 23:44:17 +0400
Message-ID: <46C74C11.7020304@namesys.com>
References: <loom.20070728T013136-358@post.gmane.org>	 <46ABACE8.4050306@namesys.com> <e85b9d30708181048v35301591vba01deced5e0824d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <e85b9d30708181048v35301591vba01deced5e0824d@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew <jackdachef@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Matthew wrote:

>Edward,
>
>I just encountered a pretty strange situation:
>
>first some data:
>I'm running hardened Gentoo with glibc 2.6.1 & gcc-4.2.1 both with
>hardened use-flags enabled
>- my kernel running is a 2.6.22-based kernel with grsecurity and some
>other fine speed enhancements (ck-patchset, adaptive readahead, latest
>reiser4 patch 2.6.22-2)
>- this also happens with hardened-sources 2.6.22-r2 + latest reiser4
>patch 2.6.22-2
>
>every time I'm booting into that system I get a corrupted libuuid.so* file:
>it says things like: libfoo isn't an elf-file or similar
>
>it doesn't seem to matter if I'm using e2fsprogs 1.39 and
>corresponding ss and com_err or e2fsprogs 1.40 with corresponding ss
>and com_err, with booting I mean it only gets to that point and then
>refuses and reboots since it's dependent on that critical thing (??)
>other files also seem to get corrupted, I can't say which ones since
>it reboots pretty fast
>
>util-linux version is 2.12r-r7
>
>it's strange to say but it doesn't matter if I'm booting the kernel
>with ro or rw on /root data still gets corrupted (where /root is/was a
>standard formatted reiser4 partition with mkfs.reiser4 out from a
>livecd with 2.6.21-based kernel with reiser4-patch from namesys if I
>recall right
>
>there's also no difference whether I use the old baselayout-1 or the
>new and faster baselayout-2 (for that I have to append 'rw' at boot
>otherwise reiser4 won't boot since it isn't recognized right)
>
>gcc-version is 4.2.1 hardened with pie 9.0.7, I'm sure this also would
>happen with other gcc version
>
>I'm attaching my kernel-config so that you might be able to reproduce
>it (hopefully) or at least get an idea of it
>
>since I need this pc right now I had to replay my system from a
>tarball to a reiserfs partition, so I unfortunately can't collect any
>further data
>
>Mat
>  
>

Hmm.. It would be nice to compare hexdumps of "corrupted" and original
files. Although, you have migrated to v3 already.. Well, I will keep it 
in mind,
thanks for the report!

Edward.

