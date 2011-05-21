From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 + loop + NFS = disaster.
Date: Sat, 21 May 2011 18:31:12 +0200
Message-ID: <4DD7E8D0.2090300@gmail.com>
References: <4DD7E3C9.3030103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=DrWs52aNlwL8XDJB7PTnq3OOgnqHif0hIL92At8y1JE=;
        b=cf9GC3EvJK93X5PWESblsM38ms68Y3j9EgPHWcpbWMmWhasOn4UpobgMuSunM6uG0c
         Sllyt1S+Dedb9ULGO227iAXO4rxNz70zlI5llQ8mLBJ0uzTrxzD1z3j+N6qyNaPUWpG4
         OhIeoNye9OOponxZsoph9bc2laZCcfsdPPSP8=
In-Reply-To: <4DD7E3C9.3030103@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/21/2011 06:09 PM, dE wrote:
> I've been trying to loop mount reiser4 which resides on a file on an
> exported NFS partition, it mounts fine but when copying a lot of small
> files inside a complex directory tree everything just hangs all of a
> sudden, in fact the whole share hangs. Any operation on the share
> (including bash completion) will hang bash (or in that case any
> application) completely.
>
> Doing the same will work with any other FS. Parameters for reiser4 -

which kernel is on NFS server?

Thanks,
Edward.

>
> create=ccreg40,compress=gzip1,compressMode=force,fibration=lexic_fibre,formatting=tails
>
