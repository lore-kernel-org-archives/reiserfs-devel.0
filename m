From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
Date: Wed, 26 Aug 2020 23:13:46 +0200
Message-ID: <4069a2ae-8b9c-9d9e-5b22-1b0984b0eba3@gmail.com>
References: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=XTi6fOUfRKcZjiiZjjXLNZRSEdh0rD+km7AF/L9eAoY=;
        b=JyJuVdzP36MrB9B8XqekEBFiFDnn6JvhSi6/bFWc/ezu0QCcOvm4KSOHVpM1X3AqvG
         jwTAv0GtVteyzZ14vI4HCLBnh7d9Wz2a96lLbEjsc+tLU3CCnkBMGl3yr1hQYt7dNl1D
         xJlKdFoWXmLPakXrWCwdy2YzUVAMU9Jd9uzQyU16N++Fjih1f0rV3llIMbsf1jPWFLPC
         ksa8ePm+bOedPIsI56kFOlIoPtg/wkoOJiN22hc6xGUqZUBtsc0XmmT07B93Kb3JPQfG
         eXv0jRUnJQVrLUAlYNm15pkxGyXM3dJau/9Josf+15Hgr9Ec921u2Nk2CciUx+k9v+b/
         j/5Q==
In-Reply-To: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

[...]

> 
> FYI Although not officially, the Debian metaframework Buster AMD64 distribution might be the first to support native installation of Reiser4 SFRN 5.1.3, kernel and reiser4progs 2.0.3, file system utilities.
> 
> I have already made a couple of successful Metztli Reiser4 SFRN 5 native installations onto ~100 GB slices, which root file system is formatted in 'Reiser5' and 1 GB /boot in JFS.
> https://metztli.it/reiser5 (Screenshot 600x338 size)
> 
> The upgraded netboot installation media metztli-reiser4-sfrn5.iso is available at:
> https://sourceforge.net/projects/debian-reiser4/
> as well as
> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso
> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM
> 
> Likely the brick/volume feature(s) will be useful in Cloud fabric infrastructures, like Google's, where reiser4 excels.
> 
> The current SFRN 5.1.3 -patched Zstd -compressed kernel in the installation media is Debian's 5.7.10.


wow, reiser5 from the box? I might want to try..

> 
> The installer defaults to create the root system reiser5 -formatted partition as:
> mkfs.reiser4 -yo "create=reg42"


"reg42" is default profile in reiser4progs-2.0.3 (check by
"mkfs.reiser4 -p") - there is no need to specify it via option.

Have you had a chance to play with logical volumes (add/remove
bricks, etc)?

Thanks!
Edward.
