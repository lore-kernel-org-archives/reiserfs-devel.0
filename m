From: =?UTF-8?B?7ZmN7IugIHNoaW4gaG9uZw==?= <hongshin@gmail.com>
Subject: a suspected bug at let_transaction_grow()
Date: Tue, 1 Sep 2009 22:39:34 +0900
Message-ID: <2014bcab0909010639k437e0fc5y14c47de28c1c57d5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=cw5hlFqSN1FqCSfuJDvKWrrrNTpPGSoxbdjZPslNwx4=;
        b=uHvPXB/0j0sH3YX6c5ZI3fH7Ux9I0tUYilUoMvt06COCKwZkLUY68o+BKJbQ17RElz
         qzaX7aGb+YzQKH7hKLv8Gf444xtzVNSN6zyqHEPgjFSPoYmdUNUegC2M28c0yk727KDR
         RJIpsO9GwfSDfDlj7/HDdQKe21sqq5RJd5tqU=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hi. I would like to report a suspected bug at let_transaction_grow()
in fs/reiserfs/journal.c of Linux 2.6.30.4.

I found this suspected bug while I survey the usage of atomic instruction
and memory barriers. I am not certain whether this report is real or not
since I do not have ReiserFS background. But I hope that this report is helpful.
Please examine the report and let me know your opinion.

In let_transaction_grow(), I found the following code for busy-waiting:

	while ((atomic_read(&journal->j_wcount) > 0 ||
                  atomic_read(&journal->j_jlock)) &&
                  journal->j_trans_id == trans_id) {
	    queue_log_writer(sb);
	}

However, it may result starvation(or infinite loop) since there is no
memory barrier for atomic_read()
(atomic_read() may read out-of-dates value).

Thank you.

Sincerely
Shin Hong
