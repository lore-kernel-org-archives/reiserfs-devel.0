From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH 1/1] - Fix reiserfs WARNING in dquot_writeback_dquots
Date: Thu, 22 Jun 2017 14:54:29 -0400
Message-ID: <0253cdca-dfc9-735d-0d41-5eade491ff96@suse.com>
References: <CALxoUzv8NooVZmuZgXr1TiXrYqRx1TQ9GeOejJ2KvkNuiuPrUg@mail.gmail.com>
 <CALxoUzvc39mJnZvER6SE=4ZjZVBb9w1+w+VrOe5ssuZgHpvt2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="X4RxWcHxXCcFBUm32r9M1xs4CKT5aLfhS"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALxoUzvc39mJnZvER6SE=4ZjZVBb9w1+w+VrOe5ssuZgHpvt2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Tim Savannah <kata198@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X4RxWcHxXCcFBUm32r9M1xs4CKT5aLfhS
Content-Type: multipart/mixed; boundary="H8303mvvQqjSaeR1EgrLqRwAUJbHkBSDm";
 protected-headers="v1"
From: Jeff Mahoney <jeffm@suse.com>
To: Tim Savannah <kata198@gmail.com>, reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <0253cdca-dfc9-735d-0d41-5eade491ff96@suse.com>
Subject: Re: [PATCH 1/1] - Fix reiserfs WARNING in dquot_writeback_dquots
References: <CALxoUzv8NooVZmuZgXr1TiXrYqRx1TQ9GeOejJ2KvkNuiuPrUg@mail.gmail.com>
 <CALxoUzvc39mJnZvER6SE=4ZjZVBb9w1+w+VrOe5ssuZgHpvt2w@mail.gmail.com>
In-Reply-To: <CALxoUzvc39mJnZvER6SE=4ZjZVBb9w1+w+VrOe5ssuZgHpvt2w@mail.gmail.com>

--H8303mvvQqjSaeR1EgrLqRwAUJbHkBSDm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/14/17 11:27 PM, Tim Savannah wrote:
> Any comments? Can we get this merged, or some variation? It affects a
> lot more than just all my machines. Google shows this traceback is
> occurring for others as well.

Hi Tim -

This patch was merged for 4.12:

commit 1e0e653f1136a413a9969e5d0d548ee6499b9763
Author: Jan Kara <jack@suse.cz>
Date:   Wed Apr 5 14:17:30 2017 +0200

    reiserfs: Protect dquot_writeback_dquots() by s_umount semaphore

    dquot_writeback_dquots() expects s_umount semaphore to be held to
    protect it from other concurrent quota operations. reiserfs_sync_fs()=

    can call dquot_writeback_dquots() without holding s_umount semaphore
    when called from flush_old_commits().

    Fix the problem by grabbing s_umount in flush_old_commits(). However =
we
    have to be careful and use only trylock since reiserfs_cancel_old_syn=
c()
    can be waiting for flush_old_commits() to complete while holding
    s_umount semaphore. Possible postponing of sync work is not a big dea=
l
    though as that is only an opportunistic flush.

    Fixes: 9d1ccbe70e0b14545caad12dc73adb3605447df0
    Reported-by: Jan Beulich <jbeulich@suse.com>
    Signed-off-by: Jan Kara <jack@suse.cz>

Your patch was not correct.  I'll provide review below if you're interest=
ed in the details.

