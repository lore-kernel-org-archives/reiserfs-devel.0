From: Paul Whittaker <pawhitt69@gmail.com>
Subject: Reiser4 on an inherently read-only block device
Date: Tue, 12 Apr 2022 09:42:21 +1000
Message-ID: <c80ff400-479f-0730-506b-5a1e8edf9e82@thinlinx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:content-language:to
         :subject:organization:cc:content-transfer-encoding;
        bh=N2D3bUjPflxxpum2YkcEWYPJj6FANBRbgMO3fHoQVCI=;
        b=CkGPDTYBhrQqtAaQVUOra+9ne0yroCLW/+vAREvKm/N1cI1J9haC2OUmXyEbM+FOKJ
         46B4QI5b4XdBT04HzJL+YqsuqiC/EhMiHGx6Xwh/rUJOnl40NEOLQ4EMwKOqANisvHxG
         kCCAIU8A6xCV2fYZzbT8oHkLivsrA0T5O/tOJ/JzIV56atzcScxktLo/yiPA9HJGAkXc
         vg3bjUb5Giy2C8Yo7QJfI9KcQDrp5TQrEUE0vWPAvnLDWdVi5pF+6/RUm1Ywr/uyTaGz
         bOF7VtJQhDpu2+BZHSFOtPmIZnWM2bjJB86XQigkCa/j70fG/swF31WXZh8St3OcWODC
         8bVg==
Content-Language: en-GB
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: reiserfs-devel@vger.kernel.org
Cc: John Nicholls <john@thinlinx.com>

Hi Reiser developers,

Reiser4 is almost perfect for our (thinlinx.com's) needs except for one 
problem: it wants to write to the block device even when mounted 
read-only, and handles errors ungracefully (read as: crashes and burns) 
when it can't - specifically, when performing the umount operation.  I 
haven't been able to devise a simple reproducer for this, e.g. using a 
tiny ISO9660 filesystem, so there must be some subtleties that I am 
unaware of, but it happens 100% of the time when using our real data.

We have a couple of use cases that necessarily involve inherently 
read-only block devices:

1) We want to provide an ISO9660-based installer for our O/S that 
contains a Reiser4 (kinda-sorta-)root filesystem image that the 
installer would mount read-only via loopback to inspect certain files 
prior to dd'ing it to a target disk.

2) We want to share a copy of the Reiser4 (kinda-sorta-)root filesystem, 
which is mounted read-only on a writeable medium, read-only via the 
ATA-over-Ethernet protocol for use by network-booted instances of our 
O/S (this is feasible because the *real* root filesystem is AUFS with a 
couple of additional writeable layers).  The resulting /dev/etherd/eX.Y 
block device is inherently read-only - if it isn't, we risk write 
contention and Bad Things.

Unless I'm missing something, Reiser4 doesn't provide any mount option 
that would permit safe operation in the above use cases. Btrfs provides 
a "norecovery" a.k.a. "nologreplay" option that allows suppression of 
transaction log replay in situations in which the integrity of the 
filesystem is already guaranteed.  Is it possible to add a comparable 
mount option in Reiser4?  It seems to me that read-only should mean 
**read only**!

FYI we are using the latest Git state of 
https://github.com/edward6/reiser4 that compiles cleanly on a Linux 5.4 
kernel (commit 1a55b8ed6e0ac4de20135146d77bac4607d59fbe).

Regards,

Paul Whittaker (<paul@thinlinx.com> or <pawhitt69@gmail.com>),
ThinLinX Pty Ltd
