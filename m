From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v10 3/4] evm: Align evm_inode_init_security() definition
 with LSM infrastructure
Date: Tue, 4 Apr 2023 14:56:17 -0400
Message-ID: <CAHC9VhSMdrPP6+9cmhAU1=tDikJ5Y8_mJEORdqiaJw3pQuFDDg@mail.gmail.com>
References: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com> <20230331123221.3273328-4-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bpf-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1680634588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuYMP9oERucJ/O/ah5M668zvZcUxIDKJFH+6ndYhYhw=;
        b=PQaRIIZkpGihz6wkjt6tSlzCY4838BGeVloFrkgUy+TiPjGJbg3Xju0fSOz0ugEkLa
         4M8JsBMaHjY8ojIZiBKrw25TFChUm/J4/9aimvN5zAF5yyzAJlL2UfxkMYrv/zAJW/nA
         jwyh8THBan3RpnhNHPD9gjX0xuKBf51UcePGUO7o0LaDMyF74f8YReyFbAXUUPkQpImX
         DC76fVSQD8bpquZb3y4h8S8ed1r8VitaUMVJbkb5wVqkWxpxh/fzAO9pT/D1XDoekIuz
         qjzS8hMqbNGhmWQaD035n8+tMbSOtDVlAbMYXFICMdWGmUL28QNylVAGMUDdcFBiprXN
         MQSA==
In-Reply-To: <20230331123221.3273328-4-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, Mar 31, 2023 at 8:33=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> Change the evm_inode_init_security() definition to align with the LSM
> infrastructure. Keep the existing behavior of including in the HMAC
> calculation only the first xattr provided by LSMs.
>
> Changing the evm_inode_init_security() definition requires passing the
> xattr array allocated by security_inode_init_security(), and the number o=
f
> xattrs filled by previously invoked LSMs.
>
> Use the newly introduced lsm_get_xattr_slot() to position EVM correctly i=
n
> the xattrs array, like a regular LSM, and to increment the number of fill=
ed
> slots. For now, the LSM infrastructure allocates enough xattrs slots to
> store the EVM xattr, without using the reservation mechanism.
>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  include/linux/evm.h               | 13 +++++++------
>  security/integrity/evm/evm_main.c | 16 ++++++++++------
>  security/security.c               |  6 +++---
>  3 files changed, 20 insertions(+), 15 deletions(-)

This seems reasonable to me, but I'll want to see a sign-off from Mimi
for the EVM bits.  Same thing for patch 4/4.

--=20
paul-moore.com
