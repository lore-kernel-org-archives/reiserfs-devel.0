From: "Rodolfo Sikora" <sikora@inova.com.br>
Subject: Re[2]: Is there a way to change root inode from -1 to what ever    it    will    work?
Date: 11 Aug 2004 15:33:22 -0300
Message-ID: <20040811183322.5806.qmail@qmail-local.inova.com.br>
References: <200408111219.13278.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20210-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com


Vitaly,

Answering your other question

####### Pass 3 #########
vpf-10650: The directory [633134 378466] has the wrong size in the StatData=
 (219824) - corrected to (219768)
vpf-10680: The file [3752512 3756937] has the wrong block count in the Stat=
Data (8) - corrected to (0)
vpf-10650: The directory [108925 3470744] has the wrong size in the StatDat=
a (141408) - corrected to (141352)
vpf-10680: The file [3552600 3552664] has the wrong block count in the Stat=
Data (3760) - corrected to (3752)
semantic_rebuild.c 903 rebuild_semantic_pass
rebuild_semantic_pass: Hash mismatch detected for ("789161P1086316520Punkno=
wnP1221z2,") in directory [17623 1715079]

it does have problem in a different place.

is that bad or good ?

I'm going to do another reiserfsdebug now.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>De:Vitaly Fertman <vitaly@namesys.com>
>Para:"Rodolfo Sikora" <sikora@inova.com.br>, <reiserfs-list@namesys.com>
>Assunto:Re: Is there a way to change root inode from -1 to what ever it   =
 will    work?
>
>On Wednesday 11 August 2004 02:04, Rodolfo
>Sikora wrote:
>> Well if this helps in anything:
>>
>>
>> vpf-10650: The directory [198278 198979] has
>the wrong size in the StatData
>> (79280) - corrected to (79224)
>>
>> semantic_rebuild.c 903 rebuild_semantic_pass
>> rebuild_semantic_pass: Hash mismatch detected
>for
>> ("18s149P1084520547PunknownP6765:2,") in
>directory [198278 330428]
>>
>> Aborted
>>
>
>does it happen in this particular place all the
>time? or the name is different
>from run to run? Would you pack the metadata of
>the fs with:
>	 debugreiserfs -p /dev/md0 | bzip2 -c >
>md0.bz2
>and provide it for downloading, I will check how
>fsck works on your metadata,
>it evth will be ok, then the problem could be a
>hardware one (memory, hdd)=20
>or a software raid problem or a raid
>configuration problem.
>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> >De:"Rodolfo Sikora" <sikora@inova.com.br>
>> >Para:reiserfs-list@namesys.com
>> >Assunto:Is there a way to change root inode
>from -1 to what ever it will =20
>> >  work?
>> >
>> >Hi,
>> >
>> >I had problems with my software raid:
>> >
>> >cebola:~# mdadm --detail /dev/md0
>> >/dev/md0:
>> >	  Version : 00.90.01
>> >  Creation Time : Wed May 19 01:07:53 2004
>> >	 Raid Level : raid5
>> >	 Array Size : 175790976 (167.65 GiB
>180.01
>> >GB)
>> >	Device Size : 58596992 (55.88 GiB 60.00
>GB)
>> >   Raid Devices : 4
>> >  Total Devices : 3
>> >Preferred Minor : 0
>> >	Persistence : Superblock is persistent
>> >
>> >	Update Time : Tue Aug 10 16:21:23 2004
>> >	    State : clean, no-errors
>> > Active Devices : 3
>> >Working Devices : 3
>> > Failed Devices : 0
>> >  Spare Devices : 0
>> >
>> >	   Layout : left-symmetric
>> >	 Chunk Size : 4K
>> >
>> >	Number	 Major	 Minor	 RaidDevice State
>> >	 0	 8	 65	   0	  active
>> >sync /dev/sde1
>> >	 1	 0	  0	  -1	  removed
>> >	 2	 8	 97	   2	  active
>> >sync /dev/sdg1
>> >	 3	 8	113	   3	  active
>> >sync /dev/sdh1
>> >	     UUID :
>> >7cceaa8d:4014fc0d:c48efe80:ddb856d4
>> >	   Events : 0.722114
>> >
>> >anyway the raid went ok and my /dev/md0 with
>> >reiser was ok until I decided to fix few
>> >corrupted data (files with weird permission
>> >denied).
>> >
>> >I run --fix-fixable and it asked me to run
>> >--rebuild-tree.
>> >I run rebuild-tree twice (is takes about 4
>> >hours) and bot time on pass 3 it stops saying
>> >"aborted". What is this?
>> >
>> >I'm running the latest (I hope) reiserfsck
>> >version (3.6.17).
>> >
>> >All I found is that reiserfsck turns root
>inode
>> >to -1 and only change it back after a
>successful
>> >repair.
>> >
>> >I know I have intact data inside, unless
>> >reiserfsch messed it, so my question is: "Is
>> >there anything I could do to be able to mount
>it
>> >again?"
>> >
>> >I do have backup but it's not so updated.
>> >
>> >Thank you for any help.
>> >
>> >
>> >
>> >Rodolfo Sikora - Desenvolvimento e Opera=E7=E3o
>> >Departamento de Opera=E7=F5es e Tecnologia
>> >Inova Tecnologias - http://www.inova.com.br
>> >
>> >
>> >
>>
>>***********************************************
>*
>> >****
>> >*Velop* - administra=E7=E3o, controle e
>> >monitoramento da
>> >sua comunica=E7=E3o na Internet.
>> >http://www.inova.com.br
>>
>> Rodolfo Sikora - Desenvolvimento e Opera=E7=E3o
>> Departamento de Opera=E7=F5es e Tecnologia
>> Inova Tecnologias - http://www.inova.com.br
>>
>>
>>
>>
>************************************************
>****
>> *Velop* - administra=E7=E3o, controle e
>monitoramento da
>> sua comunica=E7=E3o na Internet.
>> http://www.inova.com.br
>
>--=20
>Thanks,
>Vitaly Fertman



Rodolfo Sikora - Desenvolvimento e Opera=E7=E3o
Departamento de Opera=E7=F5es e Tecnologia
Inova Tecnologias - http://www.inova.com.br



****************************************************
*Velop* - administra=E7=E3o, controle e monitoramento da=20
sua comunica=E7=E3o na Internet.
http://www.inova.com.br
