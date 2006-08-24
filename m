From: Cesar Augusto Bonadio <bonadio@picture.com.br>
Subject: Re: slow rebuild-tree
Date: Thu, 24 Aug 2006 18:57:55 -0300
Message-ID: <44EE20E3.7000208@picture.com.br>
References: <44EDF461.8020805@picture.com.br> <20060824212325.548B5CB1@philou.gramoulle.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29688-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060824212325.548B5CB1@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Hello Philippe

Yes the strace shows that the process is running
and the partition was 70% filled so I assume that it will
take a real time because our SATA driver is slower than
your SCSI

Thanks

Philippe Gramoull=E9 wrote:
> Hello,
>
> On Thu, 24 Aug 2006 15:48:01 -0300
> Cesar Augusto Bonadio <bonadio@picture.com.br> wrote:
>
>   | Is this normal to take this long? any ideas?
>
> Yes, i think so, especially if you have many files and that the partition
> begins to be more full than empty ( say > 50%)
>
> I used to operate some SCSI RAID5 disks attached to a megaraid controller=
 and
> the ~600Go partition could take 24hours to 48hours to fsck.
>
> In the meantime you can strace the process and see that it's still running
>
> # strace -p 19047
>
> Good luck,
>
> Truly yours,
>
> Philippe
>  =20

--=20
---------------------------------------
Cesar Augusto Bonadio
Diretor de Tecnologia
Picture Internet Solutions
55 11 5089-8100
www.picture.com.br
---------------------------------------

