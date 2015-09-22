From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-4.2
Date: Tue, 22 Sep 2015 13:37:56 +0200
Message-ID: <56013D94.40509@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=SUPN2TqATVV1q6r71kaECvCg/AR3uACXU+MotIwZgjk=;
        b=t3iiQpOCNHGtAQlMGMOk+G38UYvdMac0XkHspiyQ9qSB1eRQ1agcczHOjRQAQ/HzCT
         S5yKYBvA1iNUUrk6LpuTYhlqZqrrxBgSsC0U/P908cEV8GzpjZUd6/lHjbsq2PE0MbRP
         gHxTaRTj+Cc6H8ZhlIshyv3pgjgbBMs1hsWJlujRnxJ9mAQgpPy7byNoWG1/D7lCWIN0
         TLmW8KjcWPJ7fXMcoho7KZ6y2hlwwcgUW7UBuAWAMUWPk9RIDKcosUqmSt6i3kfri4OF
         4p8uIEV/iBsgLetzHpnuodtqgqnrFBCpV/nYJXTXNxj7stMBFzMoqWFu9SYp1aqr2IAu
         tJPw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Changes:

. cancel_dirty_pages() is back again, this time with cgroups
   support;
. set_page_dirty_notag(): add support for cgroups;
. call inode_attach_wb()/inode_dettach_wb() when init/fini
   fake inodes;
. BIO_EOPNOTSUPP has gone;
. file_remove_suid() remaned to file_remove_privs();
. adjust reiser4_follow_link() to the new non-recursive
   procedure of name resolution.

Please, find here:
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/

Thanks,
Edward.
