From: Gleb Baryshev <gleb.baryshev@gmail.com>
Subject: Re: reiser4 WARNING: discard atom failed (-95)
Date: Mon, 21 Sep 2015 08:48:56 +0200
Message-ID: <55FFA858.10108@gmail.com>
References: <55FC21EF.6000804@gmail.com> <55FC2AA2.5040707@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=3k3rcZ5+fz+m55NTn29c2/BtAPIibwUK9poTPZHLWTE=;
        b=zpkAx9uxCFRK3qNt5vvqgc4vssMP8XgaZiYm7/T0jnh4sP31Rt4lFlWAGjyOmG80mG
         ncuXAl/elX23QL+67dv08lm0rzm4FOr4ZQXKGLIy0E4pGnmwUq9e6GxRlMJlwvFn5N5T
         xWOhQEGD6Xz3weawGuMWbRs43XQ6vUDgBSeQtKlMMp8PkGNKzVE4MiuDoCE/J6prAd/+
         vdxyfW9ShP586wN71jxNf1QJ6hWW0CJxFkBnfdk2oh5E/AxQiV7c1jcxzQvvZaHrz+zO
         HT9PLpkzsyMh7zeyi9/wkpZY5Z0mygkC5IfP1tPaiVFvCM0a6m2waAic0Ol9cY0PISgk
         XBYw==
In-Reply-To: <55FC2AA2.5040707@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 18.09.2015 17:15, Edward Shishkin wrote:
> Hi Gleb,
>
> It means that your sdb1 doesn't support TRIM command.
> sdb1 is virtual device, correct?
>
> Edward.
>

Ok, thanks for clarification. Yes, it is VirtualBox VDI disk image.

It turned out that VirtualBox GUI only allows to switch "--nonrotational 
on", so after issuing "VBoxManage --discard on" in addition I got rid of 
this warning.

Best regards,
Gleb