> On Mon, May 29, 2017 at 12:57 AM, Tim Savannah <kata198@gmail.com> wrot=
e:
>> Oops, sent last one without patch on accident. Attached this time.
>>
>>
>> This has been happening for me since 4.10
>>
>> dquot_writeback_dquots expects a lock to be held on super_block->s_umo=
unt ,
>>
>> and reiserfs_sync_fs, which calls dquot_writeback_dquots, does not
>> obtain such a lock.
>>
>> Thus, the following warning is generated:
>>
>> [Sun May 28 04:58:06 2017] ------------[ cut here ]------------
>> [Sun May 28 04:58:06 2017] WARNING: CPU: 0 PID: 31 at
>> fs/quota/dquot.c:620 dquot_writeback_dquots+0x248/0x250
>> [Sun May 28 04:58:06 2017] Modules linked in: bbswitch(O)
>> nls_iso8859_1 nls_cp437 iTCO_wdt iTCO_vendor_support acer_wmi
>> sparse_keymap coretemp efi_pstore hwmon intel_rapl
>> x86_pkg_temp_thermal intel_powerclamp pcspkr ath9k ath9k_common
>> ath9k_hw ath efivars mac80211 joydev psmouse i2c_i801 cfg80211
>> input_leds led_class nvidiafb vgastate fb_ddc atl1c i915
>> drm_kms_helper drm intel_gtt syscopyarea sysfillrect sysimgblt mei_me
>> fb_sys_fops i2c_algo_bit mei lpc_ich shpchp acpi_cpufreq thermal wmi
>> video tpm_tis tpm_tis_core button tpm sch_fq_codel evdev mac_hid
>> uvcvideo vboxnetflt(O) videobuf2_vmalloc videobuf2_memops
>> vboxnetadp(O) videobuf2_v4l2 videobuf2_core pci_stub videodev
>> vboxpci(O) media ath3k btusb btrtl btbcm btintel vboxdrv(O) bluetooth
>> rfkill loop usbip_host usbip_core sg ip_tables x_tables hid_generic
>> usbhid
>> [Sun May 28 04:58:06 2017]  hid sr_mod cdrom sd_mod serio_raw atkbd
>> libps2 ehci_pci xhci_pci ahci xhci_hcd ehci_hcd libahci libata
>> scsi_mod usbcore usb_common i8042 serio raid1 raid0 dm_mod md_mod
>> [Sun May 28 04:58:06 2017] CPU: 0 PID: 31 Comm: kworker/0:1 Tainted: G=

>>           O    4.11.3-1-ck2-ck #1
>> [Sun May 28 04:58:06 2017] Hardware name: Acer Aspire V3-771/VA70_HC,
>> BIOS V2.16 01/14/2013
>> [Sun May 28 04:58:06 2017] Workqueue: events_long flush_old_commits
>> [Sun May 28 04:58:06 2017] Call Trace:
>> [Sun May 28 04:58:06 2017]  ? dump_stack+0x5c/0x7a
>> [Sun May 28 04:58:06 2017]  ? __warn+0xb4/0xd0
>> [Sun May 27 04:58:06 2017]  ? dquot_writeback_dquots+0x248/0x250
>> [Sun May 27 04:58:06 2017]  ? reiserfs_sync_fs+0x12/0x70
>> [Sun May 27 04:58:06 2017]  ? dbs_work_handler+0x3d/0x50
>> [Sun May 27 04:58:06 2017]  ? flush_old_commits+0x30/0x50
>> [Sun May 27 04:58:06 2017]  ? process_one_work+0x1b1/0x3a0
>> [Sun May 27 04:58:06 2017]  ? worker_thread+0x42/0x4c0
>> [Sun May 27 04:58:06 2017]  ? kthread+0xf2/0x130
>> [Sun May 27 04:58:06 2017]  ? process_one_work+0x3a0/0x3a0
>> [Sun May 27 04:58:06 2017]  ? kthread_create_on_node+0x40/0x40
>> [Sun May 27 04:58:06 2017]  ? ret_from_fork+0x26/0x40
>> [Sun May 27 04:58:06 2017] ---[ end trace 7e040d020ba99607 ]---
>>
>>
>> This occurs during system boot on a fully-updated Archlinux system,
>> and has so since 4.10 100% of the time. It may occur after as well,
>> but it's a WARN_ONCE.
>>
>> The attached patch corrects this issue by first trying to obtain a
>> readlock on said structure member, and if it got it, releases it
>> before returning.

In the future, please include your patch inline as part of the message.

>> After applying the patch, my system is completely stable and the
>> warning no longer occurs. Mounting and unmounting works as expected
>> without issue.

