From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Question about reiser performance - short system freezes
Date: Thu, 24 Feb 2011 13:07:42 +0100
Message-ID: <4D664A0E.8020900@gmail.com>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=QwM01eT9kfXYABKfvxfso/54twfuRZ7ibWODYajE3wo=;
        b=Hn+lwSiAoKNxTJ5L5IWlPAjZdnbRgGb52HNa9jptALThX7XXs0ra3s/uy1MBLJpmzB
         Sr+9ZvCJrPbSJXXkxplx4a7G/bN8PRPJ0I5wX3JIbOnumXmQuDEdnKLk6k+lDo66AVE8
         oUKzJszfc/UOqzA6s0XEecporvEXf+WUsBzQk=
In-Reply-To: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaroslav Fojtik <jafojtik@seznam.cz>
Cc: Edward Shishkin <edward@redhat.com>, reiserfs-devel@vger.kernel.org

On 02/24/2011 01:19 AM, Jaroslav Fojtik wrote:
> Dear Edward Shishkin,
>
> May be that my comment might be userfull for your reiser development:
>
> I am facing following performance issue. The reiser works without data loss,
> but system sometimes hangs for 15s, mouse cursor is frozen and after this
> period it continues to work without any problem. It is strange, because I have 6 cores
> and all of them seems to be locked and waiting for something.
>
> Hanging occurs during intensive file search like find, or first phase
> of rsync.
>
> It seems to me that both reiser3 and reiser4 suffer by this issue.
> I have found BKL inside reiser3, but reiser4 seems to be without BKL.
>
> It is also strange that OS resides on different partition that should not
> be affected by reiser locking.
>
> May be that it could be problem large say 600GB HDD partition. But these partitins
> are normal nowadays.
>
> Is there any idea how to overcome this issue?
>

Which kernel version?

Edward.
