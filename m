From: michael chang <thenewme91@gmail.com>
Subject: Re: [PATCH] fix problems related to journaling in Reiserfs
Date: Wed, 31 Aug 2005 09:42:41 -0400
Message-ID: <b14e81f005083106423c6adc4@mail.gmail.com>
References: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <6.0.0.20.2.20050831191551.03fdbac0@129.60.53.12>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp>
Cc: reiser@namesys.com, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On 8/31/05, Hifumi Hisashi <hifumi.hisashi@lab.ntt.co.jp> wrote:
>    I noticed that the Reiserfs has some problems related to meta-data journaling.
>    I suppose that transactions regarding meta-data should be written to a
> disk every meta-data change (for example, i_size is increased) in ordered-mode while
> synchronous writing is performed. 

Surely we don't want this.  Look at the papers on Namesys's websites,
about the atomicaty and the banking example.  But that's just my
personal opinion.  Besides, I believe it's more likely that usually
the power gets lost than the SCSI or IDE cable gets disconnected,
AFAIK...

-- 
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
