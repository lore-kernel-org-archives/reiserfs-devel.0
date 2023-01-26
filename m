From: Fedor Pchelkin <pchelkin@ispras.ru>
Subject: [PATCH 4.14/4.19/5.4/5.10/5.15 0/1] fs: reiserfs: remove useless new_opts in reiserfs_remount
Date: Thu, 26 Jan 2023 11:58:45 +0300
Message-ID: <20230126085846.466209-1-pchelkin@ispras.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 6F45844C1015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
        s=default; t=1674723568;
        bh=7UfwmOWHFt6a/8Ex+qRvbVWeg3/58uB3TqPEaIYkyQ8=;
        h=From:To:Cc:Subject:Date:From;
        b=qcf/mdeb2Xa3/xVWW7JkFng9jZyiiobKzqheQRaW8UZK92Gx8xAPJzWxoJ3YvCM1c
         MbPB1Y6geeh6rLAup/BPbTDJ7JIdooGWEBLFN8xpc3wfxy+KnINLjRwinb4ydfVh8w
         wPZaGrQ4fk3pkczCsoNsn1TMr7gNiP6UiFr3mqoU=
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>, Jan Kara <jack@suse.cz>, Dongliang Mu <mudongliangabcd@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, lvc-project@linuxtesting.org

As described in the following commit info, new_opts value is not used
anymore and is not cleaned on non-error paths -- it is a leak. The problem
has been fixed by the following patch which can be cleanly applied
to 4.14, 4.19, 5.4, 5.10, 5.15 branches.
