From: Ronni Holm-Nielsen <theronni@gmail.com>
Subject: Re: [patch 0/7] per-bdi flushing model improvements. reiser4
Date: Wed, 3 Feb 2010 01:47:50 +0400
Message-ID: <5e2ec5ac1002021347k3a8cd8adta5ff76efe1eeaadb@mail.gmail.com>
References: <201002020255.46920.edward.shishkin@gmail.com>
	 <20100202081728.GA2384@infradead.org> <4B6843E9.9070600@gmail.com>
	 <20100202194208.GD5733@kernel.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=T/6pg1oYMwT8yInpvoYc6mW03stgNfH5H2hcbFRU1cQ=;
        b=YDITFTYipYYx3fo/Mm7SdcFF6tPD7RprRBfalk5ISBYlk5xz2xWcyk+3PdF9MRp5O9
         5IaQVoFmeS0XDbmzrM4xaKXAIauhqzsL1tEsuWY91ThFWhDXd8XH+KyqNl+Fu6hRSoAw
         Icr8sRLv1UZwhGszpKZLkzNxO42dRkhkVHSjc=
In-Reply-To: <20100202194208.GD5733@kernel.dk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

On Tue, Feb 2, 2010 at 11:42 PM, Jens Axboe <jens.axboe@oracle.com> wro=
te:
>
> On Tue, Feb 02 2010, Edward Shishkin wrote:
> > Christoph Hellwig wrote:
> >> I got this introduction twice, but patches 1-3 didn't make it to a=
ny of
> >> the lists.
> Where?

To clarify (being a ReiserFS subscriber):
patch 0, 4-6 sent to=C2=A0Andrew, ReiserFS, linux-fsdevel, linux-kernel=
,
xfs, jens.axboe
patch 1-3, 7 sent to=C2=A0Andrew, ReiserFS

- Ronni
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
