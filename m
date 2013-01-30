From: Gleb Baryshev <gleb.baryshev@gmail.com>
Subject: Re: Reiser4 panics on kernel 3.6.11 (balance_dirty_page_cluster,
 edward-1547)
Date: Wed, 30 Jan 2013 19:48:28 +0100
Message-ID: <51096AFC.10400@gmail.com>
References: <5103A388.2080906@gmail.com> <5105BD24.1020009@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=QOjjGrunKOqOk86LJw0f+fVntEJUIftFTqCI2DSGMp8=;
        b=cPSTAQ4hAgP+qMayPIIVTMVQCDETOLfBBWo2vf/gr4OUvrrOw4E7PzjUeV2RdBGLyR
         aCMBzU1vI4RFMpy8lwymCNGz7P2XdC/VuhjzA1agvpQCzAZSGGm9Y2fK3HD+/gu4r1sB
         JXM+eyrzz1dtrZPE+aKDe11lcJ7i6/QU6/6lIzgBGFxePrEgtY1lIH38vD9dGbdh7HXj
         nRR9hpO5UpS+FKJfJuo2mA25Qfpzj2ZJT4t1BoWhSaL8Q8mNUgdjPliAbeA3o7dtGFQM
         s1igLh+2SbtTnkj+5wfzuIIaBBgb8k5VxgzZA8NNFQNgcZ9XGmP2IUfqsLbEC1bodvKJ
         DNFw==
In-Reply-To: <5105BD24.1020009@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

28.01.2013 00:49, Edward Shishkin wrote:
> Hello Gleb,
>
> Thanks for the report!
> Please, find the fixup in the attachment.
>
> Edward.
> P.S. Reiser4 debug mode results in dramatic performance drop
> when tail packing / compression is on. Use it only when something
> goes wrong...

Now it works ok, thank you for the fix and for the hint!

Regards,
Gleb
