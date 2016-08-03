From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Debian 4.6.3-1+reiser4 -patched kernel for Jessie at Bintray
Date: Wed, 3 Aug 2016 04:50:57 -0700
Message-ID: <CAM12Q5RpAof4Tzist=XOiAcDjXKM9aiihxMvwen+hCq=pErvww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <bounce-debian-kernel=glddk-debian-kernel=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:from:date:message-id:subject:to:cc;
        bh=DU9J4yhELa4R15zNoawWWWFy/1lYF5NRGqXp3DT/7EI=;
        b=ql5oL91y5bByxuBn+rLwhl2XpL0qq6EJPBtkEUX/9kvb0R+kDahe5/N4WmKCv1U+Ur
         4YTIrCDabkeg3ocBpDqE2SS/20rngDk19MQCS/qEKJmr66N54ZAm9EBiDwH5ziqP8vWp
         mvsj+a5CD61zwQOXx3jDXspTphaNCCaz1EsBJpNR86EUyqV5WWepHDSyBDBZOAZ5S+hS
         ULAqoqyW5nviaBshA579TIebC6jslR9widz23UFft6VIPSMrnTiVUKcfbQIuQ9RBoIm7
         nNOg4IinV/60j1ns4NdbjZje3bh+G4epiJ0uLtHp9/AjEQngjMsmn6AlHzcCaBRND1zu
         5aTQ==
Sender: jose.r.r@metztli.com
Resent-Message-ID: <IBHKDNQY0NJ.A.OjC.2qdoXB@bendel>
List-Id: <reiserfs-devel.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-kernel/>
List-Post: <mailto:debian-kernel@lists.debian.org>
List-Help: <mailto:debian-kernel-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-kernel-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-kernel-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAM12Q5RpAof4Tzist=XOiAcDjXKM9aiihxMvwen+hCq=pErvww@mail.gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: debian-kernel@lists.debian.org

Niltze, all!

Couple of days ago I uploaded kernel 4.6.3-1+reiser4 (SFRN 4.0.1) for
Jessie on AMD64, Debian packages to a Bintray repository.
Additionally, reiser4progs 1.1.0-1 for Jessie on AMD64, Debian package
was uploaded as well.

https://bintray.com/metztli/reiser4/linux-image-4.6.0-1_reiser4.0.1-amd64

https://bintray.com/metztli/reiser4/reiser4progs_for_Jessie

Please make sure to read the kernel Release file for important instructions.

Or automate procedure outlined in Release file above by installing
Debian Jessie natively onto Reiser4 (SFRN 4.0.1) via netboot ISO at
SourceForge:

https://sf.net/projects/debian-reiser4/

Unless anyone knows of a reason not to upload the generated kernel
package files to Bintray (first time I do), I may subsequently upload
Reiser4 (SFRN 4.0.1)-patched kernels 4.5 and 4.6.4.x for Jessie on
AMD64.


Best Professional Regards.
