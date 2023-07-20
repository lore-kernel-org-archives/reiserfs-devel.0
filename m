From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: change reiserfs status to obsolete
Date: Thu, 20 Jul 2023 13:57:18 +0200
Message-ID: <CAKXUXMzL4i0jT0xPFsV4ZG6L82yDCYLtKoUL7t=21ZDZ4OMY7w@mail.gmail.com>
References: <20230720115445.15583-1-piotr.siminski@globallogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689854247; x=1690459047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEIUFqZ8/Bo/7OzswG7WehHeVU6nxJVjchlFmBJN/gc=;
        b=sab3O3jQd+CYRloP7X1t93c1kiFsTEZMeKDriFob1uWehLbaMPJ+g2pWNgohwFwh0x
         oAJ8KmaC+OUVyt2n9kzP+MW98HQAlGrq08ZbSx4L89P3tvD7Bzq5WGS2vhJZxfJ9zdpg
         6aiiUlRvxYhbTm5ZkeInx8OAFeuKXreaWRLT+j1RbWse+ynByELtOsPyalFMu4boPT8O
         fCzDsc/IkW9VlU9WT5J25rF22j8kpjBGdnLHm3R95HKg/7jofdJGa/XPqGJUlhRzAvd9
         EEtwfheOkWWWut6YTMfP3gIpgdMfUCywCGSW700nbP0hfM8hW87xRzq4D6xtc/SpFPx+
         QrgA==
In-Reply-To: <20230720115445.15583-1-piotr.siminski@globallogic.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Piotr Siminski <piotr.siminski@globallogic.com>, Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org

Piotr, thanks for the clean up in the MAINTAINERS file.

Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Jan, could you pick this patch?

Lukas


On Thu, Jul 20, 2023 at 1:54=E2=80=AFPM Piotr Siminski
<piotr.siminski@globallogic.com> wrote:
>
> Reiserfs file system is no longer supported and is going to be removed
> in 2025 as stated in commit eb103a51640e ("reiserfs: Deprecate reiserfs")=
.
>
> Signed-off-by: Piotr Siminski <piotr.siminski@globallogic.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5c16bb92fe2..c340c6fc7923 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18064,7 +18064,7 @@ F:      include/linux/regmap.h
>
>  REISERFS FILE SYSTEM
>  L:     reiserfs-devel@vger.kernel.org
> -S:     Supported
> +S:     Obsolete
>  F:     fs/reiserfs/
>
>  REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
> --
> 2.34.1
>
