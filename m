From: Viji V Nair <viji@fedoraproject.org>
Subject: reiser4 as a module
Date: Fri, 22 Oct 2010 15:32:54 +0530
Message-ID: <AANLkTi=o5bXDxY4XKSYzcX9fX4yHZRC68=oMk0sikViS@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received:from:date
         :x-google-sender-auth:message-id:subject:to:content-type;
        bh=5aIr5uf8lEGTZM0nBloGyhtChlTRaSwoohb7JIn63R8=;
        b=IrYGTrXqrqk/H0/v1nN/hRqRPjlUFjJORkxJp2tTy/PAGSRJZXhv/hgQLyn0Bd9llA
         OXrmkyvDcZhOvpGc1pr2SvBAqIP46kqXltFCfGXg8DJPv1SW4SWZbT0tdth6LYMD9wgX
         LrOCe3GOrIlG1EyxgH3wdCuWEM7/XY3fKXsHM=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi,

I have been trying to build reiser4 as a module, but the module which
is getting compiled having the "symbol" issue.

<snip>
reiser4: Unknown symbol lzo1x_1_compress
reiser4: Unknown symbol might_fault
reiser4: Unknown symbol mutex_lock_nested
reiser4: Unknown symbol zlib_deflate
reiser4: Unknown symbol writeback_inodes_wbc
</snip>

I could see from the reiser4 2.6.34 patch that it is adding
"EXPORT_SYMBOL" to few files in fs & mm directories of the kernel
source tree. Can we have all these symbols defined in the core source
tree of resier4 also? Do we have a patch for this already?

Thanks
Viji
