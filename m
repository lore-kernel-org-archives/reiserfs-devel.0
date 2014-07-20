From: dimas <dimas000@ya.ru>
Subject: Re: Reiserfs 4
Date: Sun, 20 Jul 2014 19:42:56 +0400
Message-ID: <20140720194256.551f51f9@Ulf.tvoe.tv>
References: <CAMRsyOdq8mTCtxGH0h1m4pTOKZoGvk+N0aG4ADSFBx5qSHmUAw@mail.gmail.com>
	<CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1405870977;
	bh=IiqQmjdvSmSQ15c0IZoZYkXH1cL8nqoYghcHYmd5gLQ=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=C+LNgWz+IFQhhXphJBeU0KMO7tDZUpVxyCgWnDOVjIuFjX7f8mQmsS/iOqcgVwJtJ
	 SThaK/Lmb0nIhTKTarmIhaQteGXzf8d4p36Q8V5zpZ7ACK+SmzaW1oGJtRzkQ/v2nU
	 6EAOiC1sQAUZXIGeutYS4dhBj3s10ZZa6WdiuUkk=
In-Reply-To: <CAMRsyOd8j3oQ2OACOBnXBR4Zyt09AU48KNmPPkm2qj01BMA9Aw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

if you mean backup storage, why do you need such a complicated journaled fs
like ext3 or r4? for mostly static storage, modified once a day or even rarer,
i'd suggest ext2 as a simplest way.


2014-201 08:40 Bhikkhu Mettavihari <tv.lists@gmail.com> wrote:
> The fs on the backup servers is though ext3 since the guy that did the
> server setup was not familiar with riser.
> 
> When do you recommend me to upgrade to riser 4
