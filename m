From: "Ronni Nielsen" <theronni@gmail.com>
Subject: Re: Timing result of removal of 8012 files in 2 directories
Date: Fri, 25 Jul 2008 21:15:37 +0200
Message-ID: <5e2ec5ac0807251215h22742a3bv21472b6643a3e518@mail.gmail.com>
References: <11010.202.168.22.19.1216992345.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Vh9dYM06pwv6TAfJY7mvoD5fUKb1J97Ek2HuK3AVXl0=;
        b=cv/sbsMtCyjK2tzdKy9n296bPf9vFlTetqz7mFVlPGnkOrr5qYrL+/+opzv3Kn0vtH
         Gt4RJUbVoBqO7xP0q0BNfptmTdZmrO24xrN4EjelcABVFR4Zp1YWKmBYTKRJ0wb2zNmF
         ByRC7TRlkZdFJ109ifzz6jkiuWbyiKSSh6MEE=
In-Reply-To: <11010.202.168.22.19.1216992345.squirrel@webmail.velocity.net.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

I just timed my toilet-visit:

Poop-time: 2 minutes
Wipe-time: 15 seconds
Total # of flushes: 2 (I had a floater)

Conclusion: Don't post random, non-comparative timings on unknown hardware!

Regards,
Ronni

On Fri, Jul 25, 2008 at 3:25 PM,  <doiggl@velocitynet.com.au> wrote:
> Timing result of removal of 8012 files in 2 directories:
>
> Removal of files test:
>
> Count 8012 files in 2 directories.
>
> Size:
> # du -m /reiser4/old.rpms/
> 22      /reiser4/old.rpms/.repodata
> 11350   /reiser4/old.rpms/
>
> # time rm -rf /reiser4/old.rpms
>
> real    0m7.084s
> user    0m0.004s
> sys     0m3.192s
>
> Glenn
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
Venlig hilsen
Ronni
