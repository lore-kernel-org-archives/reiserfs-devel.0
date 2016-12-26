From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] Sane defaults for tmgr.atom_max_size
Date: Mon, 26 Dec 2016 18:21:24 +0200
Message-ID: <58614384.8020507@gmail.com>
References: <CADW=+3=QyRKxCGmDjBnLNKF=NQTTq1XbM2DrNUAd7qYeN5N=Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=APDKMFEjIhqj4ikQC5vwPNXwgH8AjcPyRcx31MI5vVw=;
        b=u00O43KXEgWJfqtygPSnUXgek7fgHik9n01oPou2RbxP0NUGBh4H+ecQvo0EHmpvHc
         RaW7e/JWRAVpJWtlP7KtbI49lgyf6v/W9E9Tin+KmRnfVtI1vh09+8G+6mdvSK5pO9yn
         RZMd+toExv/JuJpVxtIUWF6EC230wr2AMbYTK46bVXAy891RRagHUbXvqVrPy9wvi0RJ
         Nz4Kuap+cTIUS3m8EIE9pfdyOKFaq1+7wYZe2R39NI7cSTRmgVyohG/eHMK9J1yjCCu+
         NZs9OsplA2+1DNso4SOYJ0Sh9nxNqbyCR+nfgqShph3kTkmVluVcPUJkQQvYmkL9gl8V
         ix5g==
In-Reply-To: <CADW=+3=QyRKxCGmDjBnLNKF=NQTTq1XbM2DrNUAd7qYeN5N=Rg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi Dushan,

I think it won't affect the responsiveness.
That mount option is for txnmgrd daemon, which just wakes up
once in (10 minutes?) and checks if transactions are too large or
too old.

Actually, this is the process spawning a transaction (->write(),
->truncate(), etc) who is responsible for active suppression of
that transaction. If someone spawns a 4G transaction, then it is
incorrect, so feel free to make _him_ check the transaction size
in accordance with your thoughts about RAM/disk sizes in modern
machines.

Thanks,
Edward.

On 12/24/2016 08:19 PM, Dušan Čolić wrote:
> Currently tmgr.atom_max_size defaults to 1/4 of RAM.
> Historically RAM size increased faster than disk write speeds  so
> machines today usually ship with 4-16GB of RAM that means that we can
> get to situation where we have to flush 1-4GB of data and while doing
> so system would be unresponsive for minutes for apps that wait on
> sync.
>
> If we presume an optimistic scenario of 100MB/s write speed and 10sec
> wait time for 16GB RAM we come to the 1/16 ratio.
>
> Your thoughts?
>
> Dushan
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

