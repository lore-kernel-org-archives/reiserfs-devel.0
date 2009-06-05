From: "Trenton D. Adams" <trenton.d.adams@gmail.com>
Subject: Re: [PATCH 1/2] kill-the-bkl/reiserfs: acquire the inode mutex safely
Date: Fri, 5 Jun 2009 13:57:32 -0600
Message-ID: <9b1675090906051257t5aad47capccfcf1c94f863a66@mail.gmail.com>
References: <1242496922-6330-1-git-send-email-fweisbec@gmail.com>
	 <1242496922-6330-2-git-send-email-fweisbec@gmail.com>
	 <9b1675090905292005p2b53de7dy9e36f84368d76f01@mail.gmail.com>
	 <4A296343.4050005@suse.com>
	 <9b1675090906051206we136e88k6a14194963726709@mail.gmail.com>
	 <4A29723C.2030102@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=IzB+SCcJdm0uDz+gemVEIDbzdDF873HVV5gb71VDvQ8=;
        b=ChAx/3/wosbRK/L2Vl7owbdDvJqrHZcZ3lViHfDuHGgGwyUEx7qG/iBq3WQsOBUnz7
         4ikqTto+SOTw/TpHqPkwvAfOT8TuL2o6qzZT+Wxegxf4Gzb59OLGCUyNBErdajJbTBsZ
         GGGjWRDvOU/gACvMJP/6Rou5chGVPG8ypjv3c=
In-Reply-To: <4A29723C.2030102@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>

I'll see if I can try that this weekend.

Thanks.

On Fri, Jun 5, 2009 at 1:30 PM, Jeff Mahoney<jeffm@suse.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Trenton D. Adams wrote:
>> FYI: I never did anything specific that I knew of, so I didn't
>> actually notice a delay. =A0I was rsyncing to a USB key at the time.
>> And seeing it took over an hour, I walked away, so I wouldn't have
>> noticed it. =A0But, I could fiddle around a little to see if I could=
 get
>> some sort of delay going on. =A0Any ideas on what I should try? =A0T=
hen I
>> can do the sysreq+t for you if I can reproduce.
>
> Well if the rsync triggered it, that's a good start.
>
> Try applying the following patch as well. It will cause the hung task=
 detector
> to do a sysrq+t automatically so it's not as much of a guessing game.=
 You'll need to boot with
> hung_task_show_state=3D1.
>
> - -Jeff
>
> - ---
> =A0kernel/hung_task.c | =A0 11 +++++++++++
> =A01 file changed, 11 insertions(+)
>
> - --- a/kernel/hung_task.c
> +++ b/kernel/hung_task.c
> @@ -56,6 +56,14 @@ static int __init hung_task_panic_setup(
> =A0}
> =A0__setup("hung_task_panic=3D", hung_task_panic_setup);
>
> +unsigned int __read_mostly sysctl_hung_task_show_state;
> +static int __init hung_task_show_state_setup(char *str)
> +{
> + =A0 =A0 =A0 sysctl_hung_task_show_state =3D simple_strtoul(str, NUL=
L, 0);
> + =A0 =A0 =A0 return 1;
> +}
> +__setup("hung_task_show_state=3D", hung_task_show_state_setup);
> +
> =A0static int
> =A0hung_task_panic(struct notifier_block *this, unsigned long event, =
void *ptr)
> =A0{
> @@ -102,6 +110,9 @@ static void check_hung_task(struct task_
>
> =A0 =A0 =A0 =A0touch_nmi_watchdog();
>
> + =A0 =A0 =A0 if (sysctl_hung_task_show_state)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 show_state();
> +
> =A0 =A0 =A0 =A0if (sysctl_hung_task_panic)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0panic("hung_task: blocked tasks");
> =A0}
>
> - --
> Jeff Mahoney
> SUSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.9 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
>
> iEYEARECAAYFAkopcjwACgkQLPWxlyuTD7IEdgCfVVzIL/DA0stfnYEW6aixFwxM
> qIEAnjJjyn6HQAbVIicRYzvNcGvPwbiq
> =3Dz8Pn
> -----END PGP SIGNATURE-----
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
