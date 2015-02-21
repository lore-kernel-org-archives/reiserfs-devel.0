From: Vladimir Shebordaev <vladimir.shebordaev@gmail.com>
Subject: Re: Bundling patches together.
Date: Sat, 21 Feb 2015 10:27:24 +0300
Message-ID: <1424503644.27942.14.camel@home.ted.local>
References: <a93e264428ba5eaa329137f88ff880c6@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:mime-version:content-transfer-encoding;
        bh=waisrNZU2FkCPrSRr1/esYhkEx0zJqEmz5axkWFw284=;
        b=HMSCYd6Kn/AKWaZm7nlta/2BBJ3T7aRDN3qAE12LouvG58lnngcBYyMBp/PSpcZ42Q
         7tsGMgWkgBIuqFGavZ9yp3rg0Xa1TgpillBg5ZplLKkyEJ6UzqwrYPFxFo/AOaRV9Yj3
         Ll10yEH59ocPlyScoloVMhNla97QVKNW2ciN+67zE/lL/Yo38l+x3T7aOKKjc/X/0u2C
         4txT/aJMEFoa/sQuEMVZ7NuuWJFC5mEdDcblHutxiRbgjic/A6XQWYugV5wmI8tqP6Wk
         OC7J1+j69bhsC6yjoxF5xbPZTzSt+GTzMs+zelMKe0CuzdbiggVHrbwPkkh4HKVFoKQp
         yXdg==
In-Reply-To: <a93e264428ba5eaa329137f88ff880c6@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org, Ivan Shapovalov <intelfx100@gmail.com>

Well, the task to make RPM apply as many patches as you want is almost
trivial. 

I'm not quite sure about OpenSUSE spec files, but as to RedHat/Fedora
ones you have to

1) enumerate the patches using Patch[0-99999] declarations, 
2) apply patches in sequence using corresponding 
%patch[0-99999] directive in %prep section.

Please notice it is completely up to you to maintain proper patch
numbering and application sequence. I am not quite sure about maximal
patch number that RPM accepts, but at least 5-digit values are usually
fine.

Adding tens lines of text to spec file is evidently less complicated
task than merging hundreds lines of working kernel code. The last one is
not also that complicated but is rather useless, dull and error-prone
procedure. 

Once you correctly add those 20 lines to your spec file, you will be
able to build the package as many times as you want with no risk to miss
a part of the patch at all.

In the hope it helps.

--
Regards,
Vladimir

On Sat, 2015-02-21 at 16:59 +1100, doiggl@velocitynet.com.au wrote:
> Hello Ivan,
> Can you provide a single patch for [1] when it accepted into Reiser4.
> 
> [1]
> [PATCHv5 00/10] reiser4: batch discard support (FITRIM ioctl): initial
> implementation
> 
> Reaon for asking:
> Easier to apply one patch rather than ten and minimises risk of missing a
> part of the patch.
> 
> --Thanks Glenn
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


