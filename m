From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 patch for 5.5.1 and fs/fs-writeback.c
Date: Sat, 22 Feb 2020 22:57:43 +0100
Message-ID: <fb777d18-bcb6-9bd1-0b30-8e12b5643c21@gmail.com>
References: <20200222193446.C495950BFAD7@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=fZIy+UG2ubKTI2ASXiVYeZiUBFSAAEqvhf/Qo/9NhdA=;
        b=OEu0acpjbdtPY+l47C9KRBJhukiCiA10qvLYCEXD64k6QEwZTWJEdL9Ck+H1tUKt6G
         qMekTwfLH9m0AfPmQhUo0tbUxQeWodU2WaAf8yTYI6ki+gkl49CsOvl39J+jjdea9XIF
         xOqArYRJ0mj4+HWwcmyL9fvyHxGCLbDKld+MnXI0GdrzefmgHHIDu+PO1V0L1WrbKddo
         RN/J0ICtoVhiyKmLHO6ENcPytGlGz4kvE0hKxd/NtUvlTy2r9TZgIlW41ohvclkekbQV
         5AzZljKghlqgjLFZZfng6vzoCgBVyApTIvXya/qnCbrPdoscMkruvKMr9SjkVMOUACCw
         5u8Q==
In-Reply-To: <20200222193446.C495950BFAD7@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org



On 02/22/2020 08:34 PM, Metztli Information Technology wrote:
> On Sat, Feb 22, 2020 at 3:56 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> On 02/22/2020 05:51 AM, Metztli Information Technology wrote:
>>> Niltze, Ed-
>>>
>>> Starting with kernel 5.4.19, linux/fs/fs-writeback.c , at line 2066, changes
>>> from
>>> set_worker_desc("flush-%s", dev_name(wb->bdi->dev));
>>>
>>> to
>>> set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));
>>>
>>> I realized that when I was hacking 5.4.19 and, subsequently, my currently running kernel --as there was no RC3:
>>>
>>> uname -a
>>> Linux huitzilopochtli 5.4.0-4+reiser4.0.2-amd64 #1 SMP Debian 5.4.20-1+reiser4.0.2 (2020-02-14) x86_64 GNU/Linux
>>>
>>> < https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-SFRN-4.0.2_Linux-5.4.20-1-RC2_for-Debian_Buster/ >
>>>
>>>
>>> I have just built 5.5.5-1 and realized, upon applying reiser4-for-5.5.1.patch.gz, that your patch should be modified
>>> Â  accordingly; else, the patch will fail and will necessitate manual intervention, i.e., similar to 5.4.18 vs 5.4.19:
>>>
>>> < https://metztli.it/readOnlyEphemeral/fs-writeback_c.png >
>> so, everything works fine after that "manual intervention"?
> Indeed, Ed. No issues thus far. I upgraded my local dev environment to 5.4.20-1+reiser4 on February 15, 2020; in such environment I have built several PHP-7.3 iterations and I also built kernel 5.5.5-1+reiser4 yesterday. Additionally, replaced 5.4.20-1+reiser4 cloud flavour in a Google Compute Engine (GCE) customized Zstd transparent compression instance -- which hosts multiple PHP and Ruby applications and functions as a media / web server, as well -- without issues thus far.

All the problems comes from upstream. Specifically from VFS and the 
block layer. Not from Debian.
I'll try to prepare instructions on how to find problematic commit by 
bisecting.
The bad news is that the changes coming from there are clearly destructive.
Consider, for example, this "optimization":
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa65c29ce1b6e1990cd2c7d8004bbea7ff3aff38

What an idiot one need to be in order to lock up a lot of pages at once 
at the VFS level? :((( Sigh..
