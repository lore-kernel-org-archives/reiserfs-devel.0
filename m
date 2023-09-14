From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: Re: [syzbot] [sctp?] [reiserfs?] KMSAN: uninit-value in __schedule
 (4)
Date: Thu, 14 Sep 2023 12:25:45 -0300
Message-ID: <cbakbuszcnwtfkdavtif3lwfncelm2ugn6eyd5pd5dmdocxqh5@3op6br7uaxd7>
References: <0000000000007285dd0604a053db@google.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694705150; x=1695309950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVJRtk5Aaf2CEUODsgUAPBMiRGZen6YdQG505lEua6A=;
        b=W6/qVRjhfBHmc2Nx6B2nYMA+WNq1ROIP+SEyt6KUdALMW61RwmkDTxot5w/GIdctDO
         oSGUF1aXBi7nKTZkbEzIgBmeLJchQRfIHOLawtxf7kfvrtjsvfa+7RkSYapBj1an860z
         /ri/OU3+Bq2GQzH0ELT6fENjt406cU+6+jaFeLF/bp/jyuH0OB1w9njqUG0dQtmcPyzt
         CL+LOOLGWKCHxfaOwKv1297tNM5ZvBKWDHjh0DRXSX9QdM1pmM4bPODcJy1UACd1LeJe
         iLyG4Q34W+E7RKn2iA63zlitk0x3XGPhpQz+FFO90YurLhp7B9gCNRXpkJ52oA8pUzcC
         8zbw==
Content-Disposition: inline
In-Reply-To: <0000000000007285dd0604a053db@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+00f1a932d27258b183e7@syzkaller.appspotmail.com>
Cc: bp@alien8.de, brauner@kernel.org, dave.hansen@linux.intel.com, hpa@zytor.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sctp@vger.kernel.org, lucien.xin@gmail.com, mingo@redhat.com, netdev@vger.kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org

On Tue, Sep 05, 2023 at 10:55:01AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a47fc304d2b6 Add linux-next specific files for 20230831
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=131da298680000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6ecd2a74f20953b9
> dashboard link: https://syzkaller.appspot.com/bug?extid=00f1a932d27258b183e7
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=116e5fcba80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=118e912fa80000

Not sure why sctp got tagged here. I could not find anything network
related on this reproducer or console output.

  Marcelo
