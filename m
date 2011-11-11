From: Pierre Ynard <linkfanel@yahoo.fr>
Subject: Re: Oops on reiserfs corruption
Date: Fri, 11 Nov 2011 20:47:53 +0000 (GMT)
Message-ID: <1321044473.3955.YahooMailNeo@web24103.mail.ird.yahoo.com>
References: <20111110221346.GA20887@via.ecp.fr> <4EBCF860.7070404@gmail.com>
Reply-To: Pierre Ynard <linkfanel@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s1024; t=1321044474; bh=68fTYhFhmSkJ2+laJHewRG5Y7yTzwrCDDIkK4ulRIE0=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=L+AlLS49L4nQq62YyG9kd3b9mZF8Wr/v19SMrkOEuhETLqB90BjEiWDxd5NRWSBnwh4qWijEFuUSWwXnQyoZVA7KMNwgeCfOrwzVIiEYLrGDdxVU7BwAlcnk78IT+mWDnQT8CibcHFMgyMQnm/G/Sinl72SrXy20/Jc9VL46Ik8=
In-Reply-To: <4EBCF860.7070404@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>



>>  A reiserfs filesystem on my system got randomly corrupted, and then
>>  would trigger a 100% reproducible oops:
> 
> The whole sequence (making corruption - trigger an oops)
> is reproducible?

No, just the oops on this particular corruption. On this system, from
times to times I get a corruption, I don't know how, but usually it
just appears as a phantom file that I can't do anything with, not an
oops.

> If yes, please describe steps how to reproduce.
> If no, then please extract file system metadata,
> with debugreiserfs -p and let us to download this
> before fsck-ing, if possible.

Maybe if it happens again.

-- 
Pierre Ynard

