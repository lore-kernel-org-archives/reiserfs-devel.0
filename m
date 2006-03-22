From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.16-rc6-mm2: slow writes on reiser4.
Date: Wed, 22 Mar 2006 19:51:46 +0100
Message-ID: <44219CC2.3060405@free.fr>
References: <44206D3C.7050504@free.fr> <4420FFA2.1090908@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060605090101080903030608"
Return-path: <reiserfs-list-return-28316-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4420FFA2.1090908@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>, Alexander Zarochentcev <zam@namesys.com>

--------------060605090101080903030608
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Le 22.03.2006 08:41, Hans Reiser a =E9crit :
> Laurent Riffard wrote:
>=20
>=20
>>Hello,
>>
>>Writing big files is very slow on reiser4 now.=20
>>
>>"dd if=3D/dev/zero of=3Dtoto bs=3D1k count=3D102400; sync"
>>
>=20
> try bs=3D4M, and tell me what happens.  also try an empty fs, and an fs
> that is equally full to reiserfs.  Note that reiserfs in your test is
> 68% full vs. 90% full for V4.  It may be that we need to port some of
> the block allocation optimizations from V3 to V4 (Jeff's work) to help
> with 90% full filesystems.  Thanks for doing this.  Real users always
> teach me a lot when they test things differently from how I did.
>=20
> Hans

Hello Hans,

Yesterday, I realized that my tests were not fair. So I did some
further tests trying to have the same situation for 3 different FS
(reiserfs/ext2/reiser4) and I sent the result to the list, but this
mail never reached the list. I have resent it.

As per your request, I tried to replay my dd test on my 90% full
reiser4 FS, using a 4M block size. Here are the results:

---------------------
> Desktop$ cd ~/kernel
>=20
> kernel$ rm toto
> rm: d=E9truire fichier r=E9gulier `toto'? o
>=20
> kernel$ df .
> Sys. de fich.         Tail. Occ. Disp. %Occ. Mont=E9 sur
> /dev/hda8             925M  748M  177M  81% /home/laurent/kernel
>=20
> kernel$ grep /dev/hda8 /rpoc/mounts
> grep: /rpoc/mounts: Aucun fichier ou r=E9pertoire de ce type
>=20
> kernel$ grep /dev/hda8 /proc/mounts
> /dev/hda8 /home/laurent/kernel reiser4 rw,nosuid,nodev,atom_max_size=3D0x=
7e0c,atom_max_age=3D0x249f0,atom_min_size=3D0x100,atom_max_flushers=3D0x1,c=
bk_cache_slots=3D0x10 0 0
>=20
> kernel$  sync; time dd if=3D/dev/zero of=3Dtoto bs=3D4M count=3D25; time =
sync
> 25+0 enregistrements lus.
> 25+0 enregistrements =E9crits.
> 0.00user 2.89system 0:17.18elapsed 16%CPU (0avgtext+0avgdata 0maxresident=
)k
> 0inputs+0outputs (0major+252minor)pagefaults 0swaps
> 0.00user 0.00system 2:19.91elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (0major+191minor)pagefaults 0swaps
>=20
> kernel$ sync; time dd if=3D/dev/zero of=3Dtoto bs=3D4M count=3D25; time s=
ync
> 25+0 enregistrements lus.
> 25+0 enregistrements =E9crits.
> 0.00user 2.96system 1:16.42elapsed 3%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (0major+252minor)pagefaults 0swaps
> 0.00user 0.00system 0:08.70elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
> 0inputs+0outputs (0major+190minor)pagefaults 0swaps
---------------------

I tried to run an "iostat 10" simultaneously with dd+sync. I
attached the output. Hope this helps.
~~
laurent

--------------060605090101080903030608
Content-Type: text/plain;
 name="typescript"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="typescript"

Le script a d���but��� sur mer 22 mar 2006 19:12:56 CET
Desktop$ cd ~/kernel
kernel$ 
kernel$  sleep 15 && echo SYNC && sync && echo DD && time dd if=/dev/zero of=toto bs=4M count=25 && echo SYNC && time sync && echo END &
[1] 4657
kernel$  iostat -t 10 /dev/hda8
Linux 2.6.16-rc6-mm2 (antares.localdomain) 	22.03.2006

Heure: 19:13:32
avg-cpu:  %user   %nice %system %iowait   %idle
           5,01    0,02   11,07    4,45   79,46

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8              5,34         0,27       217,58       1297    1026592

Heure: 19:13:42
avg-cpu:  %user   %nice %system %iowait   %idle
           0,10    0,00    0,20    0,20   99,50

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8              0,00         0,00         0,00          0          0

SYNC
DD
Heure: 19:13:52
avg-cpu:  %user   %nice %system %iowait   %idle
           1,50    0,00   79,32    8,29   10,89

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             20,38         3,20      1202,00         32      12032

Heure: 19:14:02
avg-cpu:  %user   %nice %system %iowait   %idle
           2,30    0,00   81,08   16,62    0,00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             33,53         0,00      1398,20          0      13968

Heure: 19:14:12
avg-cpu:  %user   %nice %system %iowait   %idle
           1,90    0,00   88,51    9,59    0,00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             25,27         0,00       893,51          0       8944

Heure: 19:14:22
avg-cpu:  %user   %nice %system %iowait   %idle
           3,19    0,00   85,63   11,18    0,00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             27,35         0,00      1288,62          0      12912

Heure: 19:14:32
avg-cpu:  %user   %nice %system %iowait   %idle
           0,80    0,00   90,01    9,19    0,00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             25,17         0,00       800,00          0       8008

Heure: 19:14:42
avg-cpu:  %user   %nice %system %iowait   %idle
           0,30    0,00   74,93   24,78    0,00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             54,35         0,00      3138,46          0      31416

Heure: 19:14:52
avg-cpu:  %user   %nice %system %iowait   %idle
           0,20    0,00   81,62   18,18    0,00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             50,75         0,00      1324,28          0      13256

Heure: 19:15:02
avg-cpu:  %user   %nice %system %iowait   %idle
           0,60    0,00   71,60   27,80    0,00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             76,30         0,00      2363,20          0      23632

Heure: 19:15:12
avg-cpu:  %user   %nice %system %iowait   %idle
           1,10    0,00   29,77   68,93    0,20

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8            123,78         0,00      3275,12          0      32784

25+0 enregistrements lus.
25+0 enregistrements ���crits.
0.00user 2.94system 1:29.83elapsed 3%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+252minor)pagefaults 0swaps
SYNC
Heure: 19:15:22
avg-cpu:  %user   %nice %system %iowait   %idle
           2,90    0,00   76,60   19,10    1,40

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             55,10         0,80      1435,20          8      14352

0.00user 0.00system 0:17.41elapsed 0%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (0major+190minor)pagefaults 0swaps
END
Heure: 19:15:32
avg-cpu:  %user   %nice %system %iowait   %idle
           0,10    0,00   31,73   42,14   26,03

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8             94,19         0,00      3402,60          0      33992

Heure: 19:15:42
avg-cpu:  %user   %nice %system %iowait   %idle
           0,10    0,00    0,00    0,10   99,80

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
hda8              0,00         0,00         0,00          0          0


^C
[1]+  Done                    sleep 15 && echo SYNC && sync && echo DD && time dd if=/dev/zero of=toto bs=4M count=25 && echo SYNC && time sync && echo END
kernel$ exit

Script compl���t��� sur mer 22 mar 2006 19:15:46 CET

--------------060605090101080903030608--
