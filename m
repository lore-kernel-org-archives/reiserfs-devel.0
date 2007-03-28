From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Reiser4 does a disk write with even no disk activity during every fsync()
Date: Wed, 28 Mar 2007 18:18:11 +0800
Message-ID: <6ec7a4340703280318p27bf30adp1455af6f71f9bb00@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30623-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=WMECRZH3V705qRdBoe9OSnmXBIi3+dLucRISu+bqG8CJAOo9P9XDbYYLwmvbaP6FvEe7PjNLfns6yxokyrR8daVBtTQlrQe4KwgH+nDhZJbcbs2U1AgFC71kinmt2Eh3hKo58ps1c+SrOlsQvdkHwaXN0oD8sNHpte/h3LzIUQ8=
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!

I see a previous topic talking about sync(), I wrote a program write()
a 44B file, and then fsync()
I used "#iostat -d 1 -p hda|grep hda3" monitored many times and found:

for a single fsync(), these sectors were wrote:
ext2         16
ext3j/o/w  32
jfs            16
xfs           10
reiser3     48
reiser4     128

for multiple fsync(), I use "while (1) {sleep(1); fsync()}"
ext2         16/0/0/0/0/0.....
ext3j/o/w  32/0/0/0/0/0.....
jfs            16/0/0/0/0/0.....
xfs           10/0/0/0/0/0.....
reiser3     48/0/0/0/0/0.....
reiser4     128/48/48/48/48/48.....

so you see while there is no other disk activities in /dev/hda3,
reiser4 continues writing something......?
