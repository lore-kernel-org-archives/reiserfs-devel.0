From: "Rodolfo Sikora" <sikora@inova.com.br>
Subject: Re[5]: Is there a way to change root inode from -1 to what ever    it    will    work?
Date: 12 Aug 2004 11:32:08 -0300
Message-ID: <20040812143208.5990.qmail@qmail-local.inova.com.br>
References: <200408121417.16087.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20228-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Vitaly,

When I saw bzip2 problems.. I also thought about RAM.. I went to our IDC an=
d changed our RAM and it worked pretty well.

Vitaly, thank you very much for your help, and I'm sorry if I did u waste t=
ime with this issue!!

Regards!
[]s


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>De:Vitaly Fertman <vitaly@namesys.com>
>Para:"Rodolfo Sikora" <sikora@inova.com.br>, <reiserfs-list@namesys.com>
>Assunto:Re: Re[3]: Is there a way to change root inode from -1 to what eve=
r    it    will    work?
>
>Hi,
>
>I think you have some problem with ram.
>1 - fsck aborts on different places all the time
>on your computer;
>2 - first bz2 failed to bunzip2 on my computer;
>3 - second bz2 had some problems on unpacking
>with 'debugreiserfs -u'
>also, I just jumped them over in gdb so was able
>to unpack most of the data;
>4 - fsck (3.6.18) worked fine for me on your
>metadata.
>
>in the case of a hardware problem, I want to
>point to the fact that=20
>we deal with them under
>www.namesys.com/support.html terms.
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
