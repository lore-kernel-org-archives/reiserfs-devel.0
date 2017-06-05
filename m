From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: BUG during a backup (sequentially reading the whole
 fs) on 4.9
Date: Mon, 05 Jun 2017 16:41:58 +0300
Message-ID: <59355FA6.9020204@gmail.com>
References: <1488211296.5395.2.camel@intelfx.name>       <f7c80f08-6e89-226b-7914-54d2385aa834@gmail.com>        <1488212421.5395.3.camel@intelfx.name>  <4a88640c-8d98-1cc0-5713-3abd76abf208@gmail.com>        <1496328566.8314.2.camel@intelfx.name>  <290631df-dc46-e8ef-041f-c353b7eecf88@gmail.com> <1496339175.12062.1.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=BEbFmchz4fI45ZpFhZWnj9LfNGVhbHQTUfu5ppKvCK4=;
        b=gZyy0E8aAnW6T+AGzoSbt1SKdIuHC2FEUDIsc+uJPik2GUQfhJiqiOisXOJtDaxwvK
         F3YgTc5K8HdMjtRVQxUhUle6GTGhk2TFjdD250oOfXao8FLFnxg94T8IR3yzVfioQIIq
         SbFgL0MoavMuLELIBDGa4e7pd5F+VoXPL2Kx+QNi36KSSizBfwrDRhndE903L5fBKIIe
         lhfAEiXM7OLzdHqXVHJd7a5ErT5O7/vUOPtLLYWOxgmnzx93eO2EsiwZW2ke7JjXWk6C
         VkfyomCcRum0cAJGKdPi2mlOa0KB7jgWadd/h9HuNXQHxRg2zIsj2M1GPdTCZ4BX3XKw
         iO+g==
In-Reply-To: <1496339175.12062.1.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Created a ticket with some comments.
All findings will go there:
https://sourceforge.net/p/reiser4/tickets/7/

Thanks,
Edward.

On 06/01/2017 08:46 PM, Ivan Shapovalov wrote:
> Yes, it is reproducible each time when I backup to an empty repo
> without checkpoints (so that borg has to fully read all files). The
> filesystem is consistent by fsck.
>

