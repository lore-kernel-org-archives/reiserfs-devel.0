From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: BUG during a backup (sequentially reading the whole
 fs) on 4.9
Date: Fri, 02 Jun 2017 23:37:49 +0300
Message-ID: <5931CC9D.6080801@gmail.com>
References: <1488211296.5395.2.camel@intelfx.name>               <f7c80f08-6e89-226b-7914-54d2385aa834@gmail.com>                <1488212421.5395.3.camel@intelfx.name>          <4a88640c-8d98-1cc0-5713-3abd76abf208@gmail.com>                <1496328566.8314.2.camel@intelfx.name>          <290631df-dc46-e8ef-041f-c353b7eecf88@gmail.com>        <1496339175.12062.1.camel@intelfx.name> <59307242.5010705@gmail.com> <1496357947.4940.2.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=1wdob96WFEUfPW9JQYj2Zpiz5oOJ/qUExl30HEcHHxE=;
        b=EFF1zjkOxa3zBRiWAOUf837ZYg5raC/BuIRkF/Xlymo25NpsW6MgoTbly1pD1FmfuP
         WZ0/UKDxwOVUv5iSsQa1LazrYEg2r82zryN2Z93VCUurv0D5XafCwF33EoTVZdwFtYQq
         OP3gTGykquL2RhvPQi+P5a6pnOjZnAHhbxl7+hmXsTNvkLwwlPugoJOZM0CRDi1IAR4q
         GtkfaIfkk1VuGZjSB6lPs4QnTVEmpl2O5obWXG9aUc4c8BiajLVVIebtk9UCql/sMQi9
         S0qpILqEimLYRRgw6ssMoGFvQbB1+iMD8UKruVnx0CvzcQ451MTQSWK5PTRqVyTBmRCR
         fC6Q==
In-Reply-To: <1496357947.4940.2.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Alas, can not reproduce it.
I suspect garbage on the leaf level. For some reasons
fsck can not detect it (on semantic pass).
How big is your partition?
Could you dd it to a file and let me download that file?

Thanks,
Edward.

On 06/02/2017 01:59 AM, Ivan Shapovalov wrote:
> Looking forward to your results.
>
> And by "looking at the tree" you mean the debugfs output, right?
>
> Thanks,

