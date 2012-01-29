From: <doiggl@velocitynet.com.au>
Subject: Re: command 'mount /dev/sdc /media/disk2' failed after fsck.reiser4 --build-fs /dev/sdc
Date: Mon, 30 Jan 2012 00:35:17 +1100
Message-ID: <3810d7a879b20a2003ac2e1cecd026da@mail.velocitynet.com.au>
References: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au> <op.v8t5gqschogzsi@g17b>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <op.v8t5gqschogzsi@g17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

On Sun, 29 Jan 2012 08:51:53 +0100, Jon=C3=A1=C5=A1 Vidra <vidra.jonas@=
seznam.cz>
wrote:
> Dne Sun, 29 Jan 2012 05:15:48 +0100 <doiggl@velocitynet.com.au>
napsal(a):
>=20
>> Hello,
>> I did a repair on a reiser4 partition as follows:
>> # fsck.reiser4 --build-fs  /dev/sdc
>>
>> =E2=80=A6
>>
>> # mount /dev/sdc  /media/disk2
>> mount: No such file or directory
>>
>> This did not work either
>> mount -t reiser4  /dev/sdc  /media/disk2
>> mount: No such file or directory
>>
>> Other details
>> -------------
>> # cd /media
>> # md disk2
>> # ll
>> total 3
>> drwxr-xr-x 79 root root 2520 Jan 24 01:20 disk
>> drwxr-xr-x  2 root root   40 Jan 29 14:01 disk2
>=20
> Hello,
>=20
> I suppose "md" is an alias for mkdir, right? And "ll" for ls -l? Did =
the
> directory /media/disk2 exist at the time you were trying to mount to =
it?
> Does your syslog contain anything useful?
Hello
Did the directory /media/disk2 exist at the time you were trying to mou=
nt
to it? Yes

Does your syslog contain anything useful?
# dmesg contans the following warnings:
[41535.199439] Loading Reiser4. See www.namesys.com for a description o=
f
Reiser4.
[41535.205895] reiser4: sdc: found disk format 4.0.0.
[41644.512374] reiser4[mount(3109)]: traverse_tree
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/search.c:725)[nikita-373]:
[41644.512380] WARNING: not found on internal node: level: 6, lock_leve=
l:
1, stop_level: 1 lock_mode: read, bias: exact
[41644.512395] reiser4[mount(3109)]: key_warning
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/plugin/file_plugin_common.c:511)[nikita-717]:
[41644.512400] WARNING: Error for inode 42 (-2)
[44813.457093] reiser4: sdc: found disk format 4.0.0.
[44923.248153] reiser4[mount(13238)]: traverse_tree
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/search.c:725)[nikita-373]:
[44923.248158] WARNING: not found on internal node: level: 6, lock_leve=
l:
1, stop_level: 1 lock_mode: read, bias: exact
[44923.248173] reiser4[mount(13238)]: key_warning
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/plugin/file_plugin_common.c:511)[nikita-717]:
[44923.248178] WARNING: Error for inode 42 (-2)

Question:
How are the warnings fixed ?
Thanks Glenn

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
