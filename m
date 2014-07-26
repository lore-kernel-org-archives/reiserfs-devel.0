From: Bhikkhu Mettavihari <tv.lists@gmail.com>
Subject: Formating Reiserfs 3.6 with bad-blocks
Date: Sat, 26 Jul 2014 13:46:55 +0530
Message-ID: <CAMRsyOc5b+CejzE4R2Oz7367+N=v6dGR4P2eoVph=E=A9gMJYg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=bNKhd5Yf9snup5FTuJEGPQQVikXue+Y6r+EET0BcR40=;
        b=y+W9wo58+NPpU/lR78vGASad6rLJL0zjwAdSFCiptmGJEIrTsCm1CBvQujLWD1Y4vB
         KsAe4S9cBRfFMrEGjio+nGmKZf1M8WHfHmthi30AWDQbWtwrkfqzpgZo/ITMRnZ2cgkr
         afuzlMl+vDrNpIv463sn17GU1xlwDdEPB+X6iZwTSi2MXMpCqA+OJYPYC3AiJsMZWC5+
         Ijx0WW9IyuNTigoIisYPpkjyvcFFL9L+VH20DiVWNn+0DJsWqOEMjRwpMf2CeaZKaUzo
         VDBTMMJFj/VVxZiKVW3Aza6Lq3ze1HNXTRZif5/+XEdC0OEMl2y1HLyUMqjAKk44j8Uo
         Zc5g==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

Greetings,

I have about 50 x 500GB to 2 TB hard disks in my setup.
All them are using reiserfs 3.6

When I get slow reads on a hard disk then I do:
# badblocks -b 4096 -o bad-blocks-finished-6-2.txt /dev/sdd1

# tail -f bad-blocks-finished-6-2.txt
77299721
77299722

after that I format the hard disk with this command:

mkfs.reiserfs -B /root/bad-blocks-finished-6-2.txt /dev/sdd1

But my hard disk still seems to have problems with reading certain parts.
I notice that the reading speed is going down to a very low level with
some files.

Is my method correct ?
or have I done something incorrect ?

with metta
Mettavihari
