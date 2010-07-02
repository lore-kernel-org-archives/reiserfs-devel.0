From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: reiserfs locking (v2)
Date: Fri, 2 Jul 2010 17:03:53 +0300
Message-ID: <20100702140353.GA3981@swordfish.minsk.epam.com>
References: <20100702093451.GA3973@swordfish.minsk.epam.com>
 <20100702131248.GA5324@nowhere>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :message-id:references:mime-version:content-type:content-disposition
         :in-reply-to:user-agent;
        bh=IHu8zpjYHZrcnoVCxvbg8gOI5q7HllJnjU8sPyjH9ZU=;
        b=e8r41FtJ5fCn6BGKbR0g9poaD9gYyhqrGVbi5MVWt3CDkmK6pDZYqRwbMARkqRV5Jw
         UVz5iiBvqNrYrymDV5KQSUH64SpOYiy/MThfb9KZcwOa7iYfGtHY1RMb+e8w2M0U+OXq
         Ap1TTy1OwEn6EMjD7tIx3TeHro0Gct0Otlfgw=
Content-Disposition: inline
In-Reply-To: <20100702131248.GA5324@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Mason <chris.mason@oracle.com>, Jeff Mahoney <jeffm@jeffreymahoney.com>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On (07/02/10 15:12), Frederic Weisbecker wrote:
> > As well as this:
> >=20
> > [  202.300464] REISERFS error (device sda9): vs-2100 add_save_link:
> > search_by_key ([-1 7812832 0x1 IND]) returned 1
> > [  202.300473] REISERFS (device sda9): Remounting filesystem read-only
> > [  202.301603] ------------[ cut here ]------------
> > [  202.301615] WARNING: at fs/reiserfs/journal.c:3436
> > journal_end+0x5b/0xaf()
> > [  202.301619] Hardware name: F3JC               =20
> > [  202.301622] Modules linked in: snd_seq_dummy snd_seq_oss
> > snd_seq_midi_event snd_seq snd_seq_device snd_hda_codec_si3054
> > snd_hda_codec_realtek snd_hwdep snd_pcm_oss snd_mixer_oss asus_laptop
> > sparse_keymap sdhci_pci sdhci snd_hda_intel mmc_core led_class snd_hda_=
codec
> > rng_core snd_pcm snd_timer snd_page_alloc snd i2c_i801 soundcore psmous=
e sg
> > evdev serio_raw r8169 mii usbhid hid uhci_hcd ehci_hcd sr_mod usbcore c=
drom
> > sd_mod ata_piix
> > [  202.301689] Pid: 5055, comm: a.out Not tainted
> > 2.6.35-rc3-dbg-git6-00502-g94feaba-dirty #65
> > [  202.301693] Call Trace:
> > [  202.301701]  [<c102e3a2>] warn_slowpath_common+0x65/0x7a
> > [  202.301707]  [<c1102d95>] ? journal_end+0x5b/0xaf
> > [  202.301712]  [<c102e3c6>] warn_slowpath_null+0xf/0x13
> > [  202.301718]  [<c1102d95>] journal_end+0x5b/0xaf
> > [  202.301725]  [<c10eebaa>] reiserfs_truncate_file+0x19f/0x233
> > [  202.301733]  [<c10f1ba1>] reiserfs_vfs_truncate_file+0xd/0xf
> > [  202.301738]  [<c1084883>] vmtruncate+0x23/0x29
> > [  202.301745]  [<c10b4ad4>] inode_setattr+0x47/0x68
> > [  202.301751]  [<c10f1b3f>] reiserfs_setattr+0x242/0x297
> > [  202.301758]  [<c12c5d05>] ? down_write+0x22/0x2a
> > [  202.301764]  [<c10b4d6f>] notify_change+0x15c/0x26b
> > [  202.301770]  [<c10a35c7>] do_truncate+0x64/0x7d
> > [  202.301776]  [<c12c69b0>] ? _raw_spin_unlock+0x33/0x3f
> > [  202.301783]  [<c10ad892>] do_last+0x450/0x459
> > [  202.301789]  [<c10ada5b>] do_filp_open+0x1c0/0x41a
> > [  202.301798]  [<c1029081>] ? get_parent_ip+0xb/0x31
> > [  202.301804]  [<c1029123>] ? sub_preempt_count+0x7c/0x89
> > [  202.301810]  [<c10b5746>] ? alloc_fd+0xb4/0xbf
> > [  202.301816]  [<c10a3f46>] do_sys_open+0x48/0xdf
> > [  202.301821]  [<c10a3ffb>] sys_open+0x1e/0x26
> > [  202.301827]  [<c10027d3>] sysenter_do_call+0x12/0x32
> > [  202.301833] ---[ end trace c4e3312bdadd2dc5 ]---
>=20
>=20
>=20
> Ah that's wicked. I'll try your testcase for that too.
>=20
> Thanks a lot for providing these!
>=20

I'm not very lucky at hitting this. Saw it several times (may be 3).


	Sergey

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iJwEAQECAAYFAkwt8ckACgkQfKHnntdSXjSAyAP/eiMA2fSJhLWI2qSE9shrCFZ/
AJJ/jvl0TmfiuDYC4tmjQ27Mxwxf1em+6Rg012Y4DHXwXl2os3azCEq7UkNs+m0w
bEoSOxa30wZYqEHiPfj+dZUSvOWK8G9AeRr7nJkuY3Hopv/hU5IxJ9PTF095P8sJ
xTxlNXtrBEujq5Dkgt8=
=uOq4
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
