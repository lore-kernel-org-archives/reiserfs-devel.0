From: "dE ." <de.techno@gmail.com>
Subject: linux 3.4.2 fails to compile with patch
Date: Fri, 14 Sep 2012 09:50:03 +0530
Message-ID: <5052B073.4080506@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=Vodytt6O+GsfEhs7Kv61Zpf2LyaARFuchkkhlD35uKo=;
        b=BYozv881H6OC7vzb8dSL2Lt5pvBd+DSwSfgnxUaLeRJ4fbZ4Cs7BM0wMmEoC+XeGKK
         5VoWguLi+QucIKKvVYTYUj/2tJghTmq9P3pXJRU5apwdFwEmpyIWB6fU9PVjWtQ1cQiB
         YxW+UWfcnkDIKpTVietENbfAMiPc3sWGWWNcuftrpQ90tydRELP8M0xpohaxZVU7N1a1
         nKjMs79oR7zBySgzRCmHnQ1Euvx0vqMVMXb1lrvMblPEBoCA2LMNrG0TmQFoL4dp5dqN
         UjPGQGgEloDbT4HNq98BLPDPJ0wSKQ6RhiIj2Yy8rKvTy71QJNjOmI8dVnetsjne2r7Y
         Wuhw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hello again :)

I downloaded the recent patches for 3.2 to 3.5 kernels, and applied it 
to my 3.4.2 kernel. It results in the following --

CC      fs/fs-writeback.o
fs/fs-writeback.c: In function 'generic_writeback_sb_inodes':
fs/fs-writeback.c:560:6: error: request for member 'nr_to_write' in 
something not a structure or union
fs/fs-writeback.c:561:6: error: request for member 'pages_skipped' in 
something not a structure or union
fs/fs-writeback.c:563:3: warning: passing argument 3 of 
'writeback_single_inode' from incompatible pointer type [enabled by default]
fs/fs-writeback.c:344:1: note: expected 'struct writeback_control *' but 
argument is of type 'struct writeback_control **'
fs/fs-writeback.c:565:38: error: request for member 'nr_to_write' in 
something not a structure or union
fs/fs-writeback.c:566:29: error: request for member 'nr_to_write' in 
something not a structure or union
fs/fs-writeback.c:569:10: error: request for member 'pages_skipped' in 
something not a structure or union
make[1]: *** [fs/fs-writeback.o] Error 1
make: *** [fs] Error 2
