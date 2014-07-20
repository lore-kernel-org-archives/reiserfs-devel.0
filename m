From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 0/1] reiser4: iterate over extents in discard_atom
Date: Sun, 20 Jul 2014 14:47:32 +0200
Message-ID: <53CBBA64.9030909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=Cl/3wkwXtAwrsp67gN/1ITZ4SsHPo9sXaNLv9j6rtIY=;
        b=hnZHFX9rMfnP+L0d7VWsrtFx7w5aSERp5lssnzRkhhCDydKoARCfdAp8kh5m8T5Gdm
         ah9AlCNI2qvw49vmgSgkTO5KfO+X+2Ni51mOKpD7oAgwtcGiaQ9s/9ddDeDgz8AjmG7Y
         u1odpWE0aBApOvcDbN5oAsZuc/Cq4soXZDhFmTuzDwkCpo07X8a7bnlnYZDyE+TsSAwa
         pzQPY2hUG91h/VUfVyXEufW1rQTjQ5vLImjIJdCA/598fzMNZUDxDCoHDogUSGnXcilc
         vLFxeqNbBQ7qxGzrg2BdH6jGXr9sR97W1lDxJQTmROuep//X3oDEwKlPYB7RhwoqhaIn
         zDeA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

In this version we support all erase units (not only ones, which are 
powers of 2).
I put a restriction 1MiB for erase units just to filter possible 
garbage. We can
increase this boundary, if needed.
Alignments with (bdev_discard_alignment() % s_blocksize != 0) are still 
unsupported.

I have added mount options to specify erase unit and alignment in bytes. 
This is
only for debugging purposes (to emulate real situations). Usage is the 
following:

mount /dev/xxx -o discard,discard.unit=yyy,discard.offset=zzz /mnt

Thanks,
Edward.
