From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Could reiserfsprogs display volume labels when doing fsck upon boot?
Date: Fri, 14 Oct 2005 16:07:20 +0400
Message-ID: <200510141607.21066.vitaly@namesys.com>
References: <434F7D17.1030203@people.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26524-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <434F7D17.1030203@people.pl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Wiktor Wandachowicz <wiktorw@people.pl>

On Friday 14 October 2005 13:40, Wiktor Wandachowicz wrote:
> Recently I've changed a filesystem on one of my patitions from ext3 to 
> reiserfs 3.6.
> 
> All of my partitions have labels (hint: "mke2fs -L") so at boot I can easily see
> which partitions are fsck-ed. So while reformatting my last partition /dev/hda8
> as reiserfs 3.6, I've labeled it too (hint: "mkreiserfs -l").
> 
> Alas, upon boot reiserfsck never displays a volume label set this way, only:
> 
> Reiserfs super block in block 16 on 0x307 of format 3.6 with standard journal
> 
> While ext2/ext3 fsck displays a neat message for every partition it checks, like:
> 
> BOOT: clean, 62/297256 files, 60311/594405 blocks
> 
> 
> So, I wanted to ask you: is adding such a functionality to reiserfsck a good idea?
> I've tried to add it myself and it turned out to be four lines in one source file
> (well, two lines actually doing the job, because one line is a comment and another
> one contains a curly bracket). I have a small patch against reiserfsprogs-3.6.19
> (applicable to the 3.6.18 and 3.6.17) ready to be sent.
> 
> Now my reiserfsck tests if volume label exists, and in such case displays it like:
> 
> SPARE: Reiserfs super block in block 16 on 0x307 of format 3.6 with standard journal
> 
> 
> And yes, I know it's cosmetic :-)
> 
> But for me it's nice to have. This way my system behaves in a more consistent way.
> Maintainers I asked from my distribution suggested to ask my question at the source.
> What is your opinion then, reiserfs people?

ok, I will add it.

-- 
Vitaly
