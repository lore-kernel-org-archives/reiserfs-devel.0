From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Fwd: options in reiser4
Date: Sat, 10 Sep 2016 16:33:00 +0200
Message-ID: <57D4199C.5010307@gmail.com>
References: <CAMRsyOdqkwPq_UGRVR0DyNrptrHtJmR2R-1ifGS-p+V+=GoOFQ@mail.gmail.com> <CAMRsyOdr43GheHUEUzhqHfEO_iie=ZD1i+BzRTfUwQUxVzLvaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=1mGpfSMkDdmh7s35mF1sVvnrulUzA5Ncaz5KO2Edc5w=;
        b=oYYtzjScd1N1SKyzQOC/4paItOglJQpfUv/3LHHacNcVXzJilQJ+Tncw7Gk57iYW7O
         yfxrGsq9DKS9lwCTwDse1zHhrZgN7oDlrGmwb2e9dYHbjVuFm5RsYjXngWTTIMzpJqS2
         d3DGBzlJyaYSS9rWn4HT15IUPWuJpWYF/ys6SxlWjgdG5fc9c0stcC52WhIMrZyxYjYg
         JPvplr5liMDJIzLeg9GNhgkt+iYZSEGLCD4DwSepgdsxOBsUe+F9KCUPrJ0JeKPFdmxw
         vkB5P5BiWrtIg8AOVap38Wwencvhd5kfO1Q3kiBV7UhfH7vpcvx/eaCjvsiCGuPCzcjQ
         8ZUQ==
In-Reply-To: <CAMRsyOdr43GheHUEUzhqHfEO_iie=ZD1i+BzRTfUwQUxVzLvaQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mettavihari D <tv.lists@gmail.com>, Linux Reiserfs Devel <reiserfs-devel@vger.kernel.org>

Hello.

Badblocks are unsupported in Reiser4 (as well as resizing the volume).

Thanks,
Edward.

On 09/10/2016 03:38 PM, Mettavihari D wrote:
> Greetings,
>
> I have been using reiserfs for several years and I have been happy
> with the Filesystem
>
> One thing that has been very useful in the fs is
> Options:
>    -B | --badblocks file            store all bad blocks given in file on the fs
>
> I today installed reiser4 to see how the new reiser4 was, however I did not find
> Options:
>    -B | --badblocks file            store all bad blocks given in file on the fs
>
> This is what -h give me
> Usage: mkfs.reiser4 [ options ] FILE1 FILE2 ... [ size[K|M|G] ]
> Mkfs options:
>    -s, --lost-found              forces mkfs to create lost+found
>                                  directory.
>    -b, --block-size N            block size, 4096 by default, other
>                                  are not supported at the moment.
>    -U, --uuid UUID               universally unique identifier.
>    -L, --label LABEL             volume label lets to mount
>                                  filesystem by its label.
> Plugins options:
>    -p, --print-profile           prints the plugin profile.
>    -l, --print-plugins           prints all known plugins.
>    -o, --override TYPE=PLUGIN    overrides the default plugin of the type
>                                  "TYPE" by the plugin "PLUGIN" in the
>                                  profile.
> Common options:
>    -?, -h, --help                prints program usage.
>    -V, --version                 prints current version.
>    -y, --yes                     assumes an answer 'yes' to all questions.
>    -f, --force                   makes mkfs to use whole disk, not
>                                  block device or mounted partition.
> root@edu-SVE1713C5E:/root#
>
> Please let me know if this option is available or not in the new version.
>
> with metta
> Mettavihari
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