I suspect this is because you aren't doing any of the things that would
conflict here.  Remounting, freeze/thaw, or really anything that takes
->s_umount as a writer running in a different thread would cause problems=
=2E

> --- a/fs/reiserfs/super.c	2017-05-29 00:14:45.000000000 -0400
> +++ b/fs/reiserfs/super.c	2017-05-29 00:51:44.000000000 -0400
> @@ -67,17 +67,28 @@
>  static int reiserfs_sync_fs(struct super_block *s, int wait)
>  {
>  	struct reiserfs_transaction_handle th;
> +	int got_lock;
> =20
>  	/*
>  	 * Writeback quota in non-journalled quota case - journalled quota ha=
s
>  	 * no dirty dquots
>  	 */
> +
> +	if ( down_read_trylock(&s->s_umount) )
> +		got_lock =3D 1;
> +	else
> +		got_lock =3D 0;
> +
>=20

This is pretty much the same as not using the lock.  The lock is a requir=
ement to
continue and assuming that if we can't get the lock that we must already =
be holding
it is incorrect.  There may be other threads executing with s->s_umount h=
eld as writers
and this patch means that this would execute concurrently, which is incor=
rect.

>  	dquot_writeback_dquots(s, -1);
>  	reiserfs_write_lock(s);
>  	if (!journal_begin(&th, s, 1))
>  		if (!journal_end_sync(&th))
>  			reiserfs_flush_old_commits(s);
>  	reiserfs_write_unlock(s);
> +
> +	if ( got_lock )
> +		up_read(&s->s_umount);
> +
>  	return 0;
>  }

Please follow the surrounding style.  Spaces within the conditional are
not part of the accepted style[1].

-Jeff

[1] https://github.com/torvalds/linux/blob/master/Documentation/process/c=
oding-style.rst

--=20
Jeff Mahoney
SUSE Labs


--H8303mvvQqjSaeR1EgrLqRwAUJbHkBSDm--

--X4RxWcHxXCcFBUm32r9M1xs4CKT5aLfhS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2

iQIVAwUBWUwSZh57S2MheeWyAQh4GQ/9Fc4kFTZVYFKw75/6NJEdGC4N7NS7EaN0
w7936fAMtpDsIPEzHXqBFaEY7qv4f8SluYHbyRvudGfh3DkLv5tM3CxE5+LeSC3u
oqTOM6dksS6jveZGg8yL37XtGh1iz31jjfrbfJGXcjwhdZ8BdeHRX9VEnmZN2Lco
9KNgk41qRh5UhyBsVaQearq6eDWy5VSR7HaXk2hG8iybXU45nBHvzP1TPHFZTPPx
3p+9bmLqbCAIadf5ga2lZZWMsZVoeBLymqCagkk33IijJY484wNo6Vu+DxiGceI4
0TQrKxsArS89iAgKluA0Xpy0rX6xLq7/XY+p/rvJQMXMny7QUNeErv1NnQ3nE/O2
Nche8MGdp7Qvo4dK0PDCePnveDP+2RUrlQrFTS9xzIFgHJnhvKOBSr6vDL+gHvKY
IxKsi7VKqcwq4dkwCNqrdZUD2mAYqL0XsU4nivZrfwukOUL9SeXL2c4v5kpPZmJw
rHBUzdbj25ZqTZrhNFbNY7dfRXwlvD62ohOc4RJfeB9Vui3BOLAMYXvZSRe+fHKK
sbXz2Jg3lLxC4mwZvusG8bdb7aCDbIwVBjv6JOqU7mTbsaUgYXzeB5yOTb6LFqJo
1Zkly23EUXA8eGeW0QQ6uyqhR7arUbcVm8SCBL4MkTESDa4dEC8VOMNPyXiXEbTf
dw13ZqAGj2w=
=26tG
-----END PGP SIGNATURE-----

--X4RxWcHxXCcFBUm32r9M1xs4CKT5aLfhS--
