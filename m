From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Reiser4 for 3.11
Date: Mon, 09 Sep 2013 14:53:06 +0400
Message-ID: <7898211.Vq1QlONyyz@intelfx-laptop>
References: <3473565.3piOE8Lf58@intelfx-laptop> <522DA671.9040006@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=ZyKwUm4+20Rt8JrUSd/N6odQ2XoJ2Qw4DfTjndARIvc=;
        b=i9iIuz92Kuunqyxgzv1Ch6LQ/EefgdZog/z91LYp/2n3tL2bFHubuU1V3j90FeiOle
         LbeDkeRliTGgVKFwjN9LXFo4R5eWtgMXAkJMjUOM7DMShH//KPNFURDTWC+H8I2F7VlN
         HzKe2+/RdMEo2/8rdf6aYx+N9+tI/U4gTEtwd4eO/xSgAYdx0TXvHj87UPN00Wiz5K5c
         /scH6wHXA0jqSLFtTHUEvWdvaM3grEP+zQnV7MPaGTwOPI1tmTXGJkireYz8CLxFq5Fs
         KUnHF27L6P6hziW71WeyKr6DDcKeIeFv1dCUO+MOdLAjOODsywRi8FftfgPRdGU/248v
         VCZw==
In-Reply-To: <522DA671.9040006@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Monday 09 September 2013 at 12:44:01, Edward wrote:
> On 09/06/2013 07:36 AM, Ivan Shapovalov wrote:
> > Hi Edward!
> >
> > I'm sorry for the silence... The summer, as it usually happens, turned out to
> > be not-easier-than-studying-days (personal life and all), so unfortunately
> > there is not much progress with TRIM implementation for reiser4. There is some
> > code, but it's stability is zero.
> >
> > Anyway, here is my usual attempt to port reiser4 to next kernel. 3.11 got a
> > significant API change (readdir() of file_operations changed to iterate()),
> > and I'm unsure if I done that correctly. But it works, unlike TRIM. :)
> 
> 
> Cool. Thanks!!!
> 
> 
> >
> > (FYI, iterate() differs from readdir() mostly in that it works with a copy of
> > f_pos instead of with f->f_pos directly.)
> 
> 
> AFAIK they fixed races in readdir() and friends.
> I'll take a look at this more carefully...

Yes, I've seen that reason. I'd be grateful if you could check my patch - because,
again, I could have easily missed something wrt. locking and whether we can modify f->f_pos
in the code that fixes it up when entries are inserted/removed.

- Ivan

> 
> 
> Edward.

