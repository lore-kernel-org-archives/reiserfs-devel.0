From: Matt <jackdachef@gmail.com>
Subject: linux-3.16.2 queue (3.16.1+)
Date: Thu, 28 Aug 2014 17:16:58 +0200
Message-ID: <CAG-aW06Q9VVyW-atZEsURs0rfjysdEbxb_dC4Tm3K-tZg++tQg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=DLk39mvOc9FShjKwH+M8MKkSKkCVNd0XC7c2FsHjj/U=;
        b=R5E/DmSoTk5X6mOQ+xchrFap/hV8uYi+dSiKzynHVJCIeon4mgp/zB3UcP1sAmpxej
         84CftgbMMCgP2cNEsFG7VPiWh7wMW/7/JvWrzcFOifURScORkjn2DzRWBG+oF78yUZv7
         wfOHoferzb54lkaUhCSXZ7HpcMRbdWBELjZPiXpy61lhTa75ZdT+E5eYsgELz2fzvxDp
         YT1CukID9vHNmEeII3xUxdwad4NyY5cJuUI9fGdbKY/+eIRzX5IrEZkQIk2z3V3hi9je
         6FsaUv21M2m2VkR/oMNkjMUBa6q08H+Zmf8ZRirXdyMz0wvHPY1GAQ9Y/a6WO3MgTd7o
         Wyag==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hi Greg,


please consider adding the following 2 patches to 3.16.2:

Jan Kara (1):
      reiserfs: Fix use after free in journal teardown

Jeff Mahoney (1):
      reiserfs: fix corruption introduced by balance_leaf refactor



Reason/Related:

https://bugzilla.kernel.org/show_bug.cgi?id=83121

https://bugzilla.kernel.org/show_bug.cgi?id=83321

http://forums.gentoo.org/viewtopic-t-998538-postdays-0-postorder-asc-start-0.html


Many thanks in advance


Kind Regards

Matt
