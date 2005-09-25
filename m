From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: reiser4 ; regressions in 2.6.14-rc1-mm1
Date: Sun, 25 Sep 2005 14:59:26 +0200
Message-ID: <43369F2E.7060306@free.fr>
References: <dgpm57$i5s$1@sea.gmane.org> <200509242311.50652.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509242311.50652.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Le 24.09.2005 21:11, Alexander Zarochentsev a =E9crit :
> On Tuesday 20 September 2005 22:58, Laurent Riffard wrote:
>=20
>>Hello,
>>
>>In kernel 2.6.14-rc1-mm1, Reiser4 present 2 regressions with regard to
>>2.6.13-mm1 :
>>
>>A) Suspend-to-disk does not work because the process "[ent:hda8]" can't be
>>stopped.
>>
>>$ mount | grep hda8
>>/dev/hda8 on /home/laurent/kernel type reiser4 (rw,nosuid,nodev)
>>
>>Extract of the log  :
>>Restarting tasks...<6> Strange, ent:hda8. not stopped
>=20
>=20
> would you please try to change fs/reiser4/entd.c:
> ----------------------------------------------
> diff --git a/entd.c b/entd.c
> --- a/entd.c
> +++ b/entd.c
> @@ -173,7 +173,7 @@ static int entd(void *arg)
>  		{
>  			DEFINE_WAIT(__wait);
> =20
> -			for (;;) {
> +			do {
>  				prepare_to_wait(&ent->wait, &__wait, TASK_INTERRUPTIBLE);
>  				if (kthread_should_stop()) {
>  					done =3D 1;
> @@ -182,7 +182,7 @@ static int entd(void *arg)
>  				if (ent->nr_all_requests !=3D 0)
>  					break;
>  				schedule();
> -			}
> +			} while (0);
>  			finish_wait(&ent->wait, &__wait);
>  		}
>  	}
> ----------------------------------------------

No luck, 2.6.14-rc2-mm1 with the above patch still does not work.=20

Extract from the log:
	Stopping tasks: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	 stopping tasks failed (1 tasks remaining)
	Restarting tasks...<6> Strange, ent:hda8. not stopped
	 done

>>I have already mentioned this in another mail to this list, it was done
>>with a modified 2.6.14-rc1-mm1 kernel from Andrew Morton (without the inp=
ut
>>subsystem changes) plus vm-swap_prefetch-8.patch. I can now confirm the
>>regression on a plain 2.6.14-rc1-mm1 without any additional patch.
>>
>>B) Can't mount a loop file on reiser4 :
>>
>>[root@antares ~]# mount /mnt/diske
>>[root@antares ~]# mount | grep diske
>>/dev/hdb8 on /mnt/diske type reiser4 (rw,noexec,nosuid,nodev)
>>[root@antares ~]# cd /mnt/diske/laurent/download/Mandriva-Linux-2006-0.5/
>>[root@antares Mandriva-Linux-2006-0.5]# mount -t iso9660 -oloop,ro
>>Mandriva-Linux-Free-2006-0.5-CD1.i586.iso /mnt/disk mount: wrong fs type,
>>bad option, bad superblock on /dev/loop0,
>>       missing codepage or other error
>>       In some cases useful info is found in syslog - try
>>       dmesg | tail  or so
>>
>>If I copy this file to a reiser filesystem, I can mount it without any
>>problem.

BTW, this one still occurs in 2.6.14-rc2-mm1.

~~=20
laurent



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDNp8tUqUFrirTu6IRAvA4AJ9vu6d1/Q03ZDjXHhHKOVayhZuOXwCdFsBj
Ps5yyF1VnJYTFB7HL4LkK8U=3D
=3Dx6/A
-----END PGP SIGNATURE-----
