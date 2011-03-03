From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Re8: Question about reiser performance - linux-2.6.37 crash reproduced
Date: Fri, 04 Mar 2011 00:29:08 +0100
Message-ID: <4D702444.6000806@gmail.com>
References: <4D65A3F7.22052.1288FE@jafojtik.seznam.cz>, <4D700778.5161.11EDF7@jafojtik.seznam.cz>, <4D701197.7030903@gmail.com> <4D702329.27637.A07FE@jafojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=H/msaNLIwBnP3G2Zz5hTmI+Utj65x27MWWaa1GWXizw=;
        b=cBXVM5omE+sutqfANccR4zF2etiCMB1eIZA53iTXyN8/s3XbtKPXDh3WTS2P23/gYk
         JzjGo5P8j0ey4yuI3Z5N4uJQSx64fJGjDNqqd3PH0cEvueuIa0LBrfFNIGeZxHrWcEq8
         Y8FRkRpzu6fuWuXD+6FSJ9Gd/Cs43gYz3FhXs=
In-Reply-To: <4D702329.27637.A07FE@jafojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaroslav Fojtik <jafojtik@seznam.cz>
Cc: reiserfs-devel@vger.kernel.org

On 03/04/2011 12:24 AM, Jaroslav Fojtik wrote:
> Dear Edward Shishkin,
>
>> Great.
>
> Sorry, after several attempts I managed to crash Linux even with kernel
> linux-2.6.37. No trace in log, system completely frozen and beeper
> sounded.
>
> It takes several hours to transfer 400 Gigabyte test data and create
> full stress of filesystem.
>
> I have improved my stress test and managed to find something with mc
> paralelly with data copying.


Ok, I'll try to reproduce.
Is you "/" on reiser4 partition?

Thanks,
Edward.
