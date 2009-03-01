From: Ilario Pittau <ilariopittau@gmail.com>
Subject: (unknown)
Date: Mon, 2 Mar 2009 00:21:01 +0100
Message-ID: <17c9de980903011521o4603b9d0kbfceb04e27dd540c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=rg8KU8X1zL2Vsh+ktJM/AiJiecGaDpEEl4UPwSTyoXI=;
        b=kdA1DXsByjSDapX/KZVdkJq4d8/0JpSXsPOFb3f2niMS4yruw/6jT9l4DRbTKOAMZX
         QbfweSARd1sJa7zmyO5jAIFGQ3IcCaGN58FtgQOqVCfsk1EB/QJD45KsWtB+6AQW32ux
         8pr4/J9iIQ7xpw4hev/pu12xFKb1gfypOMtnQ=
Subject: 
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi,
I have a problem with the REISERFS_CHECK module.
When I include it in the kernel the system boots correctly and it's
possible read from the reiserfs partition.
But when I try to write on, the system crash and go in kernel panic.
If I compile the kernel without the REISERFS_CHECK module it's
possible to write also, and the system does not crashes.

--
Ilario Pittau
