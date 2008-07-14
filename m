From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: 1 big file copy and removal timing.
Date: Mon, 14 Jul 2008 16:59:11 +0200
Message-ID: <a08621850807140759s55144d7dhdd826f739f84036a@mail.gmail.com>
References: <13998.202.168.22.19.1216046445.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=S38gYyg6J8JmzTDd+7A5t0ObJ57r/VxiQmmyG0fMziI=;
        b=K3LV96ZvuSgHWdexNXoe0yQUdVWvwqNEhdqy2D+6OE2l09IQUzY0lJUGSUuf8h43TD
         lHuAmKbTuEm3APrGFwM1iQ3nLM9qILmODjgals7YPGVHYXS/vTw6/1FAoBsUQeyADWxg
         H5045Vgpnj3Y9F77lZWUh3gCQBd50PyqCE2aM=
In-Reply-To: <13998.202.168.22.19.1216046445.squirrel@webmail.velocity.net.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

For a 4.1 GB .iso file I get:
 time rm /tmp/rzr-fsxf.iso

real	3m33.182s
user	0m0.000s
sys	1m9.083s

rm is constantly on 30% CPU. It's a Core2Duo 6400 so I think it's a bit high.
when I cp that same file from ext3 to r4 I get pdflush at 50%CPU

On Mon, Jul 14, 2008 at 4:40 PM,  <doiggl@velocitynet.com.au> wrote:
> Hello,
> Here is my timing on copying and removing 1 big file on a reiser4
> partition. The Reiser4 partition is a separate Sata type disk.
>
> Observation: The removal took some time. I was surprised about the time
> taken to remove the file.
> Glenn
>
> # time cp /tmp/openSUSE-11.0-DVD-x86_64.iso .
>
> real    1m37.936s
> user    0m0.048s
> sys     0m13.969s
>
> # ll openSUSE-11.0-DVD-x86_64.iso
> -rw-r--r-- 1 root root 4651712512 Jun 19 23:04
>
> # time rm openSUSE-11.0-DVD-x86_64.iso
>
> real    4m24.826s
> user    0m0.000s
> sys     0m46.571s
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
