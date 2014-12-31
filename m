From: Felipe Monteiro de Carvalho <felipemonteiro.carvalho@gmail.com>
Subject: Reiser 3.6: Recover partition start position & Journal
Date: Wed, 31 Dec 2014 09:50:39 +0100
Message-ID: <CACyNnZP36ZsPJix48p9kAozdK0CFG+e_2z-xXH=mC2YwPnwBFw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=sqDpzsE+BBO1ovL+jrKFhjIWAoQm7hET1/Ig+VzPU64=;
        b=MKA/j5wr3A/ZinsHoaul/bkPhNph3EiKeJRjhosQz24ExOQMknF76AVfQB+Z+TYEOG
         nKb9Km2UPDNlwrJVepvJFj/MVyQFjLYcLhcGF1hFgwF6HB6Z6v1Tf6nlOEKotK9Wumdq
         +nd4vgEUsy1P5sy54Z4giS08FnLlVSxXn4G5guO/ULmhXQCtK1IHETZaDmOUL35OTyOQ
         tApdjXHUnuiZfTmldWH/4nn7GJkgR0jgK+cDANxtbShNhkl5QPbUaayT/m8LEv4Iiu6X
         rmVRqk2z71U3rQRLAxcgmVv6E06vu4qCeLFBbV6F2gXXb6Bw+EWVJCQizDyjjVyqW1m5
         bw/Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hello,

I am writing a utility to recover ReiserFS partitions in case of
damage in the MBR. My main problem is figuring out the start position
of the partition. Does anyone know if there is any structure that
contains its own offset or anything else that I can use to figure out
the start of the partition? The superblock contains the partition
size, but no info about the partition start =(

Also, I created a Reiser 3.6 partition, added some files, removed some
files, and looked  into the Journal (block indicated in
jp_journal_1st_block) and it looked pretty empty, lots of zeroes =(
Any idea what I am doing wrong? Do I need a special command in linux
to force activation of journal?? The block indicated was $73 and at
volume position $73000 there was: 0x17 0x00 0x00 0x00 0x05 and then
zeroes. Maybe this is some kind of pointer to the real jounal?

I know that this list has mostly people talking about Reiser 4, but I
couldnt find any other list about reiser 3 =(

thanks in advance for any help =)
-- 
Felipe Monteiro de Carvalho
