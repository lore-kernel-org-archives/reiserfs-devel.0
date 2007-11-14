From: "Edward Shishkin" <edward.shishkin@gmail.com>
Subject: Re: Reiser4 crash
Date: Thu, 15 Nov 2007 00:28:33 +0300
Message-ID: <5c7c368b0711141328j444738c0i77011c02bd70c81@mail.gmail.com>
References: <5c7c368b0711141324l168d9b9fq1fb01cbddbc359cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=YQgcjeKIbD8KqG66Qa0cl7TvpVoUXUtt7IliAYmVeqg=;
        b=sAF5HskF0DrdBEAbXxaadDlEyQL8P0hH6Nwe6PpCBQfcUWsxRRPeVt5zNAQbsqx+306Kp96Td4Z8/pGdSq+FCxS9Ypr+R5mT4By2A+4V2/QBbH/vow727rXcSh3O9+J4jpNo56R06+OFIq+7jZ7H79TU5YIhddgKtwOUPC0lRVA=
In-Reply-To: <5c7c368b0711141324l168d9b9fq1fb01cbddbc359cb@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chathi <hubert@uhoreg.ca>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Hubert Chathi <hubert () uhoreg ! ca>  wrote:
> On Thu, 18 Oct 2007 17:34:49 +0400, Edward Shishkin <edward@namesys.com> said:
>
> > Hmm.. this is the bug encountered by Zan Lynx a long time ago.  So my
> > fixup was insufficient. It seems some race take place here, I will try
> > to catch this..
>
> I haven't had this problem in a while. (no changes -- same kernel,
> reiser4 versions)  Perhaps it was just a spurious hardware error.

I would be more pessimistic ;)

>
> > Hubert (Chan) Chathi wrote:
>
> >Reiser4 sometimes crashes:
> >>
> >> 2007-10-17_14:59:54.11562 kern.alert: [54537.551000] BUG: unable to
> >> handle kernel NULL pointer dereference at virtual address 00000000
> >> 2007-10-17_14:59:54.16463 kern.alert: [54537.551000] printing eip:
> >> 2007-10-17_14:59:54.16467 kern.warn: [54537.551000] c01f5fd3
> >> 2007-10-17_14:59:54.16470 kern.alert: [54537.551000] *pde = 00000000
> >> 2007-10-17_14:59:54.16472 <0>[54537.551000] Oops: 0000 [#1]
> >> 2007-10-17_14:59:54.16475 <0>[54537.551000] PREEMPT
>
