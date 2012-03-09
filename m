From: Sandro Souza <escovadordebits@gmail.com>
Subject: Where may I find a reiser4 patch for kernel 2.6.32-5?
Date: Fri, 9 Mar 2012 20:01:38 -0300
Message-ID: <CANish_kZ=WNx7tqAceBESUAiyu1yJcpy9K8G4VnsKExkRpiT2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=jpIYbyGdb8o4nJfFAFjyA3qC6xWn28lMGSRzQgsl9OY=;
        b=UpdXkljIrQEFIAEHXK4SiZ5+R/zVlddrmLnN7Vbt1+d7DMQVXCcwgabLXniXLIiCtm
         6KiboA6mOdmTrN3IISMma/85Owuo/yzldNSfSuXvDMTwrg3tzxVqAJhTHeRmnveYGinh
         g7jrasFTK2QGwppslziW1Em9hXp+w9mOQuuXD6OqSI+Vflast7LhyVcZU8uqLXFraM7I
         laMrGndWXoAcNVBJnM+lW/gLVO8SATBE0k5xLZ4Xgb6/u6y4nK8d3Q55MU1HcIYBq3rK
         legKAYzhICahRpYVR/g9iQdzcyfZRTvT9EjM5gAZlhS/2HMJb3Qsn93I6oxWAXUYdaCT
         GzxA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hi everybody.

Sorry for my bad english, I'm a brazilian nerd. :)

I'd made a virtual machine (using virtualbox) and I'd installed a
Debian 6.0.3 inside it.

The kernel version of the Debian 6.0.3 is 2.6.32-5 (uname -a) and I'm
searching for a reiser4 patch for this kernel.

After it (recompiling the kernel sources with the reiser4 patch,
without the "working" of Andrew Morton and Riffard Laurent),
I'll remaster a ISO image with remastersys.

I'd tried with Ubuntu 11.04, but the GParted version of Ubuntu has the
reiser4 option disabled. :(

The Debian GParted version has this option enabled, so on, I want to
make a ISO image for a fresh installation of a Debian distro with
support for reiser4.

I'll modify the remastersys-installer script for give the option to
use reiser4 too.

Any helps are wellcome. :D

Please, NEVER give up of this fantastic work. I know that reiser4 IS
the best filesystem, and I want to use it.

Thanks in advance.
